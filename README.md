# Cortex Command Community Project Installer

An [Inno Setup 6](https://jrsoftware.org/isinfo.php) project file for compiling CCCP release build installers (Windows only).

## Build Instructions:

1. Place all game data and binaries into the `Data` folder.
	- Make sure `MetaGames.rte` does not contain any saved games!
	- Make sure `Scenes.rte` does not contain any user Scenes!
	- The following files/folders will be ignored so it's not necessary to omit them manually:  
	`.gitignore`, `_ScreenShots`, `Base.rte\Settings.ini`, `Benchmark.rte`, `AbortScreen.bmp`, `LogConsole.txt`, `LogLoading.txt`, `LogLoadingWarning.txt`, `MemCleanupInfo.txt`, `allegro.log`
	
2. Open `CCInstall.iss` using **Inno Setup 6**.

3. Update `AppVersion` (line 2) if necessary.

4. Compile the installer (Ctrl+F9).
	- The compiled installer will be found in the `_Output` folder.