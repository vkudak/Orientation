unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FileCtrl;

type
  TObservationPoint = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    FileListBox1: TFileListBox;
    Label5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObservationPoint: TObservationPoint;

implementation

uses Unit1;

{$R *.dfm}

procedure TObservationPoint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TObservationPoint.Button2Click(Sender: TObject);
begin
//GroupBox1.Visible:=true;
Button3.Visible:=true;
GroupBox1.Caption:='Новий пункт';
Edit1.ReadOnly:=false;
Edit2.ReadOnly:=false;
Edit3.ReadOnly:=false;
Edit4.ReadOnly:=false;
end;

procedure TObservationPoint.Button3Click(Sender: TObject);
begin
if (edit1.text<>'')or (edit2.text<>'')or(edit3.text<>'')or
  (edit4.text<>'') then
  begin
    Form1.conf.Name:=edit4.Text;
    Form1.conf.Lya:=strtofloat(edit1.Text);
    Form1.conf.Fi:=strtofloat(edit2.Text);
    Form1.conf.H:=strtofloat(edit3.Text);
    form1.conf.Sis:=1;
  assignFile(form1.conffile,edit4.Text+'.conf');
  rewrite(form1.conffile);
  write(form1.conffile,form1.conf);
  closeFile(form1.conffile);
  GroupBox1.Visible:=false;
  FileListbox1.Update;
  end else
  application.MessageBox('Не всі значення введено','Error!',mb_ok);
end;

procedure TObservationPoint.Button1Click(Sender: TObject);
var
s:string;
x:integer;
begin
s:=filelistBox1.FileName;
x:=pos(ExtractFilePath(filelistBox1.FileName),s);
delete(s,x,length(ExtractFilePath(filelistBox1.FileName)));
{s -> FileName}
  assignFile(form1.conffile,s);
  reset(form1.conffile);
  if not eof(form1.conffile)then
   Begin
   Read(form1.conffile,form1.conf);
   form1.Mc.Name:=form1.conf.Name;
   form1.Mc.Fi:=form1.conf.Fi;
   form1.Mc.Lya:=form1.conf.Lya;
   form1.Mc.H:=form1.conf.H;
   Form1.WriteMc;
   close;
   End
  else application.MessageBox('Файл пустий!','Error!',MB_ok);
  closeFile(form1.conffile);
end;

procedure TObservationPoint.FileListBox1Click(Sender: TObject);
var fName: string;
//    f:textfile;
begin
fName:=filelistBox1.FileName;
assignfile(form1.conffile,fName);
reset(form1.conffile);
if not eof(form1.conffile)then
   Begin
   Read(form1.conffile,form1.conf);
   Edit4.Text:=form1.conf.Name;
   Edit2.Text:=floattostr(form1.conf.Fi);
   Edit1.Text:=floattostr(form1.conf.Lya);
   edit3.Text:=floattostr(form1.conf.H);
   End;
closefile(form1.conffile);
end;

end.
