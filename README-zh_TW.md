# Win11Debloat — 多語言版本

[简体中文](README.md) | [English](README-en_US.md) | 繁體中文

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat) 的社群分支。
> 保留原有全部去冗余（debloat）功能 —— **介面提供 12 種語言，並會自動跟隨您的系統語言**。

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ 這個分支新增了什麼

- 🌍 **12 種介面語言** —— 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **自動偵測系統語言** —— 完全符合地區 → 同語言前綴備援（`de-AT` 使用 `de-DE`、`zh-HK` 使用 `zh-TW`）→ 最後以英文作為備援
- 🔄 **隨時切換且不會遺失已勾選項目** —— 右上角 ⚙ → Language；介面會原地重新整理，因此**您已勾選的項目不會被重置**
- 📦 **完整翻譯** —— 介面文字、功能說明與工具提示、分類，以及每個應用程式的名稱與說明都已在地化，不只是外殼
- ⚡ **更快的狀態讀取** —— 登錄檔路徑解析、`.reg` 剖析與 Appx 查詢會快取於一次狀態重新整理；讀取每個功能的狀態測得約快 19%
- 🩹 **修復沿途發現的錯誤** —— 語言／設定檔原先未以 UTF-8 讀取（日文／俄文會出現亂碼甚至清單空白）、過長的翻譯被截斷，且某項測試在非英文系統上會產生錯誤的失敗結果

## 🌐 支援的語言

| 語言 | 代碼 | 介面 | 功能說明 | 應用程式說明 |
| --- | --- :-: | :-: | :-: | :-: |
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

其中，`en-US`、`it-IT`、`ja-JP`、`nl-NL`、`pt-BR` 與 `zh-CN` 來自上遊；
`de-DE`、`es-ES`、`fr-FR`、`ko-KR`、`ru-RU` 與 `zh-TW` 由本分支維護，並以 PR 形式提交至上遊。

## 📸 螢幕截圖

您可以在設定中直接切換語言（預設為「跟隨系統」）：

![Language picker](Assets/Images/screenshots/language-picker.png)

功能項目及其工具提示，已在地化：

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

應用程式移除頁面：應用程式名稱、說明與警告均已在地化，而 `AppId` 則保持原樣以便排解問題：

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 使用方式

1. 從 [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest) 下載 `Win11Debloat-CN-*.zip`
2. 解壓縮到任意資料夾（**請勿直接從壓縮檔內執行**）
3. 雙擊 `Run.bat`，並在 UAC 提示中點擊「是」
4. 開啟後，可隨時透過右上角 ⚙ 切換主題與介面語言

您也可以直接在命令列指定語言：

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

若未指定，順序為：`-Language` 參數 → 介面中儲存的選擇 → 系統語言 → 英文。
介面選擇會儲存於 `%LOCALAPPDATA%\Win11Debloat\Preferences.json`；日誌位於同一資料夾下的 `Logs\`。

## 📋 需求

- Windows 10 / Windows 11
- **Windows PowerShell 5.1**（隨作業系統附帶）。此腳本不支援 PowerShell 7 / pwsh
- 管理者權限（會修改登錄檔並移除預裝應用程式）

## ⚠️ 注意事項

此工具會修改登錄檔並移除預裝應用程式，因此**請務必先勾選「建立系統還原點」** —— 使用時請自行承擔風險。
大多數變更可使用工具內的「還原」功能復原，且已移除的應用程式可從 Microsoft Store 重新安裝。

> 若 `Run.bat` 一閃而過，請手動以管理者身分開啟 PowerShell，`cd` 進入解壓縮後的資料夾並執行 `.\Win11Debloat.ps1`。

## 🔗 與上遊的關係

- 本分支**直接基於 `Raphire/Win11Debloat` 的 `master`**，僅在其上疊加語言包與小幅修正，因此可持續追蹤上遊
- 語言包遵循上遊「一種語言一個 PR」的慣例，另加兩個用於 UTF-8 讀取修正與措辭更正的 PR
- 已合併至上遊：[#844](https://github.com/Raphire/Win11Debloat/pull/844)（UTF-8 讀取）、[#846](https://github.com/Raphire/Win11Debloat/pull/846)（四處原始字串修正）
- 仍審查中：六個語言包 PR `zh-TW`、`de-DE`、`es-ES`、`fr-FR`、`ko-KR`、`ru-RU`
- 翻譯問題請回報至 [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

關於原始功能集（應用程式移除清單、命令列參數、Sysprep、匯出／匯入設定等），請參閱[上遊 Wiki](https://github.com/Raphire/Win11Debloat/wiki)。

## 🙏 致謝與授權

- 原作者 [Raphire](https://github.com/Raphire) 與所有貢獻者；本專案採用 [MIT 授權](LICENSE)
- 若您喜歡這個工具，請到[上遊倉庫](https://github.com/Raphire/Win11Debloat)為作者點個 Star，或[請他們喝杯咖啡](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 其他語言版本

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
