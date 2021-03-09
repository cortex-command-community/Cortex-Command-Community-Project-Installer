; Don't forget to bump version number
#define AppVersion "PreRelease 3.0"

#define AppName "Cortex Command Community Project"
#define AppPublisher "Cortex Command Community"
#define AppURL "https://github.com/cortex-command-community"
#define AppExeName32 "Cortex Command.exe"
#define AppExeName64 "Cortex Command x64.exe"

[Setup]
; The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
AppId={{23827A56-3E7B-4D9A-A23F-D9434970353A}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={sd}\Games\{#AppName}
DefaultGroupName={#AppName}
AllowNoIcons=yes
WizardStyle=modern
WizardImageFile=InstallerBanner.bmp
SetupIconFile=InstallerIcon.ico
Compression=lzma2/ultra64
SolidCompression=yes
OutputDir={#SourcePath}\_Output
OutputBaseFilename=Install CCCP {#AppVersion}

; LicenseFile={#SourcePath}\License.txt
; InfoBeforeFile={#SourcePath}\InfoPreInstall.txt
; InfoAfterFile={#SourcePath}\InfoPostInstall.txt

; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Components]
Name: data;                  Description: Install game data;                                         Types: full compact custom; Flags: fixed
Name: dependencies;          Description: Install dependencies;                                      Types: full;
Name: dependencies/vcredist; Description: Install Visual C++ Redistributable;                        Types: full compact;
Name: dependencies/vigembus; Description: Install ViGEm Bus Driver (DualShock 4 controller support); Types: full;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked;

[Files]    
; Source: "{#SourcePath}\License.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\Data\*";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Excludes: "Place all game data and binaries here,.gitignore,_ScreenShots,Base.rte\Settings.ini,Benchmark.rte,AbortScreen.bmp,LogConsole.txt,LogLoading.txt,LogLoadingWarning.txt,MemCleanupInfo.txt,allegro.log";

Source: "{#SourcePath}\Dependencies\VC_redist.x86.exe";           DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: dependencies/vcredist;
Source: "{#SourcePath}\Dependencies\VC_redist.x64.exe";           DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: dependencies/vcredist;
Source: "{#SourcePath}\Dependencies\ViGEmBus_Setup_1.16.116.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall; Components: dependencies/vigembus;

[Icons]
Name: "{group}\Launch Cortex Command";       Filename: "{app}\{#AppExeName32}";
Name: "{group}\Launch Cortex Command (x64)"; Filename: "{app}\{#AppExeName64}";
Name: "{group}\Uninstall Cortex Command";    FileName: "{uninstallexe}";
Name: "{autodesktop}\Cortex Command";        Filename: "{app}\{#AppExeName32}";  Tasks: desktopicon;

[Run]
Filename: "{tmp}\VC_redist.x86.exe";           Components: dependencies/vcredist;
Filename: "{tmp}\VC_redist.x64.exe";           Components: dependencies/vcredist;
Filename: "{tmp}\ViGEmBus_Setup_1.16.116.exe"; Components: dependencies/vigembus;

Filename: "{app}\{#AppExeName32}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: unchecked nowait postinstall;