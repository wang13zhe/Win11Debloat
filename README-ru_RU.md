# Win11Debloat — Многоязычная версия

[简体中文](README.md) | [English](README-en_US.md) | Русский

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> Форк сообщества проекта [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Сохраняет все оригинальные возможности очистки — **интерфейс доступен на 12 языках и автоматически подстраивается под язык вашей системы**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ Что добавляет эта вилка

- 🌍 **12 языков интерфейса** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Автоопределение языка системы** — точное совпадение региона → запасной вариант с тем же префиксом языка (`de-AT` использует `de-DE`, `zh-HK` использует `zh-TW`) → английский как окончательный запасной вариант
- 🔄 **Переключение в любое время без потери отметок** — ⚙ в правом верхнем углу → Language; интерфейс обновляется на месте, поэтому **ранее отмеченные вами пункты не сбрасываются**
- 📦 **Полный перевод** — текст интерфейса, описания функций и подсказки, категории, а также названия и описания каждого приложения локализованы, а не только оболочка
- ⚡ **Более быстрое чтение состояния** — пути разрешения реестра, разбор `.reg` и запросы Appx кэшируются для одного обновления состояния; чтение состояния каждой функции стало примерно на 19% быстрее
- 🩹 **Исправленные по пути ошибки** — файлы языка/конфигурации не читались как UTF-8 (японский/русский отображались кракозябрами или даже пустыми списками), длинные переводы обрезались, а один тест давал ложный сбой в неанглоязычных системах

## 🌐 Поддерживаемые языки

| Language | Code | UI | Feature descriptions | App descriptions |
| --- | --- :-: | :-: | :-: |
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

Из них `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` и `zh-CN` взяты из основного проекта;
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` и `zh-TW` поддерживаются этой вилкой и отправлены в основной проект как PR.

## 📸 Скриншоты

Язык можно переключать прямо в Настройках (по умолчанию — «Следовать системе»):

![Language picker](Assets/Images/screenshots/language-picker.png)

Пункты функций и их подсказки, локализованные:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

Страница удаления приложений: названия, описания и предупреждения приложений локализованы, а `AppId` остаётся дословно для устранения неполадок:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Использование

1. Скачайте `Win11Debloat-CN-*.zip` из раздела [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)
2. Распакуйте в любую папку (**не запускайте изнутри zip**)
3. Дважды щёлкните `Run.bat` и нажмите «Да» в запросе UAC
4. После открытия переключайте тему и язык интерфейса в любое время через ⚙ в правом верхнем углу

Также можно выбрать язык напрямую в командной строке:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

Если не указано, порядок такой: аргумент `-Language` → выбор, сохранённый в интерфейсе → язык системы → английский.
Выбор интерфейса сохраняется в `%LOCALAPPDATA%\Win11Debloat\Preferences.json`; журналы находятся в `Logs\` в той же папке.

## 📋 Требования

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (поставляется с ОС). Скрипт не поддерживает PowerShell 7 / pwsh
- Права администратора (он изменяет реестр и удаляет предустановленные приложения)

## ⚠️ Предостережения

Этот инструмент изменяет реестр и удаляет предустановленные приложения, поэтому **всегда сначала отмечайте «Создать точку восстановления системы»** — используйте его на свой страх и риск.
Большинство изменений можно отменить встроенной функцией «Восстановить» (Restore), а удалённые приложения можно переустановить из Microsoft Store.

> Если `Run.bat` мелькает и закрывается, откройте PowerShell от имени администратора вручную, перейдите (`cd`) в распакованную папку и выполните `.\Win11Debloat.ps1`.

## 🔗 Связь с основным проектом

- Эта вилка **основана напрямую на `master` проекта `Raphire/Win11Debloat`** и поверх него добавляет только языковые пакеты и небольшие исправления, поэтому может и дальше следовать за основным проектом
- Языковые пакеты следуют принятому в основном проекте соглашению «один PR на язык», плюс два PR для исправления чтения UTF-8 и правок формулировок
- Уже принято в основном проекте: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (чтение UTF-8), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (четыре исправления исходных строк)
- Всё ещё на рассмотрении: шесть PR языковых пакетов `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Сообщайте о проблемах перевода в [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

Оригинальный набор функций (список удаляемых приложений, аргументы командной строки, Sysprep, экспорт/импорт конфигурации и т. д.) см. в [вики основного проекта](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Благодарности и лицензия

- Автор оригинала [Raphire](https://github.com/Raphire) и все участники; проект распространяется под [лицензией MIT](LICENSE)
- Если инструмент вам нравится, поставьте автору звезду в [репозитории основного проекта](https://github.com/Raphire/Win11Debloat) или [купите ему кофе](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Другие языковые версии

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
