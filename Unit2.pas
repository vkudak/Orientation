unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDate = class(TForm)
    Nomer: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    day: TEdit;
    Label3: TLabel;
    month: TEdit;
    Year: TEdit;
    Label4: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Date: TDate;

implementation

uses Unit1;

{$R *.dfm}

procedure TDate.Button1Click(Sender: TObject);
begin
if (nomer.text<>'')or (day.text<>'')or(month.text<>'')or
  (year.text<>'') then
  begin
    Form1.data.Name:=nomer.Text;
    Form1.data.dd:=strtoint(day.Text);
    Form1.data.mm:=strtoint(month.Text);
    Form1.data.yy:=strtoint(Year.Text);
    form1.Memoadd;
    close;
  end else
  application.MessageBox('Не всі значення введено','Error!',mb_ok);
end;

procedure TDate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
