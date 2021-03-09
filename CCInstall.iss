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
