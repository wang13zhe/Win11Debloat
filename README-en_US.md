# Win11Debloat — Multi-language edition

**[English](README-en_US.md)** | [简体中文](README.md)

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> A community fork of [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Keeps every original debloat capability — **the UI ships in 12 languages and follows your system language automatically**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ What this fork adds

- 🌍 **12 UI languages** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Auto-detects the system language** — exact region match → same-language-prefix fallback (`de-AT` uses `de-DE`, `zh-HK` uses `zh-TW`) → English as the final fallback
- 🔄 **Switch anytime without losing your ticks** — top-right ⚙ → Language; the UI refreshes in place, so **items you already checked are not reset**
- 📦 **Full translation** — UI text, feature descriptions and tooltips, categories, and every app's name and description are localized, not just a shell
- ⚡ **Faster state reads** — registry path resolution, `.reg` parsing and Appx queries are cached for one state refresh; reading every feature's state measured about 19% faster
- 🩹 **Bugs fixed along the way** — language/config files weren't read as UTF-8 (Japanese/Russian would show mojibake or even blank lists), long translations were truncated, and one test produced a false failure on non-English systems

## 🌐 Supported languages

| Language | Code | UI | Feature descriptions | App descriptions |
| --- | --- | :-: | :-: | :-: |
| 简体中文 | `zh-CN` | ✅ | ✅ | ✅ |
| 繁體中文 | `zh-TW` | ✅ | ✅ | ✅ |
| English | `en-US` | ✅ | ✅ | ✅ |
| 日本語 | `ja-JP` | ✅ | ✅ | ✅ |
| 한국어 | `ko-KR` | ✅ | ✅ | ✅ |
| Deutsch | `de-DE` | ✅ | ✅ | ✅ |
| Français | `fr-FR` | ✅ | ✅ | ✅ |
| Español | `es-ES` | ✅ | ✅ | ✅ |
| Italiano | `it-IT` | ✅ | ✅ | ✅ |
| Nederlands | `nl-NL` | ✅ | ✅ | ✅ |
| Português (Brasil) | `pt-BR` | ✅ | ✅ | ✅ |
| Русский | `ru-RU` | ✅ | ✅ | ✅ |

Of these, `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` and `zh-CN` come from upstream;
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` and `zh-TW` are maintained by this fork and submitted upstream as PRs.

## 📸 Screenshots

You can switch languages right in Settings (defaults to "Follow system"):

![Language picker](Assets/Images/screenshots/language-picker.png)

Feature items and their tooltips, localized:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

The app-removal page: app names, descriptions and warnings are localized, while the `AppId` stays verbatim for troubleshooting:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Usage

1. Download `Win11Debloat-CN-*.zip` from [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)
2. Extract to any folder (**don't run it from inside the zip**)
3. Double-click `Run.bat` and click "Yes" at the UAC prompt
4. Once open, switch the theme and UI language anytime via the top-right ⚙

You can also pick a language directly on the command line:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

When not specified, the order is: `-Language` argument → the choice saved in the UI → system language → English.
The UI choice is saved in `%LOCALAPPDATA%\Win11Debloat\Preferences.json`; logs live in `Logs\` under the same folder.

## 📋 Requirements

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (ships with the OS). The script does not support PowerShell 7 / pwsh
- Administrator rights (it edits the registry and removes pre-installed apps)

## ⚠️ Caveats

This tool edits the registry and removes pre-installed apps, so **always tick "Create a system restore point" first** — use it at your own risk.
Most changes can be undone with the in-tool "Restore" feature, and removed apps can be reinstalled from the Microsoft Store.

> If `Run.bat` flashes by, open PowerShell as administrator manually, `cd` into the extracted folder and run `.\Win11Debloat.ps1`.

## 🔗 Relationship with upstream

- This fork is **based directly on `Raphire/Win11Debloat`'s `master`** and only layers language packs and small fixes on top, so it can keep tracking upstream
- Language packs follow upstream's "one PR per language" convention, plus two PRs for the UTF-8 read fix and wording corrections
- Already merged upstream: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (UTF-8 read), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (four source-string corrections)
- Still under review: the six language-pack PRs `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Report translation issues in [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

For the original feature set (app removal list, command-line arguments, Sysprep, export/import config, etc.), see the [upstream Wiki](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Credits & license

- Original author [Raphire](https://github.com/Raphire) and all contributors; this project is under the [MIT license](LICENSE)
- If you like the tool, give the author a Star at the [upstream repo](https://github.com/Raphire/Win11Debloat), or [buy them a coffee](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Other language versions

- [简体中文](README.md)
- [English](README-en_US.md)
- [繁體中文](README-zh_TW.md)
- [日本語](README-ja_JP.md)
- [한국어](README-ko_KR.md)
- [Deutsch](README-de_DE.md)
- [Français](README-fr_FR.md)
- [Español](README-es_ES.md)
- [Italiano](README-it_IT.md)
- [Nederlands](README-nl_NL.md)
- [Português (Brasil)](README-pt_BR.md)
- [Русский](README-ru_RU.md)
