# Win11Debloat 多语言版

[English](README-en_US.md) | **简体中文**

[![Release](https://img.shields.io/github/v/release/wang13zhe/Win11Debloat?style=for-the-badge&label=%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC)](https://github.com/wang13zhe/Win11Debloat/releases/latest)
[![Tests](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml/badge.svg)](https://github.com/wang13zhe/Win11Debloat/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Upstream](https://img.shields.io/badge/upstream-Raphire%2FWin11Debloat-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat)

> 基于原作者 [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat) 的社区分支。
> 保留原版全部精简能力，**界面支持 10 种语言，并跟随系统语言自动切换**。

![语言切换](Assets/Images/screenshots/language-menu.png)

## ✨ 这个分支做了什么

- 🌍 **10 种界面语言** —— 简体中文、繁體中文、English、日本語、한국어、Deutsch、Français、Español、Português (Brasil)、Русский
- 🧭 **自动识别系统语言** —— 精确匹配系统区域 → 同语言前缀回退（`de-AT` 用 `de-DE`、`zh-HK` 用 `zh-TW`）→ 英文兜底
- 🔄 **随时切换** —— 右上角 `☰` → 语言，切换后界面立即重建；选择写入 `Config/Language.json`，下次启动沿用
- 📦 **完整翻译** —— 界面文案、功能描述与悬停提示、分类、每个应用的名称与说明都已本地化，不是部分汉化
- 🩹 **顺手修的坑** —— 读取语言文件未指定 UTF-8（日/俄文会乱码甚至列表空白）、长译文被截断等问题

## 🌐 支持的语言

| 语言 | 代码 | 界面 | 功能描述 | 应用说明 |
| --- | --- | :-: | :-: | :-: |
| 简体中文 | `zh-CN` | ✅ | ✅ | ✅ |
| 繁體中文 | `zh-TW` | ✅ | ✅ | ✅ |
| English | `en-US` | ✅ | ✅ | ✅ |
| 日本語 | `ja-JP` | ✅ | ✅ | ✅ |
| 한국어 | `ko-KR` | ✅ | ✅ | ✅ |
| Deutsch | `de-DE` | ✅ | ✅ | ✅ |
| Français | `fr-FR` | ✅ | ✅ | ✅ |
| Español | `es-ES` | ✅ | ✅ | ✅ |
| Português (Brasil) | `pt-BR` | ✅ | ✅ | ✅ |
| Русский | `ru-RU` | ✅ | ✅ | ✅ |

三种界面示例：

| 简体中文 | Deutsch |
| --- | --- |
| ![简体中文](Assets/Images/screenshots/home-zh-CN.png) | ![Deutsch](Assets/Images/screenshots/home-de-DE.png) |

日本語的应用列表（应用名与说明同样本地化）：

![日本語](Assets/Images/screenshots/apps-ja-JP.png)

## 🚀 使用方法

1. 在 [Releases](https://github.com/wang13zhe/Win11Debloat/releases/latest) 下载 `Win11Debloat-CN-*.zip`
2. 解压到任意文件夹（**不要在压缩包里直接运行**）
3. 双击 `Run.bat`，在 UAC 提示中点击“是”
4. 打开后可随时通过右上角 `☰` → 语言 切换界面语言

也可以直接用命令行指定语言：

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

不指定时按“上次在界面里选的语言 → 系统语言 → 英文”的顺序决定。

## 📋 环境要求

- Windows 10 / Windows 11
- **Windows PowerShell 5.1**（系统自带）。脚本不支持 PowerShell 7 / pwsh
- 需要管理员权限（脚本会修改注册表并卸载预装应用）

## ⚠️ 注意事项

本工具会修改系统注册表并卸载预装应用，请**务必先勾选「创建系统还原点」**，风险自负。
大部分更改可通过工具内的“还原”功能撤回，卸载的应用也能从 Microsoft Store 重新安装。

> 如果 `Run.bat` 一闪而过，请手动以管理员身份打开 PowerShell，`cd` 到解压目录后执行 `.\Win11Debloat.ps1`。

## 🔗 与上游的关系

- 功能内核来自上游，本分支只改动本地化层（`Config/Languages/`）与少量配套代码
- 已向上游提交 6 个语言包 PR 与 1 个 UTF-8 读取修复 PR，编号 [#838 ~ #844](https://github.com/Raphire/Win11Debloat/pulls?q=is%3Apr+author%3Awang13zhe)
- 上游更新后本分支会跟进合并；欢迎在 [Issues](https://github.com/wang13zhe/Win11Debloat/issues) 反馈翻译问题

想了解原版完整功能（应用移除清单、命令行参数、Sysprep、导出/导入配置等），请看 [上游 Wiki](https://github.com/Raphire/Win11Debloat/wiki)。

## 🙏 致谢与许可

- 原作者 [Raphire](https://github.com/Raphire) 及所有贡献者，本项目遵循 [MIT 许可证](LICENSE)
- 喜欢这个工具的话，可以到 [上游仓库](https://github.com/Raphire/Win11Debloat) 给作者点个 Star，或[请作者喝杯咖啡](https://ko-fi.com/M4M5C6UPC)
