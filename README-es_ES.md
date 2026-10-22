# Win11Debloat — Edición multilingüe

[简体中文](README.md) | [English](README-en_US.md) | Español

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> Una bifurcación comunitaria de [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat).
> Conserva todas las funciones originales de eliminación de bloat — **la interfaz está disponible en 12 idiomas y sigue automáticamente el idioma de tu sistema**.

![Language picker](Assets/Images/screenshots/language-picker.png)

## ✨ Qué añade esta bifurcación

- 🌍 **12 idiomas en la interfaz** — 简体中文, 繁體中文, English, 日本語, 한국어, Deutsch, Français, Español, Italiano, Nederlands, Português (Brasil), Русский
- 🧭 **Detección automática del idioma del sistema** — coincidencia exacta de región → reserva con prefijo de mismo idioma (`de-AT` usa `de-DE`, `zh-HK` usa `zh-TW`) → inglés como reserva final
- 🔄 **Cambia de idioma en cualquier momento sin perder tus marcas** — ⚙ en la esquina superior derecha → Idioma; la interfaz se actualiza en su sitio, por lo que **los elementos que ya marcaste no se reinician**
- 📦 **Traducción completa** — el texto de la interfaz, las descripciones de las funciones y los tooltips, las categorías, y el nombre y la descripción de cada aplicación están localizados, no es solo una capa superficial
- ⚡ **Lectura de estado más rápida** — la resolución de rutas del registro, el análisis de archivos `.reg` y las consultas de Appx se almacenan en caché para una actualización de estado; leer el estado de cada función fue aproximadamente un 19 % más rápido
- 🩹 **Errores corregidos por el camino** — los archivos de idioma/configuración no se leían como UTF-8 (el japonés/ruso mostraba caracteres corruptos o incluso listas en blanco), las traducciones largas se truncaban, y una prueba daba un falso fallo en sistemas no ingleses

## 🌐 Idiomas compatibles

| Idioma | Código | Interfaz | Descripciones de funciones | Descripciones de aplicaciones |
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

De estos, `en-US`, `it-IT`, `ja-JP`, `nl-NL`, `pt-BR` y `zh-CN` provienen de la versión original (upstream);
`de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU` y `zh-TW` los mantiene esta bifurcación y se envían a la versión original como PR.

## 📸 Capturas de pantalla

Puedes cambiar de idioma directamente en Configuración (el valor predeterminado es «Seguir el sistema»):

![Language picker](Assets/Images/screenshots/language-picker.png)

Elementos de funciones y sus tooltips, localizados:

![Tweaks](Assets/Images/screenshots/tweaks-zh-CN.png)

La página de eliminación de aplicaciones: los nombres, descripciones y advertencias de las aplicaciones están localizados, mientras que el `AppId` se mantiene literal para la resolución de problemas:

![Apps](Assets/Images/screenshots/apps-zh-CN.png)

## 🚀 Uso

1. Descarga `Win11Debloat-CN-*.zip` desde [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest)
2. Extrae a cualquier carpeta (**no lo ejecutes desde dentro del zip**)
3. Haz doble clic en `Run.bat` y pulsa «Sí» en la solicitud de UAC
4. Una vez abierto, cambia el tema y el idioma de la interfaz en cualquier momento mediante el ⚙ de la esquina superior derecha

También puedes elegir un idioma directamente desde la línea de comandos:

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

Cuando no se especifica, el orden es: argumento `-Language` → la opción guardada en la interfaz → idioma del sistema → inglés.
La opción de la interfaz se guarda en `%LOCALAPPDATA%\Win11Debloat\Preferences.json`; los registros se guardan en `Logs\` dentro de la misma carpeta.

## 📋 Requisitos

- Windows 10 / Windows 11
- **Windows PowerShell 5.1** (incluido con el sistema operativo). El script no es compatible con PowerShell 7 / pwsh
- Derechos de administrador (edita el registro y elimina aplicaciones preinstaladas)

## ⚠️ Advertencias

Esta herramienta edita el registro y elimina aplicaciones preinstaladas, por lo que **marca siempre primero «Crear un punto de restauración del sistema»** — úsala bajo tu propia responsabilidad.
La mayoría de los cambios se pueden deshacer con la función «Restaurar» integrada en la herramienta, y las aplicaciones eliminadas se pueden reinstalar desde la Microsoft Store.

> Si `Run.bat` se cierra de golpe, abre PowerShell como administrador manualmente, sitúate con `cd` en la carpeta extraída y ejecuta `.\Win11Debloat.ps1`.

## 🔗 Relación con la versión original

- Esta bifurcación se **basa directamente en la rama `master` de `Raphire/Win11Debloat`** y solo añade paquetes de idioma y pequeñas correcciones por encima, por lo que puede seguir la versión original
- Los paquetes de idioma siguen la convención de la versión original de «un PR por idioma», más dos PR para la corrección de lectura UTF-8 y correcciones de redacción
- Ya fusionado en la versión original: [#844](https://github.com/Raphire/Win11Debloat/pull/844) (lectura UTF-8), [#846](https://github.com/Raphire/Win11Debloat/pull/846) (cuatro correcciones de cadenas de origen)
- Aún en revisión: los seis PR de paquetes de idioma `zh-TW`, `de-DE`, `es-ES`, `fr-FR`, `ko-KR`, `ru-RU`
- Reporta problemas de traducción en [Issues](https://github.com/wang13zhe/Win11Debloat/issues)

Para el conjunto de funciones original (lista de eliminación de aplicaciones, argumentos de línea de comandos, Sysprep, exportar/importar configuración, etc.), consulta la [Wiki de la versión original](https://github.com/Raphire/Win11Debloat/wiki).

## 🙏 Créditos y licencia

- Autor original [Raphire](https://github.com/Raphire) y todos los colaboradores; este proyecto está bajo la [licencia MIT](LICENSE)
- Si te gusta la herramienta, dale una estrella al autor en el [repositorio original](https://github.com/Raphire/Win11Debloat), o [invítale un café](https://ko-fi.com/M4M5C6UPC)

---

## 🌐 Otras versiones en idiomas

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
