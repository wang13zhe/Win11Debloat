# Win11Debloat — Edizione multilingue

[简体中文](README.md) | [English](README-en_US.md) | Italiano

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> Un fork della community di [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Mantiene ogni funzionalità originale di debloat — **l'interfaccia è disponibile in 12 lingue e segue automaticamente la lingua di sistema**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ Cosa aggiunge questo fork

- 🌍 **12 lingue per l'interfaccia** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Rileva automaticamente la lingua di sistema** — corrispondenza esatta della regione → fallback con lo stesso prefisso di lingua (`de-AT` usa `de-DE`, `zh-HK` usa `zh-TW`) → inglese come fallback finale
- 🔄 **Cambia lingua in qualsiasi momento senza perdere le selezioni** — in alto a destra ⚙ → Language; l'interfaccia si aggiorna sul posto, quindi **le voci che hai già spuntato non vengono reimpostate**
- 📦 **Traduzione completa** — testi dell'interfaccia, descrizioni delle funzionalità e tooltip, categorie e nome/descrizione di ogni app sono localizzati, non solo un guscio
- ⚡ **Lettura dello stato più rapida** — la risoluzione dei percorsi di registro, l'analisi dei file `.reg` e le query Appx sono memorizzate nella cache per un singolo aggiornamento dello stato; la lettura dello stato di ogni funzionalità è risultata circa il 19% più veloce
- 🩹 **Bug corretti lungo il percorso** — i file di lingua/configurazione non venivano letti come UTF-8 (il giapponese/russo mostrava caratteri illeggibili o addirittura elenchi vuoti), le traduzioni lunghe venivano troncate e un test produceva un falso fallimento su sistemi non in inglese

## 🌐 Lingue supportate

| Lingua | Codice | Interfaccia | Descrizioni funzionalità | Descrizioni app |
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

Di queste, `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` e `zh-CN` provengono dall'upstream;
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` e `zh-TW` sono mantenute da questo fork e inviate upstream come PR.

## 📸 Screenshot

Puoi cambiare lingua direttamente in Impostazioni (il valore predefinito è "Segui il sistema"):

![Language picker](Assets/Images/screenshots/language-picker.png)

Voci delle funzionalità e relativi tooltip, localizzati:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

La pagina di rimozione delle app: nomi, descrizioni e avvisi delle app sono localizzati, mentre l'`AppId` resta verbatim per la risoluzione dei problemi:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Utilizzo

1. Scarica `Win11Debloat-CN-*.zip` da [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)
2. Estrai in una qualsiasi cartella (**non eseguirlo direttamente dall'interno dello zip**)
3. Fai doppio clic su `Run.bat` e clicca su "Sì" alla richiesta UAC
4. Una volta aperto, cambia tema e lingua dell'interfaccia in qualsiasi momento tramite ⚙ in alto a destra

Puoi anche scegliere una lingua direttamente dalla riga di comando:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

Se non specificata, l'ordine è: argomento `-Language` → la scelta salvata nell'interfaccia → lingua di sistema → inglese.
La scelta dell'interfaccia viene salvata in `%LOCALAPPDATA%\Win11Debloat\Preferences.json`; i log si trovano in `Logs\` nella stessa cartella.

## 📋 Requisiti

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (incluso nel sistema operativo). Lo script non supporta PowerShell 7 / pwsh
- Diritti di amministratore (modifica il registro e rimuove le app preinstallate)

## ⚠️ Avvertenze

Questo strumento modifica il registro e rimuove le app preinstallate, quindi **spunta sempre prima "Crea un punto di ripristino del sistema"** — usalo a tuo rischio e pericolo.
La maggior parte delle modifiche può essere annullata con la funzione "Ripristina" integrata nello strumento e le app rimosse possono essere reinstallate dal Microsoft Store.

> Se `Run.bat` si chiude subito, apri PowerShell come amministratore manualmente, posizionati con `cd` nella cartella estratta ed esegui `.\Win11Debloat.ps1`.

## 🔗 Relazione con l'upstream

- Questo fork è **basato direttamente sul `master` di `Raphire/Win11Debloat`** e aggiunge solo i language pack e piccole correzioni, così può continuare a seguire l'upstream
- I language pack seguono la convenzione dell'upstream "una PR per lingua", più due PR per la correzione della lettura UTF-8 e le correzioni di wording
- Già integrato nell'upstream: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (lettura UTF-8), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (quattro correzioni di stringhe sorgente)
- Ancora in revisione: le sei PR dei language pack `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Segnala problemi di traduzione in [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

Per il set di funzionalità originali (elenco di rimozione app, argomenti da riga di comando, Sysprep, esportazione/importazione configurazione, ecc.), vedi il [Wiki upstream](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Crediti e licenza

- Autore originale [Raphire](https://github.com/Raphire) e tutti i contributori; questo progetto è distribuito con la [licenza MIT](LICENSE)
- Se ti piace lo strumento, lascia una Star all'autore nella [repository upstream](https://github.com/Raphire/Win11Debloat), oppure [offrigli un caffè](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Altre versioni linguistiche

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
