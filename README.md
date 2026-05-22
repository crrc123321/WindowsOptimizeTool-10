# 本人测试环境
本人在Windows 10 1903到Windows 10 22H2测试可用

# 这个工具是做什么的？
这是一款Windows优化工具，分为Windows 10和Windows 11两个版本，专版专用，这是适用于Windows 10的版本，不建议混用，否则可能会出现未知问题

# 在点下按钮的时候，它都会干什么？
**休眠设置**

如果你点了“开启”，它会执行powercfg -h on来打开休眠功能

如果你点了“关闭”，它会执行powercfg -h off来关闭休眠功能

**保留的存储**

如果你点了“开启”，它会执行DISM.exe /Online /Set-ReservedStorageState /State:Disabled来打开保留的存储，这样做会让Windows更新变得很快，但代价是C盘空间占用会多出至少5G

如果你点了“关闭”，它会执行DISM.exe /Online /Set-ReservedStorageState /State:Disabled来关闭保留的存储，这样做会让C盘空间腾出至少5G，但Windows更新会变慢很多

**停用 Windows 更新10年**

原理是在注册表的HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings内添加了FlightSettingsMaxPauseDays的DWORD值，并设置为3650(365 x 10=3650)来加长Windows暂停更新时长上限，随即弹出帮助提示框并跳转到Windows设置来辅助调整

效果如下

<img width="811" height="150" alt="image" src="https://github.com/user-attachments/assets/431b2369-da21-4dc1-a8da-7b74a3d65338" />

**卸载 OneDrive**

原理是先杀死OneDrive进程，并调用系统盘内的OneDrive安装包执行卸载命令，具体命令是taskkill /f /im OneDrive.exe && %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

随后会尝试删除系统盘内的OneDrive安装包，因为能省出300M左右的C盘空间，但建议配合NSudo，否则会遇到权限问题

**修改不合理的组策略**

干死了遥测、Windows Search和WMP网络播放插件，并将状态设置为“已禁用”

**禁用不合理的计划任务**

目前干死的东西：

1.微软系统诊断与错误上报

2.SkyDrive/OneDrive 残留同步任务

3.谷歌与 Adobe 第三方更新工具

4.Office 遥测与订阅检查

**优化注册表**

参考**Optimize-10.bat**中的优化项

**清理无用 Appx**

删除列表："BingSearch", "GetHelp", "Getstarted", "Microsoft3DViewer", "MicrosoftOfficeHub","MixedReality.Portal", "Office.OneNote", "OutlookForWindows", "People", "SkypeApp","Wallet", "DevHome", "windowscommunicationsapps", "WindowsFeedbackHub", "WindowsMaps","Xbox.TCUI", "XboxApp", "XboxGameOverlay", "XboxGamingOverlay", "XboxSpeechToTextOverlay", "YourPhone"

**移除无用功能**

删除的功能：IE、Windows Defender默认定义库、工作文件夹客户端、XPS服务、PowerShell 2.0、步骤记录器、QuickAssist、数学识别器

**添加.NET 3.5**

顾名思义，使用在线方式添加，具体命令是dism /online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart

**停用Windows Defender**

原理是通过组策略来配置，但尽可能配合NSudo执行，否则很可能会无权限

**主页的bat是干什么的？**

那个是个人在重装系统以后自用的清理+优化脚本，本GUI也是基于该脚本编写而成，如果想直接运行所有优化项，直接管理员权限运行Optimize-10.bat即可


# 其他说明

1.该版本为**第一版**，后续可能会根据时间和个人情况慢慢迭代和更新，可能会加入(操作前)创建还原点等功能

2.该版本大多数功能和优化不适用于Windows 11，后期会考虑出Windows 11专版
