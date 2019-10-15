program Orientation;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Date},
  Unit3 in 'Unit3.pas' {Time},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Formviddal},
  Unit6 in 'Unit6.pas' {ObservationPoint},
  Unit7 in 'Unit7.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDate, Date);
  Application.CreateForm(TTime, Time);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormviddal, Formviddal);
  Application.CreateForm(TObservationPoint, ObservationPoint);
  Application.CreateForm(TAboutBox, AboutBox);
  //Application.CreateForm(TKartinka, Kartinka);
  Application.Run;
end.
