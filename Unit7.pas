unit Unit7;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses Unit1;

{$R *.dfm}
function GetFileVersion(FileName: string; var Major, Minor, Release, Build: Word): Boolean;
var Size, Size2: DWord;
    Pt, Pt2: Pointer;
begin
    Result:= False;
    (*** Get version information size in exe ***)
    Size:= GetFileVersionInfoSize(PChar(FileName),Size2);
    (*** Make sure that version information are included in exe file ***)
    if Size > 0 then begin
        GetMem(Pt, Size);
        GetFileVersionInfo(PChar(FileName), 0, Size, Pt);
        VerQueryValue(Pt, '\', Pt2, Size2);
        with TVSFixedFileInfo(Pt2^) do begin
            Major:= HiWord(dwFileVersionMS);
            Minor:= LoWord(dwFileVersionMS);
            Release:= HiWord(dwFileVersionLS);
            Build:= LoWord(dwFileVersionLS);
            end;
        FreeMem(Pt, Size);
        Result:= True;
        end;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
close;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
var N,Ext:string;
    Major, Minor, Release, Build:word;
begin
GetFileVersion(Application.ExeName,Major, Minor, Release, Build);
version.Caption:=version.Caption+
  Format('%d.%d.%d.%d',[Major, Minor, Release, Build]);
Ext:=extractFileExt(Application.ExeName);
N:=extractFileName(Application.ExeName);
delete(N,pos(ext,N),length(ext));
  productname.Caption:=productname.Caption+N;

end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
 
