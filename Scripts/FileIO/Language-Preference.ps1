<#
    .SYNOPSIS
        Discovers the language packs that ship with Win11Debloat and resolves which one to use.

    .DESCRIPTION
        Kept separate from Import-LanguageFile.ps1 because the language decision has to happen
        before the script paths are defined, while Import-LanguageFile.ps1 is dot-sourced much
        later with the other file I/O helpers. Only uses built-in cmdlets so it can be loaded early.
#>

function Get-LanguageCatalog {
    param(
        [string]$LanguagesPath = $script:LanguagesPath
    )

    if ([string]::IsNullOrWhiteSpace($LanguagesPath) -or -not (Test-Path -LiteralPath $LanguagesPath -PathType Container)) {
        return @()
    }

    $catalogPath = Join-Path $LanguagesPath 'languages.json'
    $catalogEntries = @()
    if (Test-Path -LiteralPath $catalogPath) {
        try {
            # Assign first, then wrap: @( <pipeline> ) around ConvertFrom-Json nests the whole array
            # on Windows PowerShell 5.1, which would silently leave every entry unread.
            $parsedCatalog = Get-Content -LiteralPath $catalogPath -Raw -Encoding UTF8 | ConvertFrom-Json
            $catalogEntries = @($parsedCatalog)
        }
        catch {
            Write-Warning "Unable to read '$catalogPath': $($_.Exception.Message)"
            $catalogEntries = @()
        }
    }

    $catalog = New-Object System.Collections.Generic.List[object]
    $knownCodes = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)

    foreach ($entry in $catalogEntries) {
        $code = [string]$entry.Code
        if ([string]::IsNullOrWhiteSpace($code)) { continue }
        # A language that is listed but not shipped (e.g. a partial download) must not show up in the menu.
        if (-not (Test-Path -LiteralPath (Join-Path $LanguagesPath $code) -PathType Container)) { continue }
        if (-not $knownCodes.Add($code)) { continue }

        $nativeName = [string]$entry.NativeName
        if ([string]::IsNullOrWhiteSpace($nativeName)) { $nativeName = $code }

        $catalog.Add([PSCustomObject]@{ Code = $code; NativeName = $nativeName })
    }

    # Language folders that are not listed in languages.json stay selectable, so a language pack
    # can be dropped in without editing the catalog.
    foreach ($folder in @(Get-ChildItem -LiteralPath $LanguagesPath -Directory -ErrorAction SilentlyContinue)) {
        if (-not $knownCodes.Add($folder.Name)) { continue }
        $catalog.Add([PSCustomObject]@{ Code = $folder.Name; NativeName = $folder.Name })
    }

    return $catalog.ToArray()
}

<#
    .SYNOPSIS
        Reads the language the user picked in the GUI, or $null when nothing has been saved yet.
#>
function Get-SavedLanguageCode {
    param(
        [string]$SettingsPath = $script:LanguageSettingsPath
    )

    if ([string]::IsNullOrWhiteSpace($SettingsPath) -or -not (Test-Path -LiteralPath $SettingsPath)) {
        return $null
    }

    try {
        $settings = Get-Content -LiteralPath $SettingsPath -Raw -Encoding UTF8 | ConvertFrom-Json
        if (-not [string]::IsNullOrWhiteSpace([string]$settings.LanguageCode)) {
            return [string]$settings.LanguageCode
        }
    }
    catch {
        Write-Warning "Unable to read the saved language preference: $($_.Exception.Message)"
    }

    return $null
}

<#
    .SYNOPSIS
        Stores the language the user picked in the GUI so it survives the next launch.
#>
function Set-SavedLanguageCode {
    param(
        [Parameter(Mandatory)]
        [string]$LanguageCode,
        [string]$SettingsPath = $script:LanguageSettingsPath
    )

    if ([string]::IsNullOrWhiteSpace($SettingsPath)) {
        return
    }

    $payload = [ordered]@{
        Version      = '1.0'
        LanguageCode = $LanguageCode
    } | ConvertTo-Json

    try {
        Set-Content -LiteralPath $SettingsPath -Value $payload -Encoding UTF8 -Force
    }
    catch {
        Write-Warning "Unable to save the language preference: $($_.Exception.Message)"
    }
}

<#
    .SYNOPSIS
        Resolves the language code to start with.

    .DESCRIPTION
        Precedence: the -Language parameter, then the language saved by the GUI language menu, then
        the Windows display language. A code that is not shipped falls back to a language with the
        same prefix (for example 'de-AT' to 'de-DE') and finally to en-US, so an unsupported locale
        never results in an empty GUI.
#>
function Resolve-PreferredLanguageCode {
    param(
        [string]$RequestedLanguage,
        [string]$LanguagesPath = $script:LanguagesPath,
        [string]$SettingsPath = $script:LanguageSettingsPath
    )

    $availableCodes = @(Get-LanguageCatalog -LanguagesPath $LanguagesPath | ForEach-Object { $_.Code })

    $candidates = @(
        $RequestedLanguage,
        (Get-SavedLanguageCode -SettingsPath $SettingsPath),
        [System.Globalization.CultureInfo]::CurrentUICulture.Name,
        'en-US'
    )

    foreach ($candidate in $candidates) {
        if ([string]::IsNullOrWhiteSpace($candidate)) { continue }
        if ($availableCodes -contains $candidate) { return $candidate }

        $languagePrefix = ($candidate -split '-')[0]
        $prefixMatch = @($availableCodes | Where-Object { $_ -like "$languagePrefix-*" } | Select-Object -First 1)
        if ($prefixMatch.Count -gt 0) { return $prefixMatch[0] }
    }

    return 'en-US'
}

<#
    .SYNOPSIS
        Loads a language pack into $script:Lang and optionally persists the choice and repoints the app list.

    .DESCRIPTION
        Wraps Import-LanguageFile so the callers (startup and the GUI language menu) never have to
        repeat the resolution, App list path and preference-file handling.
#>
function Set-ActiveLanguage {
    param(
        [string]$LanguageCode,
        [switch]$Persist,
        [switch]$UpdateAppList
    )

    $resolvedCode = Resolve-PreferredLanguageCode -RequestedLanguage $LanguageCode
    $lang = Import-LanguageFile -LanguageCode $resolvedCode

    if ($lang) {
        $script:Lang = $lang
        $script:ActiveLanguageCode = $lang.LanguageCode
    }

    if ($UpdateAppList -and $script:ActiveLanguageCode) {
        $script:AppsListFilePath = Join-Path (Join-Path $script:LanguagesPath $script:ActiveLanguageCode) 'Apps.json'
    }

    if ($Persist -and $script:ActiveLanguageCode) {
        Set-SavedLanguageCode -LanguageCode $script:ActiveLanguageCode
    }

    return $script:Lang
}
