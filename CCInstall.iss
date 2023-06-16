;Don't forget to bump version number
#define AppVersion "PreRelease 5.0"

#define AppName "Cortex Command Community Project"
#define AppPublisher "Cortex Command Community"
#define AppURL "https://cortex-command-community.github.io"
#define AppExeName "Cortex Command.exe"

;////////////////////////////////////////////////

[Setup]
;The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
AppId = {{23827A56-3E7B-4D9A-A23F-D9434970353A}
AppName = {#AppName}
AppVersion = {#AppVersion}
AppPublisher = {#AppPublisher}
AppPublisherURL = {#AppURL}
AppSupportURL = {#AppURL}
AppUpdatesURL = {#AppURL}
DefaultDirName = {sd}\Games\{#AppName}
DefaultGroupName = {#AppName}
AllowNoIcons = yes
WizardStyle = modern
WizardImageFile = InstallerBanner.bmp
SetupIconFile = InstallerIcon.ico
Compression = lzma2/ultra64
SolidCompression = yes
OutputDir = {#SourcePath}\_Output
OutputBaseFilename = Install CCCP {#AppVersion}

;LicenseFile={#SourcePath}\License.txt
InfoBeforeFile = {#SourcePath}\InfoPreInstall.txt
InfoAfterFile = {#SourcePath}\InfoPostInstall.txt

;Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired = lowest
PrivilegesRequiredOverridesAllowed = commandline

;////////////////////////////////////////////////////////////////////////////////////////////////

[Languages]
Name: "english"; \
MessagesFile: "compiler:Default.isl"

;////////////////////////////////////////////////////////////////////////////////////////////////

[Components]
Name: data;							\
Description: Install game data;		\
Types: full compact custom;			\
Flags: fixed

Name: dependencies;					\
Description: Install dependencies;	\
Types: full;

Name: dependencies/vcredist;							\
Description: Install Visual C++ 2022 Redistributable;	\
Types: full compact;

;////////////////////////////////////////////////////////////////////////////////////////////////

[Tasks]
Name: "desktopicon";						\
Description: "{cm:CreateDesktopIcon}";		\
GroupDescription: "{cm:AdditionalIcons}";	\
Flags: unchecked;

;////////////////////////////////////////////////////////////////////////////////////////////////

[Files]
;Source: "{#SourcePath}\License.txt";	\
;DestDir: "{app}"; Flags: ignoreversion

Source: "{#SourcePath}\Data\*";							\
DestDir: "{app}";										\
Flags: ignoreversion recursesubdirs createallsubdirs;	\
Excludes: 	"Place all game data and binaries here,		\
			ScreenShots,								\
			Userdata,									\
			Mods,										\
			AbortScreen.bmp,							\
			.*,											\
			*.exe,										\
			*.bat,										\
			*.dll,										\
			*.md,										\
			*.txt,										\
			*.log";

Source: "{#SourcePath}\Data\Cortex Command.exe";	\
DestDir: "{app}";									\
Flags: ignoreversion;

Source: "{#SourcePath}\Data\Data\Base.rte\gamecontrollerdb.txt";	\
DestDir: "{app}\Data\Base.rte";										\
Flags: ignoreversion;

Source: "{#SourcePath}\Data\SDL2.dll";		\
DestDir: "{app}";							\
Flags: ignoreversion;

Source: "{#SourcePath}\Data\fmod.dll";	\
DestDir: "{app}";						\
Flags: ignoreversion;

Source: "{#SourcePath}\Dependencies\VC_redist.x64.exe";		\
DestDir: "{tmp}";											\
Flags: ignoreversion deleteafterinstall;					\
Components: dependencies/vcredist;

;////////////////////////////////////////////////////////////////////////////////////////////////

[Icons]
Name: "{group}\Launch Cortex Command";	\
Filename: "{app}\{#AppExeName}";

Name: "{group}\Uninstall Cortex Command";	\
FileName: "{uninstallexe}";

Name: "{autodesktop}\Cortex Command";	\
Filename: "{app}\{#AppExeName}";		\
Tasks: desktopicon;

;////////////////////////////////////////////////////////////////////////////////////////////////

[Run]
Filename: "{tmp}\VC_redist.x64.exe";	\
Components: dependencies/vcredist;

Filename: "{app}\{#AppExeName}";										\
Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}";	\
Flags: unchecked nowait postinstall;