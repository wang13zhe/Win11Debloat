# Win11Debloat

[![GitHub Release](https://img.shields.io/github/v/release/Raphire/Win11Debloat?style=for-the-badge&label=Latest%20release)](https://github.com/Raphire/Win11Debloat/releases/latest)
[![Join the Discussion](https://img.shields.io/badge/Join-the%20Discussion-2D9F2D?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Raphire/Win11Debloat/discussions)
[![Static Badge](https://img.shields.io/badge/Documentation-_?style=for-the-badge&logo=bookstack&color=grey)](https://github.com/Raphire/Win11Debloat/wiki/)

[English](README_en-US.md)

Win11Debloat 是一款轻量、易用的 PowerShell 脚本，无需安装即可帮助您快速整理和自定义 Windows 体验！您可以使用它来移除预装应用（pre-installed apps）、禁用遥测（telemetry）、移除干扰性界面元素（intrusive interface elements）等。不必再费力逐个调整设置或手动卸载应用，Win11Debloat 让整个过程变得快速简单！

该脚本还包含许多系统管理员和高级用户（power user）会喜爱的功能，例如强大的命令行界面（command-line interface）、对 Windows 审核模式（Audit mode）的支持，以及为其他 Windows 用户应用更改的能力。您还可以轻松导出和导入偏好设置，从而在所有系统上快速应用相同的配置。更多详情，请参阅我们的 [wiki](https://github.com/Raphire/Win11Debloat/wiki)。

![Win11Debloat Menu](/Assets/Images/menu.png)

#### 这个脚本对您有帮助吗？不妨请我喝杯咖啡，支持一下我的工作

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/M4M5C6UPC)

## 使用方法

> [!Warning]
> 我们已竭尽全力确保本脚本不会意外破坏任何操作系统功能，但使用风险自负！如果遇到任何问题，请在[此处](https://github.com/Raphire/Win11Debloat/issues)报告。

### 快速方法

通过 PowerShell 自动下载并运行脚本。

1. 打开 PowerShell 或终端（Terminal）。
2. 将以下命令复制并粘贴到 PowerShell 中：

```PowerShell
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```

3. 等待脚本自动下载并启动 Win11Debloat。
4. 仔细阅读并按照屏幕上的指示操作。

该方法支持通过命令行参数自定义脚本行为。请点击[此处](https://github.com/Raphire/Win11Debloat/wiki/Command%E2%80%90line-Interface#parameters)了解更多信息。

### 传统方法

<details>
  <summary>手动下载并运行脚本。</summary><br/>

  1. [下载最新版本的脚本](https://github.com/Raphire/Win11Debloat/releases/latest)，并将 .ZIP 文件解压到您想要的位置。
  2. 进入 Win11Debloat 文件夹。
  3. 双击 `Run.bat` 文件以启动脚本。注意：如果控制台窗口立即关闭且无任何反应，请尝试下方的高级方法。
  4. 接受 Windows UAC 提示，以管理员身份运行脚本，这是脚本正常运行所必需的。
  5. 仔细阅读并按照屏幕上的指示操作。
</details>

### 高级方法

<details>
  <summary>手动下载脚本并通过 PowerShell 运行。推荐高级用户使用。</summary><br/>

  1. [下载最新版本的脚本](https://github.com/Raphire/Win11Debloat/releases/latest)，并将 .ZIP 文件解压到您想要的位置。
  2. 以管理员身份打开 PowerShell 或终端。
  3. 输入以下命令，临时启用 PowerShell 执行策略：

  ```PowerShell
  Set-ExecutionPolicy Unrestricted -Scope Process -Force
  ```

  4. 在 PowerShell 中，导航至文件解压所在的目录。例如：`cd c:\Win11Debloat`
  5. 现在，输入以下命令运行脚本：

  ```PowerShell
  .\Win11Debloat.ps1
  ```

  6. 仔细阅读并按照屏幕上的指示操作。

  该方法支持通过命令行参数自定义脚本行为。请点击[此处](https://github.com/Raphire/Win11Debloat/wiki/Command%E2%80%90line-Interface#parameters)了解更多信息。
</details>

## 功能

以下是 Win11Debloat 提供的主要特性和功能概览。您可以访问 [wiki](https://github.com/Raphire/Win11Debloat/wiki) 了解更多详情。

> [!Tip]
> Win11Debloat 所做的所有更改都可以轻松还原，几乎所有应用都可以通过 Microsoft Store 重新安装。有关还原更改的更多信息，请访问 [wiki](https://github.com/Raphire/Win11Debloat/wiki/Reverting-Changes)。

#### 应用移除

- 移除各种预装应用。点击[此处](https://github.com/Raphire/Win11Debloat/wiki/App-Removal)了解更多信息。

#### 隐私与推荐内容

- 禁用遥测（telemetry）、诊断数据、活动历史记录（activity history）、应用启动跟踪（app-launch tracking）和定向广告（targeted ads）。
- 在 Windows、锁屏界面（lock screen）和 Microsoft Edge 中禁用提示、技巧、建议和广告。
- 禁用 Windows 位置服务、应用位置访问权限和“查找我的设备”位置跟踪。
- 隐藏设置“主页”上的 Microsoft 365 广告，或完全隐藏“主页”页面。

#### AI 功能

- 禁用并移除 Microsoft Copilot、Windows Recall 和 Click to Do。
- 阻止 AI 服务（WSAIFabricSvc）自动启动。
- 禁用 Edge、画图和记事本中的 AI 功能。

#### 系统

- 禁用用于共享和移动文件的拖拽托盘（Drag Tray）。
- 恢复旧版 Windows 10 风格的上下文菜单（context menu）。
- 关闭“提高指针精确度”，即鼠标加速。
- 禁用粘滞键（Sticky Keys）键盘快捷键。
- 禁用存储感知（Storage Sense）自动磁盘清理。
- 禁用快速启动以确保完全关机。
- 禁用 BitLocker 自动设备加密。
- 在新式待机（Modern Standby）期间禁用网络连接以减少电池消耗。

#### Windows 更新

- 阻止 Windows 在有更新可用时立即获取更新。
- 阻止在登录状态下更新后自动重启。
- 禁止与其他电脑共享已下载的更新，即传递优化（Delivery Optimization）。

#### 外观

- 为系统和应用启用深色模式。
- 禁用透明度、动画和视觉效果。

#### 开始菜单与搜索

- 通过移除已固定应用、隐藏推荐内容及自定义“所有应用”部分来定制开始菜单（Start Menu）。
- 禁用在开始菜单中的 Phone Link 移动设备集成。
- 禁用 Windows 搜索中的 Bing 网页搜索、Copilot 集成和 Microsoft Store 应用建议。

#### 任务栏

- 更改任务栏（taskbar）对齐方式。
- 自定义或隐藏任务栏按钮，如搜索栏、任务视图等。
- 禁用任务栏和锁屏界面上的小组件（Widgets）。
- 在任务栏右键菜单中启用“结束任务”选项，以便快速强制关闭应用。
- 在任务栏应用区域启用“上次活动点击”行为。这样，您可以重复点击任务栏中某个应用程序的图标，在其打开的窗口之间切换焦点。
- 自定义任务栏上应用按钮的显示方式。

#### 文件资源管理器

- 更改文件资源管理器（File Explorer）打开时的默认位置。
- 显示已知文件类型的扩展名。
- 显示隐藏文件、文件夹和驱动器。
- 在文件资源管理器导航窗格中隐藏“主页”、“图库”或 OneDrive 部分。
- 在文件资源管理器导航窗格中隐藏重复的可移动驱动器条目，仅保留“此电脑”下的条目。
- 将所有常用文件夹（桌面、下载等）重新添加到文件资源管理器的“此电脑”中。
- 更改文件资源管理器中驱动器号的位置或可见性。

#### 多任务处理

- 禁用窗口贴靠。
- 在拖动或贴靠窗口时，禁用贴靠助手（Snap Assist）和贴靠布局建议。
- 更改贴靠窗口或按 Alt+Tab 时是否显示选项卡。

#### 可选 Windows 功能

- 启用 Windows 沙盒（Windows Sandbox），这是一个轻量级桌面环境，用于在隔离环境中安全运行应用程序。
- 启用 Windows Subsystem for Linux，以便在 Windows 上直接运行 Linux 环境。

#### 其他

- 禁用 Xbox Game Bar 集成和游戏/屏幕录制。如果您卸载了 Xbox Game Bar，这也会禁用 `ms-gamingoverlay`/`ms-gamebar` 弹窗。
- 禁用 Brave 浏览器中的臃肿内容（AI、加密、新闻等）。

#### 高级功能

- 能够[将更改应用到其他用户](https://github.com/Raphire/Win11Debloat/wiki/Advanced-Features#running-as-another-user)，而非当前登录的用户。
- [Sysprep 模式](https://github.com/Raphire/Win11Debloat/wiki/Advanced-Features#sysprep-mode)，可将更改应用到 Windows 默认用户配置文件。这能确保所有新用户都会自动应用这些更改。

## 参与贡献

我们欢迎各种形式的贡献！请参阅我们的[贡献指南](https://github.com/Raphire/Win11Debloat/blob/main/.github/CONTRIBUTING.md)，了解如何开始以及贡献的最佳实践。

## 许可证

Win11Debloat 使用 MIT 许可证授权。有关更多信息，请参阅 LICENSE 文件。