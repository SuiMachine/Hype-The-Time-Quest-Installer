;  Hype - The Time Quest Alternate Installer V0.0.5
;  Created 2014 Suicide Machine.
;  Based on a code of Triangle717's Lego Racer Alternative Installer.
;  <http://triangle717.wordpress.com/>
;  Contains source code from Grim Fandango Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  <http://quick.mixnmojo.com/>

; If any version below the specified version is used for compiling, 
; this error will be shown.
#if VER < EncodeVer(5,5,2)
  #error You must use Inno Setup 5.5.2 or newer to compile this script
#endif

#define MyAppInstallerName "Hype: The Time Quest - Alternate Installer"
#define MyAppInstallerVersion "1.0.0"
#define MyAppName "Hype - The Time Quest"
#define MyAppNameNoR "Hype - The Time Quest"
#define MyAppVersion "1.0.0.0"
#define MyAppPublisher "Ubisoft"
#define MyAppExeName "MaiDFXvr_bleu.exe"

[Setup]
AppID={#MyAppInstallerName}{#MyAppInstallerVersion}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyAppInstallerVersion}
AppPublisher={#MyAppPublisher}
AppCopyright=© 1999 {#MyAppPublisher}
LicenseFile=license.txt
; Start menu/screen and Desktop shortcuts
DefaultDirName={sd}\Games\{#MyAppNameNoR}
DefaultGroupName=Ubisoft\{#MyAppNameNoR}
AllowNoIcons=yes
; Installer Graphics
SetupIconFile=Hype.ico
WizardImageFile=Sidebar.bmp
WizardSmallImageFile=Small-Image.bmp
WizardImageStretch=True
WizardImageBackColor=clBlack
; Location of the compiled Exe
OutputDir=bin
OutputBaseFilename={#MyAppNameNoR} Alternate Installer {#MyAppInstallerVersion}
; Uninstallation stuff
UninstallFilesDir={app}
UninstallDisplayIcon={app}\Hype.ico
CreateUninstallRegKey=yes
UninstallDisplayName={#MyAppName}
; This is required so Inno can correctly report the installation size.
UninstallDisplaySize=440947180
; Compression
Compression=lzma2/ultra64
SolidCompression=True
InternalCompressLevel=ultra
LZMAUseSeparateProcess=yes
; From top to bottom:
; Explicitly set Admin rights, no other languages, do not restart upon finish.
PrivilegesRequired=admin
ShowLanguageDialog=yes
ShowUndisplayableLanguages=yes
RestartIfNeededByRun=no

[Languages]
Name: "English"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel={#MyAppInstallerName} {#MyAppInstallerVersion}
; WelcomeLabel2=This will install [name] on your computer.%n%nIt is recommended that you close all other applications before continuing.
; DiskSpaceMBLabel is overridden because it reports an incorrect installation size.
English.DiskSpaceMBLabel=At least 425 MB of free disk space is required.

[Types]
Name: "Full"; Description: "Full Installation"; Flags: iscustom  

[Components]
Name: "base"; Description: "Game assets (required)"; Types: Full; Flags: fixed; ExtraDiskSpaceRequired: 443547648 
Name: "language"; Description: "Language files"; Types: Full;  Flags: fixed
Name: "language\english"; Description: "English"; Types: Full; Flags: exclusive
Name: "language\french"; Description: "French (not tested!)"; Flags: exclusive
Name: "language\german"; Description: "German"; Flags: exclusive
Name: "language\polish"; Description: "Polish"; Flags: exclusive

[Files]
; Root folder
Source: "{code:GetSourceDrive}DSETUP.DLL"; DestDir: "{app}"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}DSETUP16.DLL"; DestDir: "{app}"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}DSETUP32.DLL"; DestDir: "{app}"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}Hype.ico"; DestDir: "{app}"; Flags: external ignoreversion

; Game folders
Source: "{code:GetSourceDrive}DLL\*"; DestDir: "{app}\DLL\"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}Gamedata\*"; DestDir: "{app}\Gamedata\"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}Gamedata\World\Levels\*"; DestDir: "{app}\Gamedata\World\Levels"; Flags: external ignoreversion recursesubdirs
Source: "{code:GetSourceDrive}Gamedata\World\Sound\*"; DestDir: "{app}\Gamedata\World\Sound"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}InstData\*"; DestDir: "{app}\InstData\"; Flags: external ignoreversion

; Localization - English
Source: "{code:GetSourceDrive}Gamedata\World\Sound\English\*"; DestDir: "{app}\Gamedata\World\Sound"; Flags: external ignoreversion recursesubdirs; Components: language\english 
Source: "{code:GetSourceDrive}LangData\English\world\levels\*"; DestDir: "{app}\Gamedata\World\levels\"; Flags: external ignoreversion recursesubdirs; Components: language\english
; Localization - French (not tested)
Source: "{code:GetSourceDrive}Gamedata\World\Sound\French\*"; DestDir: "{app}\Gamedata\World\Sound"; Flags: external ignoreversion recursesubdirs; Components: language\french 
Source: "{code:GetSourceDrive}LangData\French\world\levels\*"; DestDir: "{app}\Gamedata\World\levels\"; Flags: external ignoreversion recursesubdirs; Components: language\french
; Localization - German
Source: "{code:GetSourceDrive}Gamedata\World\Sound\German\*"; DestDir: "{app}\Gamedata\World\Sound"; Flags: external ignoreversion recursesubdirs; Components: language\german 
Source: "{code:GetSourceDrive}LangData\German\world\levels\*"; DestDir: "{app}\Gamedata\World\levels\"; Flags: external ignoreversion recursesubdirs; Components: language\german
; Localization - Polish
Source: "{code:GetSourceDrive}Gamedata\World\Sound\Polish\*"; DestDir: "{app}\Gamedata\World\Sound"; Flags: external ignoreversion recursesubdirs; Components: language\polish 
Source: "{code:GetSourceDrive}LangData\Polish\world\levels\*"; DestDir: "{app}\Gamedata\World\levels\"; Flags: external ignoreversion recursesubdirs; Components: language\polish

; EXE folder
Source: "{code:GetSourceDrive}EXE\GLI.ini"; DestDir: "{app}"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}EXE\D3D\MaiD3Dvr_bleu.exe"; DestDir: "{app}"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}EXE\Glide 3x\MaiDFXvr_bleu.exe"; DestDir: "{app}"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}EXE\UbiConfig\*"; DestDir: "{app}"; Flags: external ignoreversion

; Ubisoft files to Windows directory
Source: "{code:GetSourceDrive}DSETUP.DLL"; DestDir: "{win}\UbiSoft"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}DSETUP16.DLL"; DestDir: "{win}\UbiSoft"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}DSETUP32.DLL"; DestDir: "{win}\UbiSoft"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}SetupUbi.exe"; DestDir: "{win}\UbiSoft"; Flags: external ignoreversion
Source: "{code:GetSourceDrive}InstData\strings.eng"; DestDir: "{win}\UbiSoft"; Flags: external ignoreversion
 
; Install stuff
Source: "Stuff\Comp\*"; DestDir: "{app}\Comp\";
Source: "Stuff\Config\ubi.ini"; DestDir: "{win}\UbiSoft"; Flags: ignoreversion uninsneveruninstall
Source: "Stuff\nGlide103_setup.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\Hype.ico";Comment: "Hype - The Time Quest (3dfx - recommended)";
Name: "{group}\Hype - The Time Quest (D3D)"; Filename: "{app}\MaiD3Dvr_bleu.exe"; IconFilename: "{app}\Hype.ico"; Comment: "Hype - The Time Quest (D3D mode)";
Name: "{group}\Configure the game"; Filename: "{app}\Ubiassistant.exe"; IconFilename: "{app}\Hype.ico"; Comment: "Configure the game";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\Hype.ico";
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\Hype.ico"; Comment: "Hype - The Time Quest"; Tasks: desktopicon
; Websites
Name: "{group}\Websites\PCGamingWiki"; Filename: "http://pcgamingwiki.com/wiki/Hype:_The_Time_Quest"
Name: "{group}\Websites\Hype Forever"; Filename: "http://hypeforever.webs.com/"


[Tasks]
; Create a desktop icon, run with administrator rights
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}";
Name: "nglide"; Description: "{cm:InstallnGlide}";

[INI]
Filename: "{win}\UbiSoft\ubi.ini"; Section: "Hype - The Time Quest"; Key: "Directory"; String: "{app}";
; Changing language in ubi.ini (English not required, as it's there by default
Filename: "{win}\UbiSoft\ubi.ini"; Section: "Hype - The Time Quest"; Key: "Language"; String: "French"; Components: language\french
Filename: "{win}\UbiSoft\ubi.ini"; Section: "Hype - The Time Quest"; Key: "Language"; String: "German"; Components: language\german 
Filename: "{win}\UbiSoft\ubi.ini"; Section: "Hype - The Time Quest"; Key: "Language"; String: "Polish"; Components: language\polish

[Run]
Filename: "{app}\Comp\PatchInstall.bat"; StatusMsg: "{cm:StatusInstallingCompatibilityFixes}"; Flags: runascurrentuser
Filename: "{app}\nGlide103_setup.exe"; StatusMsg: "{cm:StatusInstallingnGlide}"; Flags: runascurrentuser; Tasks: nglide


[UninstallDelete]
Type: files; Name: "{app}\{#MyAppExeName}"

[Dirs]
; Created to ensure the save games are not removed (which should never ever happen).
Name: "{app}\Gamedata\SaveGame"; Flags: uninsneveruninstall

[Code]
// Pascal script from Bgbennyboy to pull files off a CD, greatly trimmed up 
// and modified to support ANSI and Unicode Inno Setup by Triangle717.
var
	SourceDrive: string;

#include "FindDisc.iss"

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

procedure InitializeWizard();
begin
	SourceDrive:=GetSourceCdDrive();
end;

//Display warning
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = wpSelectTasks then
  begin
      MsgBox('!!! WARNING !!!'+ #13#10 +
      'This installer replaces ubi.ini in C:\Windows\UbiSoft' + #13#10 +
      'If you have other games that use Ubisoft install system (e.g. Rayman 2)' + #13#10 +
      'make sure to back up your ubi.ini file, before continuing.', mbInformation, MB_OK)
  end;
end;
