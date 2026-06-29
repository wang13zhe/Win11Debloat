# 如何贡献？

[English](.github/CONTRIBUTING_en-US.md)

我们欢迎来自社区的贡献。您可以通过以下方式为 Win11Debloat 做贡献：

- 在此处[报告问题与缺陷（issues and bugs）](https://github.com/Raphire/Win11Debloat/issues/new?template=bug_report.yml)
- 在此处[提交功能请求（feature requests）](https://github.com/Raphire/Win11Debloat/issues/new?template=feature_request.yml)
- 测试 Win11Debloat
- 创建拉取请求（pull request）
- 改进文档

# 测试 Win11Debloat

您可以协助我们测试脚本的最新更改和新增功能。如果遇到任何问题，请在此处[报告](https://github.com/Raphire/Win11Debloat/issues/new?template=bug_report.yml)。

> [!警告]
> Win11Debloat 的预发布版本（prerelease version）仅供开发者测试脚本使用。请勿在生产环境中使用！

您可以通过运行以下命令来启动 Win11Debloat 的预发布版本：

```ps1
& ([scriptblock]::Create((irm "https://debloat.raphi.re/"))) -Dev
```

# 贡献代码

## 开始之前

### 复刻（Fork）并克隆（Clone）仓库

1. 在 GitHub 上点击仓库页面右上角的“Fork”按钮，复刻该项目。

2. 将仓库克隆到本地计算机：

   ```powershell
   git clone https://github.com/YOUR-USERNAME/Win11Debloat.git
   cd Win11Debloat
   ```

3. 为您的贡献创建一个新分支：

   ```powershell
   git checkout -b feature/your-feature-name
   ```

### 在本地运行脚本

1. 以管理员身份打开 PowerShell。
2. 如有必要，启用脚本执行：

   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process -Force
   ```

3. 导航到您的 Win11Debloat 目录。
4. 运行脚本：

   ```powershell
   .\Win11Debloat.ps1
   ```

## 实现指南

### 项目结构

了解项目结构对于有效贡献至关重要：

```text
Win11Debloat/
├── Win11Debloat.ps1             # 主 PowerShell 脚本
├── Run.bat                      # 快速启动方式的批处理启动器
├── Scripts/                     # 附加 PowerShell 脚本和函数
│   ├── Get.ps1                  # 用于快速启动方式，自动下载并运行 Win11Debloat 的脚本
│   ├── AppRemoval/              # 应用包移除逻辑
│   ├── CLI/                     # 命令行界面（CLI）辅助工具
│   ├── Features/                # 功能应用/撤销逻辑（例如 InvokeChanges.ps1, ReplaceStartMenu.ps1）
│   ├── FileIO/                  # 文件输入/输出辅助工具
│   ├── GUI/                     # 图形用户界面（GUI）窗口定义和逻辑
│   ├── Helpers/                 # 共享辅助函数
│   └── Threading/               # 线程工具
├── Config/
│   ├── Apps.json                # 支持移除的应用列表
│   ├── DefaultSettings.json     # 默认配置预设
│   ├── Features.json            # 所有功能的元数据
│   └── LastUsedSettings.json    # 上次使用的配置（使用过程中生成）
├── Regfiles/                    # 所有功能的注册表文件
│   ├── Undo/                    # 用于撤销功能的注册表文件
│   └── Sysprep/                 # 用于 Sysprep 模式的注册表文件
├── Schemas/                     # GUI 元素的 XAML 架构
├── Assets/                      # 静态资源（图标、开始菜单模板）
├── Backups/                     # 注册表备份（使用过程中生成）
└── Logs/                        # 脚本日志（使用过程中生成）
```

### 最佳实践

1. **充分测试**：在提交之前，始终在 Windows 测试环境中测试您的更改。这包括撤销调整、以其他用户身份运行脚本以及在 Sysprep 模式下运行。
2. **记录更改**：更新 `README.md` 和其他相关文档。Wiki 文档将根据 `Features.json` 和 `Apps.json` 文件自动生成/更新。
3. **遵循现有模式**：参考现有实现作为指导。
4. **使用清晰的命名**：为功能、ID 和注册表文件选择描述性名称。
5. **最小化更改**：注册表文件应仅修改必要的内容。尽可能避免使用策略（policies）。
6. **为代码添加注释**：在 PowerShell 脚本中对复杂逻辑添加注释，说明您的思路。
7. **版本约束**：如果某个功能仅适用于特定 Windows 版本，请使用 `MinVersion` 和 `MaxVersion`。
8. **将拉取请求限制为 1 个功能**：每个拉取请求只包含一个功能，这样便于审查您的更改。

### 代码风格

- 在 PowerShell 脚本中使用 **4 个空格** 进行缩进。
- 在 JSON 文件中使用 **2 个空格** 进行缩进。
- 遵循现有命名约定。
- 保持行长度合理。
- 使用描述性变量名。
- 尽量将缩进级别限制在最多 4-5 层。
- 对图标使用 [Segoe Fluent Icon Assets](https://learn.microsoft.com/en-us/windows/apps/design/iconography/segoe-fluent-icons-font)。

### 常见陷阱

贡献时请避免以下常见错误：

1. **忘记更新 Get.ps1**：在添加新的命令行参数时，贡献者通常会记得更新 `Win11Debloat.ps1`，但忘记将相同参数添加到 `Scripts/Get.ps1`。两个文件**必须**具有匹配的参数。

2. **缺少注册表文件**：始终创建 `Undo` 注册表文件以实现可撤销性，同时也要创建 `Sysprep` 注册表文件，以便将更改应用到其他用户和 Sysprep 模式。

3. **Sysprep 中注册表配置单元（Registry Hives）不正确**：Sysprep 注册表文件旨在将更改应用到其他用户。`HKEY_CURRENT_USER` 配置单元中的注册表项必须使用 `hkey_users\default` 代替。请确保更新文件中的**所有**注册表项。

4. **注册表文件位置错误**：
   - 主要操作文件放在 `Regfiles/` 下。
   - 撤销文件放在 `Regfiles/Undo/` 下。
   - Sysprep 文件放在 `Regfiles/Sysprep/` 下。

   将文件放在错误目录可能导致脚本在应用或撤销更改时失败。

5. **未测试撤销功能**：始终测试您的撤销注册表文件能否正确还原所有更改。

6. **未测试用户/Sysprep 功能**：始终测试您的功能在应用到其他用户或通过 Sysprep 应用到 Windows 默认用户时是否正常工作。可以通过在运行脚本后创建新用户来测试 Sysprep 更改。

7. **缺少类别（Category）**：没有 `Category` 字段（设置为 `null`）的功能不会出现在 GUI 中。这是为仅命令行功能刻意设计的，提交前请确认这是您想要的。

8. **硬编码路径（Hardcoded Paths）**：在编写 PowerShell 逻辑时，请使用 `$PSScriptRoot` 和脚本变量，而不是硬编码路径。这样可以确保脚本无论安装在哪里都能正常工作。

## 实现新功能

### 添加对新应用的支持

> [!注意]
> 脚本会根据 Apps.json 中的应用信息自动生成 GUI 中的应用选项。

要通过 Win11Debloat 添加可移除的新应用：

1. **查找 AppId**：要查找应用的正确 AppId，请使用：

   ```powershell
   Get-AppxPackage | Select-Object Name, PackageFullName
   ```

2. **编辑 `Config/Apps.json`**：在 `"Apps"` 数组中添加新条目：

   ```json
   {
     "FriendlyName": "显示名称",
     "AppId": "应用包标识符",
     "Description": "应用的简要说明",
     "SelectedByDefault": true|false
   }
   ```

3. **遵循以下指南**：
   - 使用清晰、用户友好的名称作为 `FriendlyName`。
   - 仅当应用被广泛认为是“流氓软件（bloatware）”时，才将 `SelectedByDefault` 设为 `true`，否则设为 `false`。
   - 提供简洁的描述，说明该应用的用途。

### 添加新功能

功能在 `Config/Features.json` 中定义，并可通过注册表文件或 PowerShell 命令修改 Windows 设置。

> [!注意]
> 对于仅包含注册表更改的简单功能，除了添加相应的命令行参数外，主脚本中无需实际编码。GUI 会根据 Features.json 中的信息自动构建。

#### 1a. 创建注册表文件

在 `Regfiles/` 目录中创建新的注册表文件：

- **禁用文件**：`Disable_YourFeature.reg`
- **启用文件**：`Undo/Enable_YourFeature.reg`（用于撤销）
- **Sysprep 文件**：`Sysprep/Disable_YourFeature.reg`（用于 Sysprep 模式）

注册表文件结构示例：

```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\YourPath]
"SettingName"=dword:00000000
```

Sysprep 注册表文件应应用与常规操作相同的更改。将 `HKEY_CURRENT_USER` 开头的注册表项的配置单元替换为 `hkey_users\default`。例如：

```reg
Windows Registry Editor Version 5.00

[hkey_users\default\Software\Microsoft\Windows\CurrentVersion\YourPath]
"SettingName"=dword:00000000
```

#### 1b. 实现功能逻辑

如果您的功能不仅仅需要应用注册表文件，请在主脚本的相应部分添加自定义逻辑。多数情况下，这需要在 `Invoke-FeatureApply` 函数（位于 `Scripts/Features/InvokeChanges.ps1`）中为您的功能创建一个新条目。如果您的功能还需要自定义撤销逻辑（不仅仅是导入简单的注册表文件），请在同一文件的 `Invoke-FeatureUndo` 函数中添加对应条目。

#### 2. 将功能添加到 Features.json

在 `Config/Features.json` 的 `"Features"` 数组中添加您的功能：

```json
{
  "FeatureId": "YourFeatureId",
  "Label": "描述该功能的简短标签",
  "ToolTip": "该功能的作用及其影响的详细说明。",
  "Category": "Privacy & Suggested Content",
  "Priority": 1,
  "RegistryKey": "Disable_YourFeature.reg",
  "ApplyText": "正在禁用您的功能",
  "UndoLabel": "撤销操作的简短描述",
  "ApplyUndoText": "正在启用您的功能",
  "RegistryUndoKey": "Enable_YourFeature.reg",
  "RequiresReboot": false,
  "DisableWhenApplied": false,
  "MinVersion": null,
  "MaxVersion": null
}
```

**字段说明**：

- `FeatureId`：唯一标识符，必须与 Win11Debloat.ps1 和 Get.ps1 中的参数名称匹配。
- `Label`：在 UI 和 Wiki 文档中显示的简短描述。
- `ToolTip`：功能的详细解释，用于 GUI 中的工具提示。
- `Category`：预定义类别之一（参见 Features.json 中的 Categories 数组）。没有类别的功能不会被加载到 GUI 中。
- `Priority`：可选。优先级值（整数）用于在类别内对功能进行排序。如果省略此字段，则按 Features.json 中的顺序排序。
- `RegistryKey`：要应用的注册表文件的文件名（位于 Regfiles/ 目录中）。如果功能不需要注册表更改，则为 `null`。
- `ApplyText`：应用功能时显示的消息。
- `UndoLabel`：在 UI 中显示撤销操作的简短描述。
- `ApplyUndoText`：撤销功能时显示的消息。
- `RegistryUndoKey`：用于还原更改的注册表文件名，或 `null`（如果不需要）。
- `RequiresReboot`：可选布尔值。如果功能需要系统重启才能生效，则设为 `true`。
- `DisableWhenApplied`：可选布尔值。如果功能没有支持的撤销方法，则设为 `true`。
- `MinVersion`：最低 Windows 内部版本号（例如 "22000"）或 `null`。
- `MaxVersion`：最高 Windows 版本号或 `null`。

#### 3. 添加命令行参数

在 `Win11Debloat.ps1` **和** `Scripts/Get.ps1` 中添加相应的参数，参数名称应与您在 `Features.json` 中定义的 `FeatureId` 匹配。多数情况下这是一个开关参数（switch），示例如下：

```powershell
[switch]$YourFeatureId,
```

### 将功能添加到默认预设（Default Preset）

> [!重要]
> 默认预设（default preset）故意保持保守。添加到其中的功能应经过充分测试且具有广泛益处。如有疑问，请将功能排除在默认预设之外。

默认预设（`Config/DefaultSettings.json`）定义了当用户以“默认模式”或使用 `-RunDefaults` 参数运行 Win11Debloat 时自动应用的功能。该预设应包含被广泛认为可改善 Windows 体验且不会破坏功能的功能。

**何时将功能添加到默认预设：**

- 该功能可移除明显的流氓软件或干扰项。
- 该功能可在不破坏核心功能的情况下增强隐私。
- 该功能通常没有争议，对大多数用户有益。
- 如果需要，更改可以轻松撤销。

**何时不要将功能添加到默认预设：**

- 该功能显著改变核心 Windows 行为。
- 该功能可能会破坏某些用户的应用或工作流程。
- 该功能具有高度主观性或基于个人偏好。
- 该功能属于实验性质或未经过充分测试。

要将您的功能添加到默认预设，请编辑 `Config/DefaultSettings.json`，并在 `"Settings"` 数组中添加一个新条目：

```json
{
  "Name": "YourFeatureId",
  "Value": true
}
```

**字段说明**：

- `Name`：必须与 Features.json 中的 `FeatureId` 完全匹配。
- `Value`：设为 `true` 以在默认模式下启用该功能。

**示例**：

```json
{
  "Version": "1.0",
  "Settings": [
    {
      "Name": "CreateRestorePoint",
      "Value": true
    },
    {
      "Name": "DisableTelemetry",
      "Value": true
    },
    {
      "Name": "YourFeatureId",
      "Value": true
    }
  ]
}
```

### 添加类别（Category）

要为功能组织添加新类别：

- 在 `Config/Features.json` 的 `"Categories"` 数组中添加一个新类别条目：

  ```json
  {
    "Name": "您的类别名称",
    "Icon": "&#xE#### ;"
  }
  ```

> [!提示]
> 对于图标代码，请使用 [Segoe Fluent Icon Assets](https://learn.microsoft.com/en-us/windows/apps/design/iconography/segoe-fluent-icons-font)。

### 添加 UI 组（UI Groups）

UI 组允许在 GUI 中将功能组合在一起，并提供组合框（下拉）选择：

```json
{
  "GroupId": "UniqueGroupId",
  "Label": "组的显示标签",
  "ToolTip": "该组控制内容的说明",
  "Category": "Category Name",
  "Priority": 1,
  "Values": [
    {
      "Label": "选项 1",
      "FeatureIds": ["FeatureId1"]
    },
    {
      "Label": "选项 2",
      "FeatureIds": ["FeatureId2"]
    }
  ]
}
```

## 提交拉取请求（Pull Request）

1. **提交您的更改**，并附上清晰、描述性的提交信息：

   ```powershell
   git add .
   git commit -m "Add feature: 更改描述"
   ```

2. **推送到您的复刻**：

   ```powershell
   git push origin feature/your-feature-name
   ```

3. **在 GitHub 上创建拉取请求**：

   - 转到原始 Win11Debloat 仓库。
   - 点击“New Pull Request”。
   - 选择您的复刻和分支。
   - 提供清晰的更改描述，包括所涉及的注册表项引用。
   - 引用相关的问题（issues）。

4. **回应反馈**：根据代码审查反馈做好调整准备。

# 有问题？

如果您对贡献有任何疑问，请随时：

- 开启一个[讨论（discussion）](https://github.com/Raphire/Win11Debloat/discussions)
- 在已有问题中评论
- 在您的拉取请求中提问