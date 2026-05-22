@echo off
echo -------------------------------
echo 清除自动安装留下的屎
rmdir /Q /S C:\$WINDOWS.~BT
rmdir /Q /S C:\$WINDOWS.~LS
rmdir /Q /S C:\Windows\Setup
rmdir /Q /S C:\Windows\Panther
del /f /s /q C:\Windows\Temp\*
del /f /s /q %LOCALAPPDATA%\Temp\*
del /f /s /q C:\Windows\SoftwareDistribution\Download\*
pause

echo -------------------------------
echo 卸载万年用不到的sb OneDrive
taskkill /f /im OneDrive.exe && %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
pause

echo -------------------------------
echo 去你奶奶的Windows更新，10年后见吧
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "FlightSettingsMaxPauseDays" /t REG_DWORD /d 3650 /f
start ms-settings:windowsupdate
pause

echo -------------------------------
echo 我又不更新，要你jb保留存储有毛用？
DISM.exe /Online /Set-ReservedStorageState /State:Disabled

echo -------------------------------
echo 休眠也上西天吧
powercfg /h off
pause

echo -------------------------------
echo 干死不合理的组策略
sc stop WMPNetworkSvc
sc stop wsearch
sc stop DiagTrack
sc stop WinDefend
sc stop WerSvc
sc config WMPNetworkSvc start= disabled
sc config wsearch start= disabled
sc config DiagTrack start= disabled
sc config WinDefend start= disabled
sc config WerSvc start= disabled
pause

echo -------------------------------
echo 尝试清理掉某些sb计划任务
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\SkyDrive\Routine Maintenance Task"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineUA"
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineCore"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat"
pause

echo -------------------------------
echo 注册表优化
echo -------------------------------
echo sb推广，给爷西内
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t REG_DWORD /d 0 /f
echo 再见，小娜
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo 停用WD和SmartScreen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
echo 不要发送错误报告
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /d 1 /t REG_dword /f
echo 禁用“客户体验改善计划”
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
echo 给老子马上关机
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 2000 /t REG_SZ /f
echo 资源管理器
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t REG_SZ /d "%systemroot%\system32\imageres.dll,197" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 2 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 4 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCDBurning" /t REG_DWORD /d 1 /f
echo 去你大爷的Game Bar
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
echo 自动打开小键盘
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
echo 此电脑和控制面板呢？给我出来
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399e694-6ce5-4d6c-8fce-1d8870fdcba0}" /d 0 /t REG_DWORD /f
echo 移除右键菜单
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.png\Shell\3D Edit" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\PintoQuickaccess" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Microsoft.Compute.System.ProjectedFileSystem" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\SPFS.ContextMenu" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\MobileDoc" /f >nul 2>&1
echo 改变右键菜单显示逻辑
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 1 /f
reg delete "HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Library Location" /f >nul 2>&1
echo 砍掉没毛用+没人用的家庭组
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /d 1 /t REG_DWORD /f
echo 别乱发错误报告
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /d 0 /t REG_DWORD /f
echo 禁用远程桌面
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /d 1 /t REG_dword /f
echo 蓝屏行为调整
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "LogEvent" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /d 0 /t REG_dword /f
echo 停用系统更新和组件维护日志
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\DeltaPackageExpander" /v "EnableLog" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableBackup" /t REG_DWORD /d 0 /f
echo 不要乱收集我的诊断数据
logman stop WdiContextLog -ets >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d 0 /f
pause

echo -------------------------------
echo 去你大爷的无用Appx
setlocal enabledelayedexpansion
set "targets=BingSearch GetHelp Getstarted Microsoft3DViewer MicrosoftOfficeHub MixedReality.Portal Office.OneNote OutlookForWindows People SkypeApp Wallet DevHome windowscommunicationsapps WindowsFeedbackHub WindowsMaps Xbox.TCUI XboxApp XboxGameOverlay XboxGamingOverlay XboxSpeechToTextOverlay YourPhone"
for %%i in (%targets%) do (
    echo [目标模块]: %%i
    powershell -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like '*%%i*'} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue"
    powershell -Command "Get-AppxPackage -AllUsers -Name '*%%i*' | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue"
    echo [完成]: %%i 处理完毕。
)
pause

echo -------------------------------
echo 滚你丫的没用的功能
dism /online /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64 /NoRestart
dism /online /Disable-Feature /FeatureName:Windows-Defender-Default-Definitions /NoRestart
dism /online /Disable-Feature /FeatureName:WorkFolders-Client /NoRestart
dism /online /Disable-Feature /FeatureName:Printing-XPSServices-Features /NoRestart
dism /online /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2Root /NoRestart
dism /online /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2 /NoRestart
dism /online /Remove-Capability /CapabilityName:App.StepsRecorder~~~~0.0.1.0
dism /online /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0
dism /online /Remove-Capability /CapabilityName:MathRecognizer~~~~0.0.1.0
pause

echo -------------------------------
echo 给爷把.NET 3.5补上
dism /online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart
pause

echo -------------------------------
echo 让OneDrive安装包滚出系统盘
del /f /s /q %SystemRoot%\SysWOW64\OneDriveSetup.exe

gpupdate /force
shutdown -r -t 10