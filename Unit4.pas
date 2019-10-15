unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    AlH: TEdit;
    Alm: TEdit;
    Als: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DelG: TEdit;
    Delm: TEdit;
    Dels: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
if form1.Mc.sys=2 then
 BEGIN
  label1.Caption:='Градуси';
 END;
if form1.Mc.sys=2 then
 BEGIN
  label1.Caption:='Години';
 END;
if (AlH.text<>'')or (DelG.text<>'')then
  begin
  if Alm.Text='' then Alm.Text:='0';
  if Als.Text='' then Als.Text:='0';
  if Delm.Text='' then Delm.Text:='0';
  if Dels.Text='' then Dels.Text:='0';
   Form1.data.A:=(strtoFloat(AlH.text)+strtoint(Alm.text)/60)
       +strtofloat(Als.text)/3600;
   if strtoFloat(DelG.text)>=0 then
   Form1.data.B:=(strtoFloat(DelG.text)+strtoint(Delm.text)/60)
       +strtofloat(Dels.text)/3600;
   if strtoFloat(DelG.text)<0 then
   Form1.data.B:=(strtoFloat(DelG.text)-strtoint(Delm.text)/60)
       -strtofloat(Dels.text)/3600;
   form1.Memoadd;
   form1.data.A:=form1.data.A*15;
    close;
  end else
  application.MessageBox('Не всі значення введено','Error!',mb_ok);
end;

end.
