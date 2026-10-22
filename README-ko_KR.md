# Win11Debloat — 다국어 에디션

[简体中文](README.md) | [English](README-en_US.md) | 한국어

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat)의 커뮤니티 포크입니다.
> 모든 원본 디블로트 기능을 그대로 유지하면서, **UI는 12개 언어로 제공되며 시스템 언어를 자동으로 따릅니다**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ 이 포크가 추가한 기능

- 🌍 **12개 UI 언어** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **시스템 언어 자동 감지** — 정확한 지역 일치 → 동일 언어 접두사 폴백(`de-AT`은 `de-DE` 사용, `zh-HK`는 `zh-TW` 사용) → 최종 폴백은 영어
- 🔄 **체크 상태 유지하며 언제든 전환** — 우측 상단 ⚙ → Language; UI가 그 자리에서 새로고침되므로 **이미 선택한 항목이 초기화되지 않습니다**
- 📦 **전체 번역** — UI 텍스트, 기능 설명과 툴팁, 카테고리, 그리고 모든 앱의 이름과 설명이 번역되며 단순한 껍데기만 바뀌는 것이 아닙니다
- ⚡ **상태 읽기 속도 향상** — 레지스트리 경로 확인, `.reg` 파싱, Appx 쿼리를 한 번의 상태 새로고침 동안 캐시합니다. 모든 기능의 상태를 읽는 속도가 약 19% 빨라졌습니다
- 🩹 **도중에 수정한 버그** — 언어/설정 파일을 UTF-8이 아닌 인코딩으로 읽어 일본어/러시아어가 깨지거나 목록이 비어 보이던 문제, 긴 번역문이 잘리던 문제, 그리고 비영어 시스템에서 한 테스트가 잘못된 실패를 내던 문제를 해결했습니다

## 🌐 지원 언어

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

이 중 `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR`, `zh-CN`은 업스트림에서 가져왔으며,
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`, `zh-TW`는 이 포크에서 유지·관리하고 업스트림에 PR로 제출했습니다.

## 📸 스크린샷

설정에서 바로 언어를 전환할 수 있습니다(기본값은 "Follow system"):

![Language picker](Assets/Images/screenshots/language-picker.png)

기능 항목과 그 툴팁이 번역된 모습:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

앱 제거 페이지: 앱 이름, 설명, 경고가 번역되며, 문제 해결을 위해 `AppId`는 그대로 표시됩니다:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 사용법

1. [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)에서 `Win11Debloat-CN-*.zip`을 다운로드합니다
2. 아무 폴더나 압축을 풉니다(**zip 안에서 바로 실행하지 마세요**)
3. `Run.bat`을 더블클릭하고 UAC 프롬프트에서 "Yes"를 클릭합니다
4. 실행되면 우측 상단 ⚙을 통해 테마와 UI 언어를 언제든 전환할 수 있습니다

명령줄에서 언어를 직접 지정할 수도 있습니다:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

지정하지 않을 경우 우선순위는 `-Language` 인수 → UI에 저장된 선택 → 시스템 언어 → 영어 순입니다.
UI 선택은 `%LOCALAPPDATA%\Win11Debloat\Preferences.json`에 저장되며, 로그는 같은 폴더의 `Logs\`에 기록됩니다.

## 📋 요구 사항

- Windows 10 / Windows 11
- **Windows PowerShell 5.1**(OS에 기본 포함). 이 스크립트는 PowerShell 7 / pwsh를 지원하지 않습니다
- 관리자 권한(레지스트리를 수정하고 사전 설치된 앱을 제거하기 때문)

## ⚠️ 주의 사항

이 도구는 레지스트리를 수정하고 사전 설치된 앱을 제거하므로, **항상 먼저 "Create a system restore point"를 선택하세요** — 사용책임은 전적으로 본인에게 있습니다.
대부분의 변경은 도구 내 "Restore" 기능으로 되돌릴 수 있으며, 제거된 앱은 Microsoft Store에서 다시 설치할 수 있습니다.

> `Run.bat`이 금방 꺼지면, 관리자로 PowerShell을 직접 열고 압축을 푼 폴더로 `cd`한 뒤 `.\Win11Debloat.ps1`을 실행하세요.

## 🔗 업스트림과의 관계

- 이 포크는 **`Raphire/Win11Debloat`의 `master`를 직접 기반**으로 하며, 그 위에 언어 팩과 작은 수정만 덧붙이므로 업스트림을 계속 추적할 수 있습니다
- 언어 팩은 업스트림의 "언어별 1 PR" 관례를 따르며, UTF-8 읽기 수정과 문구 교정을 위한 PR 두 개를 추가로 포함합니다
- 이미 업스트림에 병합됨: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (UTF-8 읽기), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (소스 문자열 4개 교정)
- 아직 검토 중: 6개 언어 팩 PR `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- 번역 문제는 [Issues](https://github.com/wang13zhe/Win11Debloat/issues)에 보고해 주세요

원래의 기능 세트(앱 제거 목록, 명령줄 인수, Sysprep, 설정 내보내기/가져오기 등)는 [업스트림 위키](https://github.com/Raphire/Win11Debloat/wiki)를 참고하세요.

## 🙏 크레딧 및 라이선스

- 원작자 [Raphire](https://github.com/Raphire) 및 모든 기여자; 이 프로젝트는 [MIT 라이선스](LICENSE)를 따릅니다
- 도구가 마음에 드신다면, [업스트림 저장소](https://github.com/Raphire/Win11Debloat)에 Star를 눌러주시거나 [그들에게 커피를 사주세요](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 기타 언어 버전

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
