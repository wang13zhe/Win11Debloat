# Win11Debloat — Meertalige editie

[简体中文](README.md) | [English](README-en_US.md) | Nederlands

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> Een community-fork van [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Behoudt alle oorspronkelijke debloat-mogelijkheden — **de UI is beschikbaar in 12 talen en volgt automatisch de systeemtaal**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ Wat deze fork toevoegt

- 🌍 **12 UI-talen** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Detecteert de systeemtaal automatisch** — exacte regio-overeenkomst → terugval op voorvoegsel van dezelfde taal (`de-AT` gebruikt `de-DE`, `zh-HK` gebruikt `zh-TW`) → Engels als laatste terugval
- 🔄 **Wissel op elk moment zonder je vinkjes te verliezen** — rechtsboven ⚙ → Taal; de UI vernieuwt ter plekke, dus **items die je al hebt aangevinkt, worden niet gereset**
- 📦 **Volledige vertaling** — UI-tekst, functiebeschrijvingen en tooltips, categorieën en de naam en beschrijving van elke app zijn gelokaliseerd, niet alleen een omhulsel
- ⚡ **Snellere statuslezingen** — registry-padresolutie, `.reg`-parsing en Appx-queries worden één statusvernieuwing lang gecachet; het uitlezen van de status van elke functie was ongeveer 19% sneller
- 🩹 **Onderweg opgeloste bugs** — taal-/config-bestanden werden niet als UTF-8 gelezen (Japans/Russisch toonde mojibake of zelfs lege lijsten), lange vertalingen werden afgekapt en één test gaf ten onrechte een foutmelding op niet-Engelstalige systemen

## 🌐 Ondersteunde talen

| Taal | Code | UI | Functiebeschrijvingen | App-beschrijvingen |
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

Hiervan komen `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` en `zh-CN` van upstream; `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` en `zh-TW` worden door deze fork onderhouden en upstream ingediend als PR's.

## 📸 Schermafbeeldingen

Je kunt talen direct in Instellingen wisselen (standaard op "Volg systeem"):

![Language picker](Assets/Images/screenshots/language-picker.png)

Functie-items en hun tooltips, gelokaliseerd:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

De app-verwijderpagina: app-namen, beschrijvingen en waarschuwingen zijn gelokaliseerd, terwijl de `AppId` letterlijk blijft staan voor probleemoplossing:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Gebruik

1. Download `Win11Debloat-CN-*.zip` van [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)
2. Pak uit naar een willekeurige map (**voer het niet uit vanuit de zip**)
3. Dubbelklik op `Run.bat` en klik op "Ja" bij de UAC-vraag
4. Eenmaal geopend kun je het thema en de UI-taal op elk moment wisselen via het ⚙ rechtsboven

Je kunt ook direct een taal op de commandoregel kiezen:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

Wanneer niet opgegeven, is de volgorde: `-Language`-argument → de in de UI opgeslagen keuze → systeemtaal → Engels. De UI-keuze wordt opgeslagen in `%LOCALAPPDATA%\Win11Debloat\Preferences.json`; logs staan in `Logs\` in dezelfde map.

## 📋 Vereisten

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (wordt met het OS meegeleverd). Het script ondersteunt PowerShell 7 / pwsh niet
- Beheerdersrechten (het bewerkt het register en verwijdert vooraf geïnstalleerde apps)

## ⚠️ Voorzorgen

Dit hulpprogramma bewerkt het register en verwijdert vooraf geïnstalleerde apps, dus **vink altijd eerst "Maak een systeemherstelpunt aan" aan** — gebruik het op eigen risico. De meeste wijzigingen kunnen ongedaan worden gemaakt met de "Herstellen"-functie in het hulpprogramma, en verwijderde apps kunnen opnieuw worden geïnstalleerd via de Microsoft Store.

> Als `Run.bat` kort flitst, open PowerShell handmatig als beheerder, `cd` naar de uitgepakte map en voer `.\Win11Debloat.ps1` uit.

## 🔗 Relatie met upstream

- Deze fork is **gebaseerd direct op de `master` van `Raphire/Win11Debloat`** en legt alleen taalpakketten en kleine fixes erbovenop, zodat hij upstream kan blijven volgen
- Taalpakketten volgen de upstream-conventie "één PR per taal", plus twee PR's voor de UTF-8-leesfix en woordingscorrecties
- Reeds upstream samengevoegd: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (UTF-8-lezen), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (vier bronstringcorrecties)
- Nog in review: de zes taalpakket-PR's `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Meld vertaalproblemen in [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

Voor de oorspronkelijke functieset (lijst met te verwijderen apps, commandoregelargumenten, Sysprep, config exporteren/importeren, enz.), zie de [upstream Wiki](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Credits en licentie

- Oorspronkelijke auteur [Raphire](https://github.com/Raphire) en alle bijdragers; dit project valt onder de [MIT-licentie](LICENSE)
- Als je het hulpprogramma leuk vindt, geef de auteur een Star in de [upstream-repo](https://github.com/Raphire/Win11Debloat), of [koop hun een koffie](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Andere taalversies

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
