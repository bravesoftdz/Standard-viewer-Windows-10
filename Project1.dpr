program Project1;

{$R Icon.res}

uses Windows, ShlObj, ShellAPI;

function GetSpecialPath(CSIDL: word): string;
var s: string;
begin
SetLength(s, MAX_PATH);
if not SHGetSpecialFolderPath(0, PChar(s), CSIDL, true)
then s := '';
result := PChar(s);
end;

begin
ShellExecute(0,'open','cmd.exe',Pchar('/c rundll32 "'+GetSpecialPath($26)+'\Windows Photo Viewer\PhotoViewer.dll",ImageView_Fullscreen '+ParamStr(1)),nil,SW_HIDE);
end.
