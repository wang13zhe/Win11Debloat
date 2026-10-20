# 参与贡献

这个仓库是 [Raphire/Win11Debloat](https://github.com/Raphire/Win11Debloat) 的多语言分支。
欢迎提交翻译修正、新语言和改进，但请注意分工：

- **功能问题、脚本逻辑、上游未合并的改动** → 请提到[上游仓库](https://github.com/Raphire/Win11Debloat/issues)
- **翻译错误、界面语言不对、本分支特有的问题** → 请提到[本仓库 Issues](https://github.com/wang13zhe/Win11Debloat/issues)

## 报告问题时请附上

- Windows 版本（`winver`）
- 使用的界面语言（`☰` → 语言，或启动参数 `-Language`）
- `Logs\Win11Debloat.log` 里的相关片段
- 截图（涉及界面文字时特别有用）

## 修正翻译

界面文字全部在 `Config/Languages/<语言代码>/` 下，共四个文件：

| 文件 | 内容 |
| --- | --- |
| `Chrome.json` | 窗口、菜单、对话框等固定文案（扁平 key → 字符串） |
| `Features.json` | 功能项与下拉选项的标题、悬停提示、执行/撤销文案 |
| `Categories.json` | 功能分类名称 |
| `Apps.json` | 应用名称与说明（以 AppId 为键） |

规则：

1. **只改值，不改键**，键的顺序和数量必须与 `Config/Languages/en-US/` 完全一致
2. 占位符 `{0}`、`{1}` 原样保留，数量与位置对应
3. 语言代码用 .NET 区域性名称（如 `de-DE`、`zh-TW`），文件夹名即为匹配依据
4. 改完自检一次：

```powershell
.\Win11Debloat.ps1 -Language de-DE
```

启动后逐个点开标签页、对话框和悬停提示，确认没有漏译、没有截断。

## 新增一种语言

1. 复制 `Config/Languages/en-US/` 为 `Config/Languages/<语言代码>/`
2. 翻译四个文件（缺条目会自动回退英文，可以分批提交）
3. 跑一遍 `Test-LanguageKeyCoverage -LanguageCode '<语言代码>'`，确认缺失/多余键为 0
4. 用 `-Language <语言代码>` 启动，走一遍全部界面
5. 提 PR 时**一种语言一个 PR**（上游也是这个规矩）

## 代码改动

- 提交前请确保 `Scripts/Run-Tests.ps1` 通过（需要 Pester 5）
- 涉及界面文字的代码不要硬编码字符串，统一走 `%LANG:Key%` 标记或 `Get-Translation`
- 只动必要的地方，功能层的改动尽量保持和上游一致，方便后续合并
