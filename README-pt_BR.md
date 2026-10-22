# Win11Debloat — Edição multilíngue

[简体中文](README.md) | [English](README-en_US.md) | Português (Brasil)

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> Um fork comunitário de [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Mantém todos os recursos originais de debloat — **a interface está disponível em 12 idiomas e segue automaticamente o idioma do seu sistema**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ O que este fork adiciona

- 🌍 **12 idiomas na interface** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Detecta automaticamente o idioma do sistema** — correspondência exata de região → fallback por prefixo de mesmo idioma (`de-AT` usa `de-DE`, `zh-HK` usa `zh-TW`) → inglês como fallback final
- 🔄 **Alterne a qualquer momento sem perder suas marcações** — ⚙ no canto superior direito → Idioma; a interface é atualizada no local, então **os itens que você já marcou não são redefinidos**
- 📦 **Tradução completa** — textos da interface, descrições de recursos e dicas (tooltips), categorias e o nome e a descrição de cada aplicativo são localizados, não apenas uma casca
- ⚡ **Leituras de estado mais rápidas** — a resolução de caminhos do registro, a análise de `.reg` e as consultas Appx são armazenadas em cache para uma atualização de estado; a leitura do estado de cada recurso foi cerca de 19% mais rápida
- 🩹 **Bugs corrigidos ao longo do caminho** — os arquivos de idioma/configuração não eram lidos como UTF-8 (japonês/russo exibiam mojibake ou até listas em branco), traduções longas eram truncadas e um teste produzia uma falha falsa em sistemas não ingleses

## 🌐 Idiomas compatíveis

| Idioma | Código | Interface | Descrições de recursos | Descrições de aplicativos |
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

Destes, `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` e `zh-CN` vêm do projeto original (upstream);
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` e `zh-TW` são mantidos por este fork e enviados ao projeto original como PRs.

## 📸 Capturas de tela

Você pode trocar de idioma diretamente em Configurações (o padrão é "Seguir o sistema"):

![Language picker](Assets/Images/screenshots/language-picker.png)

Itens de recursos e suas dicas (tooltips), localizados:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

A página de remoção de aplicativos: nomes, descrições e avisos dos aplicativos são localizados, enquanto o `AppId` permanece exatamente como está para fins de solução de problemas:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Uso

1. Baixue `Win11Debloat-CN-*.zip` em [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)
2. Extraia para qualquer pasta (**não execute de dentro do zip**)
3. Clique duas vezes em `Run.bat` e clique em "Sim" no aviso do UAC
4. Depois de aberto, troque o tema e o idioma da interface a qualquer momento pelo ⚙ no canto superior direito

Você também pode escolher um idioma diretamente na linha de comando:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

Quando não for especificado, a ordem é: argumento `-Language` → a escolha salva na interface → idioma do sistema → inglês.
A escolha da interface é salva em `%LOCALAPPDATA%\Win11Debloat\Preferences.json`; os logs ficam em `Logs\` dentro da mesma pasta.

## 📋 Requisitos

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (já vem com o sistema operacional). O script não é compatível com PowerShell 7 / pwsh
- Direitos de administrador (ele edita o registro e remove aplicativos pré-instalados)

## ⚠️ Ressalvas

Esta ferramenta edita o registro e remove aplicativos pré-instalados, portanto **marque sempre primeiro "Criar um ponto de restauração do sistema"** — use por sua conta e risco.
A maioria das alterações pode ser desfeita com o recurso "Restaurar" da própria ferramenta, e os aplicativos removidos podem ser reinstalados na Microsoft Store.

> Se o `Run.bat` fechar rapidamente, abra o PowerShell como administrador manualmente, use `cd` na pasta extraída e execute `.\Win11Debloat.ps1`.

## 🔗 Relação com o projeto original

- Este fork é **baseado diretamente no `master` do `Raphire/Win11Debloat`** e apenas sobrepõe pacotes de idiomas e pequenas correções, podendo assim continuar acompanhando o projeto original
- Os pacotes de idiomas seguem a convenção do projeto original de "um PR por idioma", além de dois PRs para a correção de leitura UTF-8 e ajustes de texto
- Já mesclados no projeto original: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (leitura UTF-8), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (quatro correções de strings de origem)
- Ainda em análise: os seis PRs de pacotes de idiomas `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Reporte problemas de tradução em [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

Para o conjunto original de recursos (lista de remoção de aplicativos, argumentos de linha de comando, Sysprep, exportar/importar configuração etc.), consulte a [Wiki do projeto original](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Créditos e licença

- Autor original [Raphire](https://github.com/Raphire) e todos os colaboradores; este projeto está sob a [licença MIT](LICENSE)
- Se você gostou da ferramenta, dê uma estrela ao autor no [repositório original](https://github.com/Raphire/Win11Debloat) ou [pague um café para eles](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Outras versões em idiomas

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
