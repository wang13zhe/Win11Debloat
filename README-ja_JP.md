# Win11Debloat — 多言語版

[简体中文](README.md) | [English](README-en_US.md) | 日本語

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat) のコミュニティフォークです。
> 元のすべてのデブロート機能を維持したまま、**UI は 12 言語に対応し、システムの言語に自動的に追従します**。

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ このフォークで追加されたもの

- 🌍 **UI は 12 言語** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **システムの言語を自動検出** — 完全一致（地域込み）→ 同じ言語プレフィックスへのフォールバック（`de-AT` は `de-DE`、`zh-HK` は `zh-TW` を使用）→ 最終的なフォールバックとして英語
- 🔄 **チェック状態を失わずにいつでも切り替え** — 右上の ⚙ → 言語 から切り替え可能。UI はその場で更新されるため、**すでにチェックした項目はリセットされません**
- 📦 **完全な翻訳** — UI のテキスト、機能の説明やツールチップ、カテゴリ、そして各アプリの名前と説明までローカライズされており、単なる外枠ではありません
- ⚡ **状態読み取りの高速化** — レジストリパスの解決、`.reg` の解析、Appx クエリは 1 回の状態更新の間キャッシュされます。すべての機能の状態を読み取る処理は約 19% 高速化しました
- 🩹 **その過程で修正したバグ** — 言語／設定ファイルが UTF-8 として読み取られていなかった（日本語／ロシア語で文字化けやリストが空になることがあった）、長い翻訳が切り捨てられていた、非英語環境で 1 つのテストが誤った失敗を起こしていた

## 🌐 対応言語

| 言語 | コード | UI | 機能の説明 | アプリの説明 |
| --- | :-: | :-: | :-: | :-: |
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

これらのうち、`en-US`、`it-IT`、`ja-JP`、`nl-NL`、`pt-BR`、`zh-CN` は上流（アップストリーム）から提供されています。`de-DE`、`es-ES`、`fr-FR`、`ko-KR`、`ru-RU`、`zh-TW` はこのフォークで管理されており、アップストリームへ PR として提出されています。

## 📸 スクリーンショット

設定画面で言語を直接切り替えられます（初期設定は「システムに従う」）：

![Language picker](Assets/Images/screenshots/language-picker.png)

機能項目とそのツールチップはローカライズされています：

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

アプリ削除画面：アプリ名、説明、警告はローカライズされていますが、`AppId` はトラブルシューティングのためそのまま（原文のまま）保持されます：

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 使い方

1. [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest) から `Win11Debloat-CN-*.zip` をダウンロード
2. 任意のフォルダに展開（**zip 内から直接実行しないでください**）
3. `Run.bat` をダブルクリックし、UAC のプロンプトで「はい」をクリック
4. 開いたら、右上の ⚙ からいつでもテーマと UI の言語を切り替え

コマンドラインから直接言語を指定することもできます：

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

指定しない場合の優先順位は以下の通りです：`-Language` 引数 → UI に保存された選択 → システムの言語 → 英語。
UI の選択は `%LOCALAPPDATA%\Win11Debloat\Preferences.json` に保存されます。ログは同じフォルダ配下の `Logs\` に保存されます。

## 📋 要件

- Windows 10 / Windows 11
- **Windows PowerShell 5.1**（OS に標準搭載）。このスクリプトは PowerShell 7 / pwsh には対応していません
- 管理者権限（レジストリを編集し、プリインストールされたアプリを削除するため）

## ⚠️ 注意点

このツールはレジストリを編集し、プリインストールされたアプリを削除するため、**必ず最初に「システムの復元ポイントを作成する」にチェックを入れてください** — 自己責任でご利用ください。
ほとんどの変更はツール内の「復元」機能で元に戻せます。また、削除したアプリは Microsoft Store から再インストールできます。

> `Run.bat` が一瞬で消えてしまう場合は、PowerShell を管理者として手動で開き、展開したフォルダに `cd` して `.\Win11Debloat.ps1` を実行してください。

## 🔗 アップストリームとの関係

- このフォークは **`Raphire/Win11Debloat` の `master` を直接ベース**としており、その上に言語パックと小さな修正だけを重ねているため、アップストリームを継続的に追跡できます
- 言語パックはアップストリームの「言語ごとに 1 PR」という方針に従い、さらに UTF-8 読み取り修正と表記修正の 2 つの PR を追加しています
- すでにアップストリームにマージ済み：[#844](https://github.com/Raphire/Win11Debloat/pull/844)（UTF-8 読み取り）、[#846](https://github.com/Raphire/Win11Debloat/pull/846)（ソース文字列 4 か所の修正）
- レビュー中：言語パックの 6 つの PR `zh-TW`、`de-DE`、`es-ES`、`fr-FR`、`ko-KR`、`ru-RU`
- 翻訳の問題は [Issues](https://github.com/wang13zhe/Win11Debloat/issues) で報告してください

元の機能一式（アプリ削除リスト、コマンドライン引数、Sysprep、設定のエクスポート／インポートなど）については、[アップストリームの Wiki](https://github.com/Raphire/Win11Debloat/wiki) を参照してください。

## 🙏 クレジットとライセンス

- 原作者は [Raphire](https://github.com/Raphire) およびすべての貢献者。本プロジェクトは [MIT ライセンス](LICENSE) の下で公開されています
- このツールが気に入ったら、[アップストリームのリポジトリ](https://github.com/Raphire/Win11Debloat) で作者に Star を付けるか、[コーヒーをおごる](https://ko-fi.com/M4M5C6UPC) ことをご検討ください

---

## 🌐 その他の言語版

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
