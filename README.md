# Win11Debloat

[English](README-en_US.md) | **简体中文**

[![GitHub 发布](https://img.shields.io/github/v/release/Raphire/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/Raphire/Win11Debloat/releases/latest)
[![加入讨论](https://img.shields.io/badge/Join-the%20Discussion-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat/discussions)
[![静态徽章](https://img.shields.io/badge/Documentation-_?style=for-the-badge&logo=bookstack&color=grey)](https://github.com/Raphire/Win11Debloat/wiki/)

 Win11Debloat 是一个轻量级、易于使用的 PowerShell 脚本，可让您快速整理并自定义您的 Windows 体验，无需安装！您可以使用它来移除预安装应用、禁用遥测、移除侵入性界面元素等等。无需费力地自行浏览所有设置或逐个移除应用。Win11Debloat 让这个过程变得快速又简单！

该脚本还包含许多系统管理员和高级用户会喜欢的功能。例如强大的命令行界面、对 Windows 审核模式的支持，以及更改其他 Windows 用户设置的能力。您还可以轻松导出和导入您的首选设置，从而快速在所有系统上应用相同设置。请参阅我们的 [wiki](https://github.com/Raphire/Win11Debloat/wiki) 了解更多详情。

![Win11Debloat 菜单](/Assets/Images/menu.png)

#### 这个脚本对您有帮助吗？请考虑请我喝杯咖啡来支持我的工作

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/M4M5C6UPC)

## 使用方法

> [!Warning]
> 我们已非常谨慎地确保此脚本不会意外破坏任何操作系统功能，但使用风险自负！如果您遇到任何问题，请[在这里](https://github.com/Raphire/Win11Debloat/issues)报告。

### 快速方法

通过 PowerShell 自动下载并运行脚本。

1. 打开 PowerShell 或终端。
2. 将以下命令复制并粘贴到 PowerShell 中：

```PowerShell
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```

3. 等待脚本自动下载并启动 Win11Debloat。
4. 仔细阅读并遵循屏幕上的说明。

此方法支持命令行参数来自定义脚本的行为。请点击[这里](https://github.com/Raphire/Win11Debloat/wiki/Command%E2%80%90line-Interface#parameters)了解更多信息。

### 传统方法

<details>
  <summary>手动下载并运行脚本。</summary><br/>

  1. [下载最新版本的脚本](https://github.com/Raphire/Win11Debloat/releases/latest)，并将 .ZIP 文件解压到您想要的位置。
  2. 导航到 Win11Debloat 文件夹
  3. 双击 `Run.bat` 文件以启动脚本。注意：如果控制台窗口立即关闭且没有任何反应，请尝试下面的高级方法。
  4. 接受 Windows UAC 提示以管理员身份运行脚本，这是脚本正常运行所必需的。
  5. 仔细阅读并遵循屏幕上的说明。
</details>

### 高级方法

<details>
  <summary>手动下载脚本并通过 PowerShell 运行脚本。推荐高级用户使用。</summary><br/>

  1. [下载最新版本的脚本](https://github.com/Raphire/Win11Debloat/releases/latest)，并将 .ZIP 文件解压到您想要的位置。
  2. 以管理员身份打开 PowerShell 或终端。
  3. 通过输入以下命令临时启用 PowerShell 执行：

  ```PowerShell
  Set-ExecutionPolicy Bypass -Scope Process -Force
  ```

  4. 在 PowerShell 中，导航到文件解压到的目录。示例：`cd c:\Win11Debloat`
  5. 现在通过输入以下命令运行脚本：

  ```PowerShell
  .\Win11Debloat.ps1
  ```

  6. 仔细阅读并遵循屏幕上的说明。

  此方法支持命令行参数来自定义脚本的行为。请点击[这里](https://github.com/Raphire/Win11Debloat/wiki/Command%E2%80%90line-Interface#parameters)了解更多信息。
</details>

## 功能

以下是 Win11Debloat 提供的关键特性和功能概述。您可以访问 [wiki](https://github.com/Raphire/Win11Debloat/wiki) 了解更多详情。

> [!Tip]
> Win11Debloat 所做的所有更改都可以轻松还原，几乎所有应用都可以通过 Microsoft Store 重新安装。您可以访问 [wiki](https://github.com/Raphire/Win11Debloat/wiki/Reverting-Changes) 了解更多关于还原更改的信息。

#### 应用移除

- 移除各种预安装应用。点击[这里](https://github.com/Raphire/Win11Debloat/wiki/App-Removal)了解更多信息。

#### 隐私与建议内容

- 禁用遥测、诊断数据、活动历史记录、应用启动跟踪和定向广告。
- 禁用 Windows、锁屏和 Microsoft Edge 中的提示、技巧、建议和广告。
- 禁用 Windows 位置服务、应用位置访问和“查找我的设备”位置跟踪。
- 隐藏设置“主页”上的 Microsoft 365 广告，或完全隐藏“主页”。

#### AI 功能

- 禁用并移除 Microsoft Copilot、Windows Recall 和 Click to Do。
- 阻止 AI 服务 (WSAIFabricSvc) 自动启动。
- 禁用 Edge、画图和记事本中的 AI 功能。

#### 系统

- 禁用用于共享和移动文件的拖动托盘。
- 恢复旧版 Windows 10 风格上下文菜单。
- 关闭增强指针精度（鼠标加速）。
- 禁用粘滞键键盘快捷方式。
- 禁用存储感知自动磁盘清理。
- 禁用快速启动以确保完全关机。
- 禁用 BitLocker 自动设备加密。
- 在新式待机期间禁用网络连接以减少电池消耗。

#### Windows 更新

- 阻止 Windows 一有更新就获取。
- 阻止登录时更新后自动重启。
- 禁用与其他 PC 共享已下载的更新，也称为传递优化。
- 阻止 Windows 自动安装设备配套应用，例如 LG Monitor App、Alienware Command Center 等。

#### 外观

- 为系统和应用启用深色模式。
- 禁用透明、动画和视觉效果。
- 隐藏桌面聚焦的“了解此图片”快捷方式，或完全禁用 Windows 聚焦背景选项。

#### 开始菜单和搜索

- 通过移除固定应用、隐藏推荐并自定义“所有应用”部分来自定义开始菜单。
- 禁用开始菜单中的手机连接移动设备集成。
- 禁用 Windows 搜索中的 Bing 网页搜索和 Copilot 集成以及 Microsoft Store 应用建议。

#### 任务栏

- 更改任务栏对齐方式。
- 自定义或隐藏任务栏按钮，例如搜索栏、任务视图等。
- 禁用任务栏和锁屏上的小组件。
- 在任务栏右键菜单中启用“结束任务”选项，以便快速强制关闭应用。
- 在任务栏应用区域启用“最后活动点击”行为。这允许您重复点击任务栏中某个应用的图标，以在该应用打开的窗口之间切换焦点。
- 自定义应用按钮在任务栏上的显示方式。

#### 文件资源管理器

- 更改文件资源管理器打开的默认位置。
- 显示已知文件类型的文件扩展名。
- 显示隐藏的文件、文件夹和驱动器。
- 从文件资源管理器导航窗格中隐藏“主页”、“图库”或 OneDrive 部分。
- 从文件资源管理器导航窗格中隐藏重复的可移动驱动器条目，以便只保留“此电脑”下的条目。
- 将所有常用文件夹（桌面、下载等）重新添加到文件资源管理器中的“此电脑”。
- 更改文件资源管理器中驱动器号的位置或可见性。

#### 多任务

- 禁用窗口贴靠。
- 在拖动或贴靠窗口时禁用贴靠助手和贴靠布局建议。
- 更改贴靠窗口或按 Alt+Tab 时是否显示选项卡。

#### 可选 Windows 功能

- 启用 Windows 沙盒，一个用于安全隔离运行应用的轻量级桌面环境。
- 启用适用于 Linux 的 Windows 子系统，它允许您直接在 Windows 上运行 Linux 环境。

#### 其他

- 禁用 Xbox 游戏栏集成和游戏/屏幕录制。如果您卸载 Xbox 游戏栏，这也会禁用 `ms-gamingoverlay`/`ms-gamebar` 弹出窗口。
- 禁用 Brave 浏览器中的臃肿内容（AI、加密货币、新闻等）

#### 高级功能

- 能够[将更改应用到其他用户](https://github.com/Raphire/Win11Debloat/wiki/Advanced-Features#running-as-another-user)，而不是当前登录的用户。
- [Sysprep 模式](https://github.com/Raphire/Win11Debloat/wiki/Advanced-Features#sysprep-mode)将更改应用到 Windows 默认用户配置文件。这确保所有新用户都会自动应用这些更改。

## 贡献

我们欢迎各种形式的贡献！请参阅我们的[贡献指南](https://github.com/Raphire/Win11Debloat/blob/master/.github/CONTRIBUTING.md)，了解如何开始以及贡献最佳实践的详细说明。

## 许可证

Win11Debloat 根据 MIT 许可证授权。有关更多信息，请参阅 LICENSE 文件。
