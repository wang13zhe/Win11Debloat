# Win11Debloat — Mehrsprachige Edition

[简体中文](README.md) | [English](README-en_US.md) | Deutsch

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> Eine Community-Gabel von [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Behält alle ursprünglichen Debloat-Funktionen bei — **die Oberfläche ist in 12 Sprachen verfügbar und folgt automatisch deiner Systemsprache**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ Was diese Gabel hinzufügt

- 🌍 **12 Benutzeroberflächen-Sprachen** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Erkennt die Systemsprache automatisch** — exakte Regionsübereinstimmung → Fallback auf gleichen Sprachpräfix (`de-AT` verwendet `de-DE`, `zh-HK` verwendet `zh-TW`) → Englisch als letzter Fallback
- 🔄 **Jederzeit wechseln, ohne die Häkchen zu verlieren** — oben rechts ⚙ → Sprache; die Oberfläche aktualisiert sich an Ort und Stelle, sodass **bereits gesetzte Häkchen nicht zurückgesetzt werden**
- 📦 **Vollständige Übersetzung** — UI-Text, Funktionsbeschreibungen und Tooltips, Kategorien sowie Name und Beschreibung jeder App sind lokalisiert, nicht nur eine Hülle
- ⚡ **Schnelleres Auslesen des Zustands** — die Auflösung von Registry-Pfaden, das Parsen von `.reg`-Dateien und Appx-Abfragen werden für eine Zustandsaktualisierung zwischengespeichert; das Auslesen des Zustands jeder Funktion war etwa 19 % schneller
- 🩹 **Unterwegs behobene Fehler** — Sprach-/Konfigurationsdateien wurden nicht als UTF-8 gelesen (Japanisch/Russisch zeigte Mojibake oder sogar leere Listen), lange Übersetzungen wurden abgeschnitten, und ein Test erzeugte auf nicht-englischen Systemen ein falsches Fehlschlag-Ergebnis

## 🌐 Unterstützte Sprachen

| Sprache | Code | UI | Funktionsbeschreibungen | App-Beschreibungen |
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

Von diesen stammen `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` und `zh-CN` aus dem Upstream;
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` und `zh-TW` werden von dieser Gabel gepflegt und als PRs an den Upstream eingereicht.

## 📸 Screenshots

Du kannst die Sprache direkt in den Einstellungen wechseln (Standard ist „System folgen“):

![Language picker](Assets/Images/screenshots/language-picker.png)

Funktionspunkte und ihre Tooltips, lokalisiert:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

Die Seite zum Entfernen von Apps: App-Namen, Beschreibungen und Warnungen sind lokalisiert, während die `AppId` zur Fehlerbehebung unverändert bleibt:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Verwendung

1. Lade `Win11Debloat-CN-*.zip` von [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest) herunter
2. Entpacke es in einen beliebigen Ordner (**führe es nicht aus dem Zip-Archiv heraus aus**)
3. Doppelklicke auf `Run.bat` und klicke an der UAC-Abfrage auf „Ja“
4. Sobald es geöffnet ist, kannst du das Design und die Benutzeroberflächen-Sprache jederzeit über das ⚙-Symbol oben rechts wechseln

Du kannst die Sprache auch direkt in der Befehlszeile auswählen:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

Wenn nicht angegeben, ist die Reihenfolge: `-Language`-Argument → die in der Oberfläche gespeicherte Auswahl → Systemsprache → Englisch.
Die Oberflächen-Auswahl wird in `%LOCALAPPDATA%\Win11Debloat\Preferences.json` gespeichert; Protokolle liegen in `Logs\` in demselben Ordner.

## 📋 Voraussetzungen

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (im Betriebssystem enthalten). Das Skript unterstützt kein PowerShell 7 / pwsh
- Administratorrechte (es bearbeitet die Registry und entfernt vorinstallierte Apps)

## ⚠️ Hinweise

Dieses Tool bearbeitet die Registry und entfernt vorinstallierte Apps, daher **setze immer zuerst den Haken bei „Systemwiederherstellungspunkt erstellen“** — Nutzung auf eigene Gefahr.
Die meisten Änderungen lassen sich mit der integrierten Funktion „Wiederherstellen“ rückgängig machen, und entfernte Apps können aus dem Microsoft Store neu installiert werden.

> Wenn `Run.bat` nur kurz aufblitzt, öffne PowerShell manuell als Administrator, wechsle mit `cd` in den entpackten Ordner und führe `.\Win11Debloat.ps1` aus.

## 🔗 Verhältnis zum Upstream

- Diese Gabel basiert **direkt auf `Raphire/Win11Debloat`'s `master`** und legt lediglich Sprachpakete und kleine Korrekturen darüber, sodass sie dem Upstream folgen kann
- Sprachpakete folgen der Konvention des Upstreams „ein PR pro Sprache“, plus zwei PRs für die UTF-8-Lese-Korrektur und Wortlaut-Korrekturen
- Bereits im Upstream zusammengeführt: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (UTF-8-Lesen), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (vier Quelltext-String-Korrekturen)
- Noch in Überprüfung: die sechs Sprachpaket-PRs `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Melde Übersetzungsprobleme in [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

Für den ursprünglichen Funktionsumfang (Liste der zu entfernenden Apps, Befehlszeilenargumente, Sysprep, Konfiguration exportieren/importieren usw.) siehe das [Upstream-Wiki](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Danksagungen & Lizenz

- Ursprünglicher Autor [Raphire](https://github.com/Raphire) und alle Mitwirkenden; dieses Projekt steht unter der [MIT-Lizenz](LICENSE)
- Wenn dir das Tool gefällt, gib dem Autor einen Stern im [Upstream-Repository](https://github.com/Raphire/Win11Debloat), oder [kauf ihnen einen Kaffee](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Weitere Sprachversionen

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
