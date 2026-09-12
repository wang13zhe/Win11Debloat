[CmdletBinding(SupportsShouldProcess)]
param (
    [switch]$CLI,
    [switch]$Silent,
    [switch]$Sysprep,
    [string]$LogPath,
    [string]$Language,
    [string]$User,
    [Alias('NoRestartExplorer')]
    [switch]$SkipExplorerRestart,
    [switch]$CreateRestorePoint,
    [switch]$SkipRegistryBackup,
    [switch]$RunDefaults,
    [switch]$RunDefaultsLite,
    [switch]$RunSavedSettings,
    [string]$Config,
    [string]$Apps,
    [string]$AppRemovalTarget,
    [switch]$RemoveApps,
    [switch]$RemoveGamingApps,
    [switch]$RemoveHPApps,
    [switch]$ForceRemoveEdge,
    [switch]$DisableDVR,
    [switch]$DisableGameBarIntegration,
    [switch]$EnableWindowsSandbox,
    [switch]$EnableWindowsSubsystemForLinux,
    [switch]$DisableTelemetry,
    [switch]$DisableSearchHistory,
    [switch]$DisableFastStartup,
    [switch]$DisableBitlockerAutoEncryption,
    [switch]$DisableModernStandbyNetworking,
    [switch]$DisableStorageSense,
    [switch]$DisableUpdateASAP,
    [switch]$PreventUpdateAutoReboot,
    [switch]$DisableDeliveryOptimization,
    [switch]$DisableDeviceAutoAppDownload,
    [switch]$DisableBing,
    [switch]$DisableNotifications,
    [switch]$DisableStoreSearchSuggestions,
    [switch]$DisableSearchHighlights,
    [switch]$DisableDesktopSpotlight,
    [switch]$HideDesktopSpotlightIcon,
    [switch]$EnableDesktopSpotlight,
    [switch]$DisableLockscreenTips,
    [switch]$DisableSuggestions,
    [switch]$DisableLocationServices,
    [switch]$DisableFindMyDevice,
    [switch]$DisableEdgeAds,
    [switch]$DisableBraveBloat,
    [switch]$DisableSettings365Ads,
    [switch]$DisableSettingsHome,
    [switch]$ShowHiddenFolders,
    [switch]$ShowKnownFileExt,
    [switch]$HideDupliDrive,
    [switch]$EnableDarkMode,
    [switch]$DisableTransparency,
    [switch]$DisableAnimations,
    [switch]$TaskbarAlignLeft,
    [switch]$CombineTaskbarAlways, [switch]$CombineTaskbarWhenFull, [switch]$CombineTaskbarNever,
    [switch]$CombineMMTaskbarAlways, [switch]$CombineMMTaskbarWhenFull, [switch]$CombineMMTaskbarNever,
    [switch]$MMTaskbarModeAll, [switch]$MMTaskbarModeMainActive, [switch]$MMTaskbarModeActive,
    [switch]$HideSearchTb, [switch]$ShowSearchIconTb, [switch]$ShowSearchLabelTb, [switch]$ShowSearchBoxTb,
    [switch]$HideTaskview,
    [switch]$DisableStartRecommended,
    [switch]$DisableStartAllApps, [switch]$StartAllAppsCategory, [switch]$StartAllAppsGrid, [switch]$StartAllAppsList,
    [switch]$DisableStartPhoneLink,
    [switch]$DisableCopilot,
    [switch]$DisableRecall,
    [switch]$DisableClickToDo,
    [switch]$DisableAISvcAutoStart,
    [switch]$DisablePaintAI,
    [switch]$DisableNotepadAI,
    [switch]$DisableEdgeAI,
    [switch]$DisableWidgets,
    [switch]$HideChat,
    [switch]$EnableEndTask,
    [switch]$EnableLastActiveClick,
    [switch]$ClearStart,
    [string]$ReplaceStart,
    [switch]$ClearStartAllUsers,
    [string]$ReplaceStartAllUsers,
    [switch]$RevertContextMenu,
    [switch]$DisableDragTray,
    [switch]$DisableMouseAcceleration,
    [switch]$DisableStickyKeys,
    [switch]$DisableWindowSnapping,
    [switch]$DisableSnapAssist,
    [switch]$DisableSnapLayouts,
    [switch]$HideTabsInAltTab, [switch]$Show3TabsInAltTab, [switch]$Show5TabsInAltTab, [switch]$Show20TabsInAltTab,
    [switch]$HideHome,
    [switch]$HideGallery,
    [switch]$ExplorerToHome,
    [switch]$ExplorerToThisPC,
    [switch]$ExplorerToDownloads,
    [switch]$ExplorerToOneDrive,
    [switch]$AddFoldersToThisPC,
    [switch]$HideOnedrive,
    [switch]$Hide3dObjects,
    [switch]$HideMusic,
    [switch]$HideIncludeInLibrary,
    [switch]$HideGiveAccessTo,
    [switch]$HideShare,
    [switch]$ShowDriveLettersFirst,
    [switch]$ShowDriveLettersLast,
    [switch]$ShowNetworkDriveLettersFirst,
    [switch]$HideDriveLetters
)

# Win11Debloat 依赖 Windows PowerShell 5.1 的 cmdlet（Appx 模块的 Get-AppxPackage /
# Remove-AppxPackage，以及 Get-ComputerRestorePoint），这些 cmdlet 在 PowerShell 7 (pwsh) 中无法加载，
# 因为 Appx 模块会报错 "Operation is not supported on this platform" (0x80131539)。如果没有此防护，
# 脚本会继续运行但静默地无法移除任何应用，同时仍报告成功。参见 issue #675。
if ($PSVersionTable.PSEdition -eq 'Core') {
    Write-Host "Win11Debloat 需要 Windows PowerShell 5.1，但当前运行在 PowerShell $($PSVersionTable.PSVersion) (pwsh / Core edition) 下。" -ForegroundColor Red
    Write-Host "应用移除和系统还原点依赖于 PowerShell 7 中不可用的模块，因此无法在此正确完成运行。" -ForegroundColor Red
    Write-Host "请改用 Windows PowerShell (powershell.exe) 重新运行此脚本。" -ForegroundColor Yellow
    exit 1
}

# 检查脚本是否以管理员身份运行
$isAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# 如果脚本未以管理员身份运行，询问用户是否允许
if (-not $isAdmin) {
    Write-Host "Win11Debloat 必须以管理员身份运行。" -ForegroundColor Red

    $choice = Read-Host "是否以管理员身份重新启动？(y/n)"

    if ($choice -match '^[Yy]$') {
        # 以 Win32 安全方式转义要传递给提升权限进程的参数
        function Format-ElevatedArg([string]$Value) {
            $escaped = $Value -replace '(\\*)"', '$1$1\"'
            $escaped = $escaped -replace '(\\+)$', '$1$1'
            return '"' + $escaped + '"'
        }

        $elevatedArgs = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", (Format-ElevatedArg $PSCommandPath))

        foreach ($paramName in $PSBoundParameters.Keys) {
            $paramValue = $PSBoundParameters[$paramName]

            if ($paramValue -is [System.Management.Automation.SwitchParameter]) {
                if ($paramValue.IsPresent) {
                    $elevatedArgs += "-$paramName"
                }
            }
            else {
                $elevatedArgs += "-$paramName"
                $elevatedArgs += (Format-ElevatedArg $paramValue)
            }
        }

        if ($MyInvocation.UnboundArguments.Count -gt 0) {
            foreach ($unboundArg in $MyInvocation.UnboundArguments) {
                $elevatedArgs += (Format-ElevatedArg "$unboundArg")
            }
        }

        try {
            Start-Process powershell -ArgumentList $elevatedArgs -Verb RunAs -ErrorAction Stop
        }
        catch {
            Write-Error "以管理员身份启动 Win11Debloat 失败：$_"
            Exit 1
        }

        Exit 0
    }

    Exit 1
}

# 定义脚本级变量和路径
$script:Version = "2026.08.24"
$configPath = Join-Path $PSScriptRoot 'Config'
$logsPath = Join-Path $PSScriptRoot 'Logs'
$schemasPath = Join-Path $PSScriptRoot 'Schemas'
$scriptsPath = Join-Path $PSScriptRoot 'Scripts'

# 1. 首先定义 LanguagesPath（其他路径依赖它）
$script:LanguagesPath = Join-Path $configPath 'Languages'

# 2. 根据系统语言动态确定 Apps.json 路径
$sysLang = [System.Globalization.CultureInfo]::CurrentUICulture.Name
if ($sysLang -like "zh-*") {
    $script:AppsListFilePath = Join-Path (Join-Path $script:LanguagesPath 'zh-CN') 'Apps.json'
} else {
    $script:AppsListFilePath = Join-Path (Join-Path $script:LanguagesPath 'en-US') 'Apps.json'
}

# 3. 定义所有剩余的路径变量
$script:DefaultLanguagePath = Join-Path $script:LanguagesPath 'en-US'
$script:DefaultSettingsFilePath = Join-Path $configPath 'DefaultSettings.json'
$script:FeaturesFilePath = Join-Path $configPath 'Features.json'
$script:SavedSettingsFilePath = Join-Path $configPath 'LastUsedSettings.json'
$script:DefaultLogPath = Join-Path $logsPath 'Win11Debloat.log'
$script:RegfilesPath = Join-Path $PSScriptRoot 'Regfiles'
$script:RegistryBackupsPath = Join-Path $PSScriptRoot 'Backups'
$script:AssetsPath = Join-Path $PSScriptRoot 'Assets'
$script:AppSelectionSchema = Join-Path $schemasPath 'AppSelectionWindow.xaml'
$script:MainWindowSchema = Join-Path $schemasPath 'MainWindow.xaml'
$script:MessageBoxSchema = Join-Path $schemasPath 'MessageBox.xaml'
$script:AboutWindowSchema = Join-Path $schemasPath 'AboutWindow.xaml'
$script:ApplyChangesWindowSchema = Join-Path $schemasPath 'ApplyChangesWindow.xaml'
$script:SharedStylesSchema = Join-Path $schemasPath 'SharedStyles.xaml'
$script:BubbleHintSchema = Join-Path $schemasPath 'BubbleHint.xaml'
$script:ImportExportConfigSchema = Join-Path $schemasPath 'ImportExportConfigWindow.xaml'
$script:RestoreBackupWindowSchema = Join-Path $schemasPath 'RestoreBackupWindow.xaml'
$script:LoadAppsDetailsScriptPath = Join-Path (Join-Path $scriptsPath 'FileIO') 'Import-AppDetailsFromJson.ps1'
$script:TestAppInWingetListScriptPath = Join-Path (Join-Path $scriptsPath 'AppRemoval') 'Test-AppInWingetList.ps1'

$script:ControlParams = 'WhatIf', 'Confirm', 'Verbose', 'Debug', 'LogPath', 'Language', 'Silent', 'Sysprep', 'User', 'SkipExplorerRestart', 'SkipRegistryBackup', 'RunDefaults', 'RunDefaultsLite', 'RunSavedSettings', 'Config', 'CLI', 'AppRemovalTarget'

# 用于 GUI 元素的脚本级变量
$script:GuiWindow = $null
$script:CancelRequested = $false
$script:ApplyProgressCallback = $null
$script:ApplySubStepCallback = $null
$script:RegistryImportFailures = 0
$script:AppRemovalFailures = 0
$script:AppRemovalVerificationUnavailable = $false

# 检查当前 PowerShell 环境是否受安全策略限制
if ($ExecutionContext.SessionState.LanguageMode -ne "FullLanguage") {
    Write-Error "Win11Debloat 无法在您的系统上运行，PowerShell 执行受安全策略限制"
    Write-Output "按任意键退出..."
    $null = [System.Console]::ReadKey()
    Exit 1
}

Clear-Host

# 确保本次会话的 PATH 中存在所需的 Windows 命令路径。
$system32Path = "$env:SystemRoot\System32"
if ($env:PATH -notmatch "(?i)(^|;)$([regex]::Escape($system32Path))(?=;|$)") {
    $env:PATH = "$env:SystemRoot\System32;$env:SystemRoot;" + $env:PATH
    Write-Warning "PATH 环境变量中缺少 System32 路径，已为本次会话添加。"
}

# 在 CLI 中显示 ASCII 艺术启动徽标
Write-Host ""
Write-Host ""
Write-Host "                   " -NoNewline; Write-Host "      ^" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "     / \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "    /   \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "   /     \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  / ===== \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |" -ForegroundColor Blue -NoNewline; Write-Host "  ---  " -ForegroundColor White -NoNewline; Write-Host "|" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |" -ForegroundColor Blue -NoNewline; Write-Host " ( O ) " -ForegroundColor DarkCyan -NoNewline; Write-Host "|" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |" -ForegroundColor Blue -NoNewline; Write-Host "  ---  " -ForegroundColor White -NoNewline; Write-Host "|" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |       |" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host " /|       |\" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "/ |       | \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |  " -ForegroundColor DarkGray -NoNewline; Write-Host "'''" -ForegroundColor Red -NoNewline; Write-Host "  |" -ForegroundColor DarkGray -NoNewline; Write-Host "    *" -ForegroundColor Yellow
Write-Host "                   " -NoNewline; Write-Host "    (" -ForegroundColor Yellow -NoNewline; Write-Host "'''" -ForegroundColor Red -NoNewline; Write-Host ") " -ForegroundColor Yellow -NoNewline; Write-Host "   *  *" -ForegroundColor DarkYellow
Write-Host "                   " -NoNewline; Write-Host "    ( " -ForegroundColor DarkYellow -NoNewline; Write-Host "'" -ForegroundColor Red -NoNewline; Write-Host " )   " -ForegroundColor DarkYellow -NoNewline; Write-Host "*" -ForegroundColor Yellow
Write-Host ""
Write-Host "             Win11Debloat 正在启动..." -ForegroundColor White
Write-Host "                请保持此窗口打开" -ForegroundColor DarkGray
Write-Host ""
Write-Host ""

# 将脚本输出记录到指定路径的 'Win11Debloat.log'
if ($LogPath -and (Test-Path $LogPath)) {
    Start-Transcript -Path (Join-Path $LogPath 'Win11Debloat.log') -Append -IncludeInvocationHeader -Force | Out-Null
}
else {
    Start-Transcript -Path $script:DefaultLogPath -Append -IncludeInvocationHeader -Force | Out-Null
}

# 当组策略覆盖 Run.bat 的 Process 作用域 Bypass 时，被标记的 PowerShell 源文件在被点源加载时
# 可能会弹出提示。在 -WhatIf 之外，仅从 Scripts 下被标记的 .ps1、.psm1 和 .psd1 文件中移除
# Web 标记（Mark-of-the-Web）；其他下载的文件保持原样。参见 issue #720。
if (-not $WhatIfPreference) {
    $gpoExecutionPolicySet = (Get-ExecutionPolicy -Scope MachinePolicy) -ne 'Undefined' -or
        (Get-ExecutionPolicy -Scope UserPolicy) -ne 'Undefined'

    if ($gpoExecutionPolicySet) {
        $markedScriptFiles = @(Get-ChildItem -LiteralPath $scriptsPath -Recurse -File |
            Where-Object { $_.Extension -in '.ps1', '.psm1', '.psd1' } |
            Where-Object {
                Get-Item -LiteralPath $_.FullName -Stream * -ErrorAction SilentlyContinue |
                    Where-Object { $_.Stream -eq 'Zone.Identifier' }
            })

        if ($markedScriptFiles.Count -gt 0) {
            Write-Host "正在解除 $($markedScriptFiles.Count) 个 PowerShell 文件的阻止..."
            $unblockErrors = @()
            $markedScriptFiles | Unblock-File -ErrorAction SilentlyContinue -ErrorVariable +unblockErrors

            if ($unblockErrors.Count -gt 0) {
                Write-Warning "无法解除 $($unblockErrors.Count) 个 PowerShell 文件的阻止。"
            }
            else {
                Write-Host "所有文件已成功解除阻止。"
            }
        }
    }
}

# 检查设备是否已加入域并警告用户（组策略可能会覆盖更改）
try {
    $computerSystem = Get-CimInstance Win32_ComputerSystem -ErrorAction SilentlyContinue
    if ($null -ne $computerSystem -and $computerSystem.PartOfDomain) {
        Write-Warning "此计算机已加入域。组策略可能会覆盖 Win11Debloat 所做的更改。"
    }
}
catch { }

# 检查脚本是否具有所有必需的文件
if (-not ((Test-Path $script:DefaultSettingsFilePath) -and (Test-Path $script:AppsListFilePath) -and (Test-Path $script:RegfilesPath) -and (Test-Path $script:AssetsPath) -and (Test-Path $script:AppSelectionSchema) -and (Test-Path $script:ApplyChangesWindowSchema) -and (Test-Path $script:SharedStylesSchema) -and (Test-Path $script:BubbleHintSchema) -and (Test-Path $script:RestoreBackupWindowSchema) -and (Test-Path $script:FeaturesFilePath) -and (Test-Path $script:DefaultLanguagePath))) {
    Write-Error "Win11Debloat 无法找到所需文件，请确保所有脚本文件都存在"
    Write-Output "按任意键退出..."
    $null = [System.Console]::ReadKey()
    Exit 1
}

# 从文件加载功能信息
$script:Features = @{}
try {
    $featuresData = Get-Content -Path $script:FeaturesFilePath -Raw | ConvertFrom-Json
    foreach ($feature in $featuresData.Features) {
        if ([string]::IsNullOrWhiteSpace([string]$feature.FeatureId) -or [string]::IsNullOrWhiteSpace([string]$feature.Label) -or [string]::IsNullOrWhiteSpace([string]$feature.ApplyText)) {
            Write-Warning "功能 '$($feature.FeatureId)' 在 Features.json 中缺少 FeatureId、Label 或 ApplyText，将被跳过。"
            continue
        }
        $script:Features[$feature.FeatureId] = $feature
    }
}
catch {
    Write-Error "从 Features.json 文件加载功能信息失败"
    Write-Output "按任意键退出..."
    $null = [System.Console]::ReadKey()
    Exit 1
}

# 检查是否安装了 WinGet，如果已安装，检查版本是否至少为 v1.4
try {
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        $script:WingetInstalled = $true
    }
    else {
        $script:WingetInstalled = $false
    }
}
catch {
    Write-Error "无法确定是否安装了 WinGet，winget 命令失败：$_"
    $script:WingetInstalled = $false
}

# 显示需要用户确认的 WinGet 警告，如果传入了 Silent 参数则禁止确认
if (-not $script:WingetInstalled -and -not $Silent) {
    Write-Warning "WinGet 未安装或已过时，这可能会阻止 Win11Debloat 移除某些应用"
    Write-Output ""
    Write-Output "按任意键继续..."
    $null = [System.Console]::ReadKey()
}



##################################################################################################################
#                                                                                                                #
#                                                函数导入                                                        #
#                                                                                                                #
##################################################################################################################

# 应用移除函数
. "$PSScriptRoot/Scripts/AppRemoval/Invoke-ForceRemoveEdge.ps1"
. "$PSScriptRoot/Scripts/AppRemoval/Remove-SelectedApps.ps1"
. "$PSScriptRoot/Scripts/AppRemoval/Get-WingetInstalledApps.ps1"
. "$PSScriptRoot/Scripts/AppRemoval/Test-AppInWingetList.ps1"

# CLI 函数
. "$PSScriptRoot/Scripts/CLI/Wait-ForKeyPress.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliLastUsedSettings.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliDefaultModeAppRemovalOptions.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliDefaultModeOptions.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliAppRemoval.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliMenuOptions.ps1"
. "$PSScriptRoot/Scripts/CLI/Write-PendingChanges.ps1"
. "$PSScriptRoot/Scripts/CLI/Write-CliHeader.ps1"

# 功能函数
. "$PSScriptRoot/Scripts/Features/Get-CurrentTweakState.ps1"
. "$PSScriptRoot/Scripts/Features/Invoke-Changes.ps1"
. "$PSScriptRoot/Scripts/Features/Invoke-SystemRestorePoint.ps1"
. "$PSScriptRoot/Scripts/Features/Backup-RegistryFeatureSelection.ps1"
. "$PSScriptRoot/Scripts/Features/Backup-RegistrySnapshotCapture.ps1"
. "$PSScriptRoot/Scripts/Features/Backup-RegistryState.ps1"
. "$PSScriptRoot/Scripts/Features/Registry-BackupValidation.ps1"
. "$PSScriptRoot/Scripts/Features/Restore-RegistryApplyState.ps1"
. "$PSScriptRoot/Scripts/Features/Restore-RegistryBackup.ps1"
. "$PSScriptRoot/Scripts/Features/Set-StoreSearchSuggestions.ps1"
. "$PSScriptRoot/Scripts/Features/Telemetry-ScheduledTasks.ps1"
. "$PSScriptRoot/Scripts/Features/Windows-OptionalFeatures.ps1"
. "$PSScriptRoot/Scripts/Features/Import-RegistryFile.ps1"
. "$PSScriptRoot/Scripts/Features/Replace-StartMenu.ps1"
. "$PSScriptRoot/Scripts/Features/Invoke-RestartExplorer.ps1"

# 文件 I/O 函数
. "$PSScriptRoot/Scripts/FileIO/Import-JsonFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-LanguageFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Save-ToFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Save-Settings.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-Settings.ps1"
. "$PSScriptRoot/Scripts/FileIO/Get-ValidatedAppList.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-AppsFromFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-AppDetailsFromJson.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-AppPresetsFromJson.ps1"

# GUI 函数
. "$PSScriptRoot/Scripts/GUI/Get-SystemUsesDarkMode.ps1"
. "$PSScriptRoot/Scripts/GUI/Set-WindowThemeResources.ps1"
. "$PSScriptRoot/Scripts/GUI/Attach-ShiftClickBehavior.ps1"
. "$PSScriptRoot/Scripts/GUI/Apply-SettingsToUiControls.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-MessageBox.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-ImportExportConfigWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-ApplyModal.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-AppSelectionWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-RestoreBackupWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Restore-BackupDialogFeatureLists.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-RestoreBackupDialog.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-WindowChrome.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-AppSelection.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-TweaksBuilder.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-Navigation.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-Deployment.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-MainWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-AboutDialog.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-Bubble.ps1"

# 辅助函数
. "$PSScriptRoot/Scripts/Helpers/Add-Parameter.ps1"
. "$PSScriptRoot/Scripts/Helpers/Resolve-UserProfilePath.ps1"
. "$PSScriptRoot/Scripts/Helpers/User-HiveHelpers.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-UserProfileExists.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-ModernStandbySupport.ps1"
. "$PSScriptRoot/Scripts/Helpers/Generate-AppsList.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-FriendlyRegistryBackupTarget.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-FriendlyTargetUserName.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-RebootFeatureLabels.ps1"
. "$PSScriptRoot/Scripts/Helpers/Import-ConfigToParams.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-ConfigConsistency.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-TargetUserForAppRemoval.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-RegFileOperations.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-TargetUserName.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-UserDirectory.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-UserName.ps1"
. "$PSScriptRoot/Scripts/Helpers/Registry-PathHelpers.ps1"
. "$PSScriptRoot/Scripts/Helpers/Apply-RegistryRegFile.ps1"
. "$PSScriptRoot/Scripts/Helpers/Confirm-UnsafeAppRemoval.ps1"

# 线程函数
. "$PSScriptRoot/Scripts/Threading/Invoke-DoEvents.ps1"
. "$PSScriptRoot/Scripts/Threading/Invoke-NonBlocking.ps1"



##################################################################################################################
#                                                                                                                #
#                                                  脚本开始                                                      #
#                                                                                                                #
##################################################################################################################



# 获取当前 Windows 内部版本号
$WinVersion = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentBuild

# 检查计算机是否支持新式待机，用于确定是否可以使用 DisableModernStandbyNetworking 选项
$script:ModernStandbySupported = Test-ModernStandbySupport

# 加载 GUI 的语言内容。-Language 会覆盖当前用户的系统 UI 区域性，
# 如果请求的语言不可用，则任一路径都回退到 en-US。

if ($Language) {
    # 1. 如果用户手动指定了语言参数，直接用指定的
    $script:Lang = Import-LanguageFile -LanguageCode $Language
} else {
    # 2. 如果没有指定，自动检测系统语言
    $sysLang = [System.Globalization.CultureInfo]::CurrentUICulture.Name
    if ($sysLang -like "zh-*") {
        # 系统是中文环境，加载 zh-CN
        $script:Lang = Import-LanguageFile -LanguageCode 'zh-CN'
    } else {
        # 系统是其他语言，默认加载英文（en-US）
        $script:Lang = Import-LanguageFile
    }
}

# 确保参数哈希表被正确初始化（这是原脚本的核心代码，千万不要删掉）
if ($null -eq $PSBoundParameters) {
    $script:Params = @{}
} else {
    $script:Params = $PSBoundParameters
}

$script:UndoParams = @{}

# 当请求 RemoveApps 且未显式提供 Apps 时，添加默认 Apps 参数
if ((-not $script:Params.ContainsKey("Apps")) -and $script:Params.ContainsKey("RemoveApps")) {
    $script:Params.Add('Apps', 'Default')
}

$controlParamsCount = 0

# 统计设置了多少个控制参数，以确定用户在运行时是否选择了任何更改
foreach ($Param in $script:ControlParams) {
    if ($script:Params.ContainsKey($Param)) {
        $controlParamsCount++
    }
}

# 隐藏应用移除的进度条，因为它们会阻塞 Win11Debloat 的输出
if (-not ($script:Params.ContainsKey("Verbose"))) {
    $ProgressPreference = 'SilentlyContinue'
}
else {
    Write-Host "详细模式已启用"
    Write-Output ""
    Write-Output "按任意键继续..."
    $null = [System.Console]::ReadKey()

    $ProgressPreference = 'Continue'
}

if ($script:Params.ContainsKey("Sysprep")) {
    Get-UserDirectory -userName "Default" | Out-Null

    # 如果在 Windows 10 上以 Sysprep 模式运行，则退出脚本
    if ($WinVersion -lt 22000) {
        Write-Error "Windows 10 不支持 Win11Debloat Sysprep 模式"
        Wait-ForKeyPress -ExitCode 1
    }
}

# 如果提供了 User 或 AppRemovalTarget 参数，确保目标用户存在
if ($script:Params.ContainsKey("User")) {
    Get-UserDirectory -userName $script:Params.Item("User") | Out-Null
}
if ($script:Params.ContainsKey("AppRemovalTarget")) {
    $appRemovalTargetValue = $script:Params.Item("AppRemovalTarget")
    # 'AllUsers' / 'CurrentUser' 是哨兵作用域值，不是真实用户名 - 不要将它们作为配置文件解析
    if ($appRemovalTargetValue -notin @('AllUsers', 'CurrentUser')) {
        Get-UserDirectory -userName $appRemovalTargetValue | Out-Null
    }
}

# 如果 LastUsedSettings.json 文件存在且为空，则删除它
if ((Test-Path $script:SavedSettingsFilePath) -and ([String]::IsNullOrWhiteSpace((Get-content $script:SavedSettingsFilePath)))) {
    Remove-Item -Path $script:SavedSettingsFilePath -Force
}

# 对于面向部署目标的参数，默认为 CLI 模式。
$launchInCLI = $CLI -or $script:Params.ContainsKey("User") -or $script:Params.ContainsKey("Sysprep") -or $script:Params.ContainsKey("AppRemovalTarget")

# 根据提供的参数或用户输入更改脚本执行
if ((-not $script:Params.Count) -or $RunDefaults -or $RunDefaultsLite -or $RunSavedSettings -or $Config -or ($controlParamsCount -eq $script:Params.Count)) {
    if ($RunDefaults -or $RunDefaultsLite) {
        Show-CliDefaultModeOptions
    }
    elseif ($RunSavedSettings) {
        if (-not (Test-Path $script:SavedSettingsFilePath)) {
            Write-CliHeader '自定义模式'
            Write-Error "找不到 LastUsedSettings.json 文件，未做任何更改"
            Wait-ForKeyPress -ExitCode 1
        }

        Show-CliLastUsedSettings
    }
    elseif ($Config) {
        try {
            Import-ConfigToParams -ConfigPath $Config -CurrentBuild $WinVersion -ExpectedVersion '1.0'
        }
        catch {
            Write-Error "$_"
            Wait-ForKeyPress -ExitCode 1
        }

        if (-not $Silent) {
            Write-CliHeader '自定义模式'
            Write-PendingChanges
            Write-CliHeader '自定义模式'
        }
    }
    else {
        if ($launchInCLI) {
            $Mode = Show-CliMenuOptions
        }
        else {
            try {
                $result = Show-MainWindow
            
                try {
                    Stop-Transcript
                }
                catch { }

                Exit
            }
            catch {
                Write-Warning "图形界面无法启动：$($_.Exception.Message)"
                Write-Verbose "GUI 失败详情：$($_.Exception.ToString())"
                if (-not $Silent) {
                    Write-Host ""
                    Write-Host "按任意键在 CLI 模式下继续..."
                    $null = [System.Console]::ReadKey()
                }

                $Mode = Show-CliMenuOptions
            }
        }
    }

    # 根据模式添加执行参数
    switch ($Mode) {
        # 默认模式，加载默认值和应用移除选项
        '1' { 
            Show-CliDefaultModeOptions
        }

        # 应用移除，根据用户选择移除应用
        '2' {
            Show-CliAppRemoval
        }

        # 从 "LastUsedSettings.json" 文件加载上次使用的选项
        '3' {
            Show-CliLastUsedSettings
        }
    }
}
else {
    Write-CliHeader '配置'
}

# 如果 ControlParams 中的键数等于 Params 中的键数，则用户未选择或添加任何修改/更改，
# 脚本可以在不做任何更改的情况下退出。
if (($controlParamsCount -eq $script:Params.Keys.Count) -or ($script:Params.Keys.Count -eq 1 -and ($script:Params.Keys -contains 'CreateRestorePoint' -or $script:Params.Keys -contains 'Apps'))) {
    Write-Output "脚本已完成，未做任何更改。"
    Wait-ForKeyPress
}

# 使用合并的函数执行所有选定/提供的参数
# （如果请求，这也会处理还原点创建）
Invoke-AllChanges

if ($script:CancelRequested) {
    Write-Warning "脚本执行已被用户取消。任何剩余的更改均未应用。"
    Wait-ForKeyPress
}

# 重启资源管理器进程，除非在 Sysprep 或 User 上下文中运行
if (-not ($script:Params.ContainsKey("Sysprep") -or $script:Params.ContainsKey("User"))) {
    Invoke-RestartExplorer
}

Write-Output ""
Write-Output ""
Write-Output ""
Write-Output "脚本已完成！请检查上方是否有任何错误。"

Wait-ForKeyPress
