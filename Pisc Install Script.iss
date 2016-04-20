; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Public Interest Score Calculator"
#define MyAppVersion "0.0.1"
#define MyAppPublisher "George Stevenson"
#define MyAppExeName "pisc.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{4754F923-5B45-4496-A5A3-7E57D7FE5B46}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\PISC
DefaultGroupName={#MyAppName}
LicenseFile=C:\Users\George.DZB\Desktop\gpl-3.0.txt
InfoBeforeFile=C:\Users\George.DZB\Desktop\Install.txt
OutputBaseFilename=Setup PISC
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\George.DZB\Desktop\pisc.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\George.DZB\Desktop\gpl-3.0.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\George.DZB\Lazarus Projects\PISC\pisc.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\George.DZB\Lazarus Projects\PISC\pisc.res"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent
