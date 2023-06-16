# Cortex Command Community Project Installer

An [Inno Setup 6](https://jrsoftware.org/isinfo.php) project file for compiling CCCP release build installers (Windows only).

## Build Instructions:

1. Place all game data and binaries into the `Data` folder.  
	- Only the relevant files/folders will be copied so it's not necessary to clean up any folders, logs or binaries manually.

2. Open `CCInstall.iss` using **Inno Setup 6**.

3. Update `AppVersion` (line 2) if necessary.

4. Compile the installer (Ctrl+F9).
	- The compiled installer will be found in the `_Output` folder.