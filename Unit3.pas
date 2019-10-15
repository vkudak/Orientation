unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TTime = class(TForm)
    Label1: TLabel;
    hours: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    minuts: TEdit;
    seconds: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Time: TTime;

implementation

uses Unit1;

{$R *.dfm}

procedure TTime.Button1Click(Sender: TObject);
begin
if (hours.text<>'')then
  begin
  if minuts.Text='' then minuts.Text:='0';
  if seconds.Text='' then seconds.Text:='0';
   Form1.data.UT:=(strtoFloat(Hours.text)+strtoint(minuts.text)/60)
       +strtofloat(seconds.text)/3600;
   form1.Memoadd;
    close;
  end else
  application.MessageBox('Деякі значення не введено','Error!',mb_ok);
end;

end.
