unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormviddal = class(TForm)
    Vidstan: TEdit;
    label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formviddal: TFormviddal;

implementation

uses Unit1;

{$R *.dfm}

procedure TFormviddal.Button1Click(Sender: TObject);
begin
if vidstan.Text<>''then
 begin
 form1.data.R:=strtofloat(vidstan.Text);
 form1.memoadd;
 close;
 end else
 application.MessageBox('Не всі значення введено','Error!',mb_ok);
end;

end.
