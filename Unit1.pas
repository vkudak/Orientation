unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, Menus, Grids,OrU,math;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    XPManifest1: TXPManifest;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    N5: TMenuItem;
    N6: TMenuItem;
    Label4: TLabel;
    N8: TMenuItem;
    SG1: TStringGrid;
    Button6: TButton;
    N9: TMenuItem;
    OpenDialog1: TOpenDialog;
    N7: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Button7: TButton;
    N13: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure memoadd;
    procedure memo2add;
    procedure SaveInFile;
//    procedure SavedataHor;
    procedure SaveData;
    Procedure WriteMc;
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
  public
  data:MyFile;
  conf:MyConf;
  conffile:file of Myconf;
  Mc:MainConf;
  Mcf:file of MainConf;
  Fi,Lya:extended;
  Agor,Bgor,Az,H,Azn,Hn,Azg,Hg,Azo,Ho:extended;
  Adata:array[1..300]of MyFile;
  i,k:integer;
  ind,ind2,ind3,ind4,ind5,ind6,ind7,ind8,ind9,ind10,ind11,
  ind12,ind13,ind14,ind15,ind16,ind17,ind18,ind19,ind20,
  ind22,ind23,ind24,ind25,ind26,ind27,ind28:integer;
  end;

var
  Form1: TForm1;
implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7;

{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
Form1.N4Click(nil);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
date.showModal;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
time.showmodal;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
form4.showModal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Formviddal.showmodal;
end;
///////////////////
///////////////////// savedataHor
Procedure TForm1.SaveData;
var f3:textfile;
    j:integer;
    s:string;
begin
 if not DirectoryExists(extractFilePath(application.ExeName)+
       'data\'+Adata[1].Name) then
    if not CreateDir(extractFilePath(application.ExeName)+
        'data\'+Adata[1].Name) then
    raise Exception.Create('Неможливо створити папку');
S:=extractFilePath(application.ExeName)+'data\'+
              Adata[1].Name+'\'+Adata[1].Name+'.dat';
 AssignFile(f3,s);
 rewrite(f3);
  for j:=1 to i-1 do
  begin
   writeln(f3,Adata[j].Name:10,Adata[j].dd:3,Adata[j].mm:3,
    Adata[j].yy:5,Adata[j].UT:10:4,
    Adata[j].A:10:4,Adata[j].B:10:4,Adata[j].Agor:10:4,Adata[j].Bgor:10:4,
    Adata[j].An:10:4,Adata[j].Bn:10:4,Adata[j].Ag:10:4,Adata[j].Bg:10:4,
    Adata[j].Ao:10:4,Adata[j].Bo:10:4,Adata[j].Al:10:4,Adata[j].Bl:10:4,
    Adata[j].F:10:4,Adata[j].V:10:4,Adata[j].E1:10:4,Adata[j].Q1:10:4,
    Adata[j].E2:10:4,Adata[j].Q2:10:4,Adata[j].Fyn:10:4,Adata[j].R:11:4);
  end;
 CloseFile(f3);
end;
//////////////////////
procedure TForm1.SaveInFile;
Label 1,2;
Type
Ekv =record
A,B,Ao,Bo:double;
end;
var f:textfile;
    j:integer;
    s:string;
    Ta,Tb,V1a,V1b,V2a,V2b:extended;
    Ta2: Extended;
    V:array[1..100]of Ekv;
    vv:ekv;
begin
ind:=1;ind2:=1;ind3:=1;ind4:=1;ind5:=1;ind6:=1;ind7:=1;
ind8:=1;ind9:=1;ind10:=1;ind11:=1;ind12:=1;ind13:=1;ind14:=1;
ind15:=1;ind16:=1;ind17:=1;ind18:=1;ind19:=1;ind20:=1;ind22:=1;
ind23:=1;ind24:=1; ind25:=1;ind26:=1;ind27:=1;ind28:=1;
i:=i-1;////////////////////////////
if Adata[1].Name='' then
    Begin
    Application.MessageBox('Відсутні данні для запису',
    'Error!',Mb_ok); goto 1;
    end;
if (not FileExists(extractFilePath(application.ExeName)+'data\'+
             Adata[1].Name+'\'+Adata[1].Name+'.txt')) or
             ((FileExists(extractFilePath(application.ExeName)+'data\'+
             Adata[1].Name+'\'+Adata[1].Name+'.txt'))and
 (MessageDlg('Перезаписати файл '+Adata[1].Name+'.txt'
      ,mtConfirmation ,[mbyes,mbNo],0)=mryes ))
then
BEGIN
  if not DirectoryExists(extractFilePath(application.ExeName)+
       'data\'+Adata[1].Name) then
    if not CreateDir(extractFilePath(application.ExeName)+
        'data\'+Adata[1].Name) then
    raise Exception.Create('Неможливо створити папку');
assignFile(f,extractFilePath(application.ExeName)+'data\'+
             Adata[1].Name+'\'+Adata[1].Name+'.txt');
rewrite(f);
writeln(f,'Імя Супутника: '+Adata[1].Name+'     Station Name:'+Mc.name);
//forshow; // перевід в горизонтальну систему координат
SaveData;
2:
for j:=ind to i do
 begin
  s:=inttostr(AData[j].dd)+'/'+inttostr(AData[j].mm)
     +'/'+inttostr(AData[j].yy);
 while length(s)<10 do  s:=' '+s;
 if (j=1) or ((j-1)mod 6=0) then write(f,'Date:':8);
 write(f,s+'  ');
  if (j mod 6 =0)or(j=i) then begin ind:=j+1; break; end;
 end;
writeln(f);
for j:=ind2 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'UT:':8);
 write(f,Adata[j].UT:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind2:=j+1; break; end;
 end;
writeln(f);
for j:=ind22 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'UT":':8);
 write(f,Hms(Adata[j].UT):10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind22:=j+1; break; end;
 end;
writeln(f);

//if mc.Sys=1 then
 BEGIN
for j:=ind3 to i do
 begin
 if (j=1) or ((j-1)mod 6=0)then write(f,'RA:':8);
 write(f,Adata[j].A:10:4,'  ');
  if (j mod 6 =0)or(j=i) then begin ind3:=j+1; break; end;
 end;
writeln(f);
for j:=ind4 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'DEC:':8);
 write(f,Adata[j].B:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind4:=j+1; break; end;
 end;
writeln(f);
// Для Азимута й Висоти
for j:=ind23 to i do
 begin
 if (j=1) or ((j-1)mod 6=0)then write(f,'Az:':8);
 write(f,Adata[j].Agor:10:4,'  ');
  if (j mod 6 =0)or(j=i) then begin ind23:=j+1; break; end;
 end;
writeln(f);
for j:=ind24 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'H:':8);
 write(f,Adata[j].Bgor:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind24:=j+1; break; end;
 end;
writeln(f);
///
 END;

for j:=ind7 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Ao:':8);
 write(f,Adata[j].Ao:10:4,'  ');
  if (j mod 6 =0)or(j=i) then begin ind7:=j+1; break; end;
 end;
writeln(f);
for j:=ind8 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Bo:':8);
 write(f,Adata[j].Bo:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind8:=j+1; break; end;
 end;
writeln(f);
for j:=ind25 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Al:':8);
 write(f,Adata[j].Al:10:4,'  ');
  if (j mod 6 =0)or(j=i) then begin ind25:=j+1; break; end;
 end;
writeln(f);
for j:=ind26 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Bl:':8);
 write(f,Adata[j].Bl:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind26:=j+1; break; end;
 end;
writeln(f);
for j:=ind9 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Ag:':8);
 write(f,Adata[j].Ag:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind9:=j+1; break; end;
 end;
writeln(f);
for j:=ind10 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Bg:':8);
 write(f,Adata[j].Bg:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind10:=j+1; break; end;
 end;
writeln(f);
for j:=ind11 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'An:':8);
 write(f,Adata[j].An:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind11:=j+1; break; end;
 end;
writeln(f);
for j:=ind12 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Bn:':8);
 write(f,Adata[j].Bn:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind12:=j+1; break; end;
 end;
writeln(f);
////   напрямок осі обертання ////
for j:=ind27 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Ar:':8);
 write(f,Adata[j].Ar:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind27:=j+1; break; end;
 end;
writeln(f);
for j:=ind28 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Br:':8);
 write(f,Adata[j].Br:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind28:=j+1; break; end;
 end;
writeln(f);
/////////
for j:=ind13 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'F:':8);
 write(f,Adata[j].F:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind13:=j+1; break; end;
 end;
writeln(f);
for j:=ind14 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'V:':8);
 write(f,Adata[j].V:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind14:=j+1; break; end;
 end;
writeln(f);
for j:=ind15 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'E1:':8);
 write(f,Adata[j].E1:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind15:=j+1; break; end;
 end;
writeln(f);
for j:=ind16 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Q1:':8);
 write(f,Adata[j].Q1:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind16:=j+1; break; end;
 end;
writeln(f);
for j:=ind17 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'E2:':8);
 write(f,Adata[j].E2:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind17:=j+1; break; end;
 end;
writeln(f);
for j:=ind18 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'Q2:':8);
 write(f,Adata[j].Q2:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind18:=j+1; break; end;
 end;
writeln(f);
for j:=ind19 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'F(f):':8);
 write(f,Adata[j].Fyn:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind19:=j+1; break; end;
 end;
writeln(f);
for j:=ind20 to i do
 begin
 if (j=1) or ((j-1)mod 6=0) then write(f,'R:':8);
 write(f,Adata[j].R:10:4,'  ');
 if (j mod 6 =0)or(j=i) then begin ind20:=j+1; break; end;
 end;
writeln(f);
writeln(f);
if ind<i then
  begin
  closefile(f);
  assignFile(f,extractFilePath(application.ExeName)+'data\'+
             Adata[1].Name+'\'+Adata[1].Name+'.txt');
  Append(f);
  goto 2;
  end;
/// Cюди дописати вект. добуток///
//<----
for j:=1 to i do
  if (adata[1].dd=adata[j].dd) and (adata[1].mm=adata[j].mm)and
     (adata[1].yy=adata[j].yy)  then
 begin

  VectMultipl(adata[1].Ag,adata[1].Bg,adata[j].Ag,adata[j].Bg,Ta,Tb);
  VectMultipl(adata[1].Ag,adata[1].Bg,Ta,Tb,V1a,V1b);
  VectMultipl(adata[j].Ag,adata[j].Bg,Ta,Tb,V2a,V2b);

  if Tb <0 then Tb:= -1*Tb+90 ;
  if (Tb>=0) and (Tb<=90) then Tb:= 90- Tb;

//  ------------------
Check_Ta(Ta,adata[j].Ag, Ta2);
Ta:= Ta2;
//-----------------------------

//  if (Ta>=90) and (adata[j].Ag<Ta) then       /// Ibo tak
//  begin
//    Ta:=Ta-90;
//    if Ta<0 then Ta:= Ta + 360;
//  end;
//
//  if (adata[j].Ag>Ta) then       /// Ibo tak
//  begin
//    Ta:=Ta+90;
//    if Ta>360 then Ta:= Ta - 360;
//  end;

  end;
 writeln(f,'T=':8,'alfa=':8, Ta:8:4,'Delta=':8, Tb:8:4);
 writeln(f,'V1=':8,'alfa=':8, V1a:8:4,'Delta=':8, V1b:8:4);
 writeln(f,'V2=':8,'alfa=':8, V2a:8:4,'Delta=':8, V2b:8:4);
//////////////////////////////////
for j:=1 to i-2 do          /////FIGNJAAAAA/////
 begin
  VectMultipl(adata[j].A,adata[j].B,Adata[j+2].A,Adata[j+2].B,Ta,Tb);
  v[j].a:=Ta; v[j].B:=Tb;
  v[j].ao:=adata[j+2].Ao; v[j].Bo:=adata[j+2].Bo;
  write{ln}(f,'VV=':8,'alfa=':8, Ta:8:4,'Delta=':8, Tb:8:4);
  writeln(f,'Kut=':10, UGOL(v[j].A,v[j].B,v[j].Ao,v[j].Bo):8:4);
 end;
// for j:=1 to i-2 do
// writeln(f,'Kut=':8, UGOL(v[j].A,v[j].B,v[j].Ao,v[j].Bo):8:4);
//////////////////////////
closefile(f);
ShowMessage('Файл збережено в папці  "'+'data\'+
              Adata[1].Name+'"');
1:
END;
end;
//////////////////////////////////////////////////////

procedure TForm1.memoadd;
begin
memo1.Clear;
memo1.Lines.Add('Назва супутника: '+data.Name);
memo1.Lines.Add('Дата: '+inttostr(data.dd)+'/'+inttostr(data.mm)+
        '/'+inttostr(data.yy));
memo1.Lines.Add('Час: '+floattostrF(data.UT,ffFixed,10,5));
memo1.Lines.Add('Альфа: '+floattostrF(data.A,ffFixed,10,5));
memo1.Lines.Add('Дельта: '+floattostrF(data.B,ffFixed,10,5));
memo1.Lines.Add('Відстань: '+floattostrF(data.R,ffFixed,10,3));
end;

procedure TForm1.memo2add;
begin
sg1.Cells[k,1]:=inttostr(data.dd)+'/'+inttostr(data.mm)+
        '/'+inttostr(data.yy);
sg1.Cells[k,2]:=(floattostrF(data.UT,ffFixed,10,4));
sg1.Cells[k,3]:=(floattostrF(Hms(data.UT),ffFixed,10,4));
{if mc.Sys=1 then
 begin }
 sg1.Cells[k,4]:=(floattostrF(data.A,ffFixed,10,4));
 sg1.Cells[k,5]:=(floattostrF(data.B,ffFixed,10,4));
 /////
 sg1.Cells[k,6]:=(floattostrF(data.Agor,ffFixed,10,4));
 sg1.Cells[k,7]:=(floattostrF(data.Bgor,ffFixed,10,4));
 //////
 {end;}
{if mc.Sys=2 then
 begin                  // horizont
 sg1.Cells[k,4]:=(floattostrF(data.Agor,ffFixed,10,5));
 sg1.Cells[k,5]:=(floattostrF(data.Bgor,ffFixed,10,5));
 end;  }
sg1.Cells[k,8]:=(floattostrF(data.An,ffFixed,10,4));
sg1.Cells[k,9]:=(floattostrF(data.Bn,ffFixed,10,4));
sg1.Cells[k,10]:=(floattostrF(data.Ag,ffFixed,10,4));
sg1.Cells[k,11]:=(floattostrF(data.Bg,ffFixed,10,4));
sg1.Cells[k,12]:=(floattostrF(data.Ao,ffFixed,10,4));
sg1.Cells[k,13]:=(floattostrF(data.Bo,ffFixed,10,4));
sg1.Cells[k,14]:=(floattostrF(data.Al,ffFixed,10,3));
sg1.Cells[k,15]:=(floattostrF(data.Bl,ffFixed,10,3));
sg1.Cells[k,16]:=(floattostrF(data.F,ffFixed,10,4));
sg1.Cells[k,17]:=(floattostrF(data.V,ffFixed,10,4));
sg1.Cells[k,18]:=(floattostrF(data.E1,ffFixed,10,4));
sg1.Cells[k,19]:=(floattostrF(data.Q1,ffFixed,10,4));
sg1.Cells[k,20]:=(floattostrF(data.E2,ffFixed,10,4));
sg1.Cells[k,21]:=(floattostrF(data.Q2,ffFixed,10,4));
sg1.Cells[k,22]:=(floattostrF(data.Fyn,ffFixed,10,4));
sg1.Cells[k,23]:=(floattostrF(data.R,ffFixed,10,3));
sg1.Cells[k,24]:=(floattostrF(data.Ar,ffFixed,10,3));
sg1.Cells[k,25]:=(floattostrF(data.Br,ffFixed,10,3));

k:=k+1;
if k>sg1.ColCount then sg1.ColCount:=sg1.ColCount+1;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if MessageDlg('Вийти з программи?', mtConfirmation, [mbOK,MbCancel], 0)=mrOk
then close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
observationPoint.showmodal
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if N5.Checked=false then
 begin
  N5.Checked:=true;
  N6.checked:=false;
  label3.Font.Color:=clRed;
  label2.Font.Color:=clblack;
  mc.Sys:=1;
  form4.Label1.Caption:='Години';
  form4.GroupBox1.Caption:='Альфа';
  form4.GroupBox2.Caption:='Дельта';
  Button3.Caption:='Альфа,Дельта';
 end
 else
   begin
   N5.Checked:=false;
   label3.Font.Color:=clBlack;
   end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if N6.Checked=false then
 begin
  N6.Checked:=true;
  N5.checked:=false;
  label2.Font.Color:=clRed;
  label3.Font.Color:=clblack;
  mc.Sys:=2;
  form4.Label1.Caption:='Градуси';
  form4.GroupBox1.Caption:='Азимут';
  form4.GroupBox2.Caption:='Висота';
  Button3.Caption:='Азимут,Висота';
 end
 else
   begin
   N6.Checked:=false;
   label2.Font.Color:=clBlack;
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var Ac,Bc,Ass,Bss,JD:extended;
    Rmoon:vector;
begin
Conf.Fi:=Mc.Fi;
conf.Lya:=Mc.Lya;
Conf.H:=Mc.H;

if mc.Sys=2 then
  begin
  data.Agor:=(strtoFloat(form4.AlH.text)+strtoint(form4.Alm.text)/60)
       +strtofloat(form4.Als.text)/3600;
  data.Bgor:=(strtoFloat(form4.DelG.text)+strtoint(form4.Delm.text)/60)
       +strtofloat(form4.Dels.text)/3600;
  gorez(data.dd,data.mm,data.yy,data.UT,
      Conf.Lya,Conf.Fi,data.Agor,data.Bgor,data.A,data.B);
  end;
if mc.Sys=1 then
 Begin
  //data.A:=(strtoFloat(form4.AlH.text)+strtoint(form4.Alm.text)/60)
 //      +strtofloat(form4.Als.text)/3600;
 // data.A:=data.A*15;
 // data.B:=(strtoFloat(form4.DelG.text)+strtoint(form4.Delm.text)/60)
 //      +strtofloat(form4.Dels.text)/3600;
  //ABvGor(data.A, data.B, conf.Lya, conf.Fi, data.UT, data.dd, data.mm, data.yy,
  //       data.Agor, data.Bgor);
    RADEC_AzEL(data.A,data.B,data.UT,conf.Lya,conf.Fi,
                data.dd,data.mm,data.yy,data.Agor,Data.Bgor);
 End;
Geon(data.dd,data.mm,data.yy,data.UT,Conf.Lya,Conf.Fi,Conf.H,
       data.R/6378.137,data.A,data.B,data.Ag,data.Bg);
       Normal(data.dd,data.mm,data.yy,data.UT,data.A,data.B,
       data.An,data.Bn);
       ABSun(data.dd,data.mm,data.yy,data.UT,Ass,Bss);
       NormG(data.A+180,Ac);
       Bc:=-data.B;
       data.F:=Ugol(Ass,Bss,Ac,Bc);
       data.V:=Ugol(data.An,data.Bn,data.Ag,data.Bg);
       data.E1:=Ugol(Ass,Bss,data.Ag,data.Bg);
       data.Q1:=Ugol(Ac,Bc,data.Ag,data.Bg);
       data.E2:=Ugol(Ass,Bss,data.An,data.Bn);
       data.Q2:=Ugol(Ac,Bc,data.An,data.Bn);
       data.Ao:=Ass;
       data.Bo:=Bss;
       data.Fyn:=fync(data.f);
       JDAY_UT(data.yy,data.mm,data.dd,data.UT,JD);
       Moon(JD,Rmoon,data.Al,data.Bl);
//     data.Fyn:=FyncCil(data.f,data.E2,data.Q2);
//memo2add;
     Adata[i]:=data;
     if i<>1 then
      begin
        Rn(Adata[i-1].dd,Adata[i-1].mm,adata[i-1].yy,
           adata[i-1].UT,adata[i-1].An,adata[i-1].Bn,
           Adata[i].dd,Adata[i].mm,adata[i].yy,
           adata[i].UT,adata[i].An,adata[i].Bn,adata[i].Ar,adata[i].Br);
      end else begin adata[i].Ar:=0; adata[i].Br:=0; end;
     data.Ar:=adata[i].Ar;
     data.Br:=adata[i].Br;
   memo2add;  
  i:=i+1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
DecimalSeparator:='.';
Application.HelpFile:=ExtractFilePath(Application.ExeName)+'help\'+'Help.hlp';
i:=1; k:=1;
if fileExists('MainConf.mcn') then
 Begin
   assignFile(Mcf,'MainConf.mcn');
   reset(Mcf);
   read(Mcf,Mc);
   CloseFile(Mcf);
 End else
  Begin
   assignFile(Mcf,'MainConf.mcn');
   rewrite(Mcf);
   Mc.Name:='Uzhgorod';
   Mc.Fi:=48.633738889;
   Mc.Lya:=22.2985791667;
   Mc.H:=205;
   Mc.Sys:=1;
   write(Mcf,Mc);
   CloseFile(Mcf);
  End;
Label4.Visible:=true;
Label4.Caption:='Пункт: '+Mc.Name;
if mc.Sys=1 then
  begin N5.Checked:=true;
   N6.Checked:=false;  label3.font.Color:=clRed;
  end;
if mc.sys=2 then
  begin N6.Checked:=true;
  N5.Checked:=false; label4.font.Color:=clRed;
  end;
/////////////////
sg1.Cells[0,1]:='Дата:';
sg1.Cells[0,2]:=('UT____: ');
sg1.Cells[0,3]:=('UT"___: ');
//------ координати в обох системах----------
 sg1.Cells[0,4]:=('Альфа_: ');
 sg1.Cells[0,5]:=('Дельта: ');
 sg1.Cells[0,6]:=('А_____: ');
 sg1.Cells[0,7]:=('H_____: ');
//----------------------
sg1.Cells[0,8]:=('An____: ');
sg1.Cells[0,9]:=('Bn____: ');
sg1.Cells[0,10]:=('Ag____: ');
sg1.Cells[0,11]:=('Bg____: ');
sg1.Cells[0,12]:=('Ao____: ');
sg1.Cells[0,13]:=('Bo____: ');
sg1.Cells[0,14]:=('Al____: ');
sg1.Cells[0,15]:=('Bl____: ');
sg1.Cells[0,16]:=('F_____: ');
sg1.Cells[0,17]:=('V_____: ');
sg1.Cells[0,18]:=('E1____: ');
sg1.Cells[0,19]:=('Q1____: ');
sg1.Cells[0,20]:=('E2____: ');
sg1.Cells[0,21]:=('Q2____: ');
sg1.Cells[0,22]:=('F(f)____:');
sg1.Cells[0,23]:=('R_____: ');
/////////////////
end;

Procedure TForm1.WriteMc;
begin
 assignFile(Mcf,'MainConf.mcn');
   rewrite(Mcf);
   write(Mcf,form1.Mc);
 CloseFile(Mcf);
Label4.Visible:=true;
Label4.Caption:='Пункт: '+Mc.Name;
end;

procedure TForm1.N8Click(Sender: TObject);
label 1;
var i,j:integer;
begin
if Adata[1].Name='' then
    Begin
    Application.MessageBox('Відсутні данні для запису',
    'Error!',Mb_ok); goto 1;
    end;
for j:=1 to i-1 do
 begin
  if Adata[j].Name<>Adata[j+1].Name then
  if MessageDlg('В масиві данних переданих для запису '+#13+
  'містяться данні про різні супутники які будуть записані '+#13+
  'в один файл під ім"ям першого супутника.'+#13+
  'Бажаєте продовжити?',
   mtWarning ,[mbyes,mbNo],0)=mrNo then
      goto 1 else break;
 end;
////////
//SaveDataHor; - Vsi koord v Hor systemi
SaveData;

SaveInFile;
///////
1:
end;

procedure TForm1.Button6Click(Sender: TObject);
var p,t,l:integer;
begin
for p:=1 to sg1.colCount do
 Begin
  for t:=1 to sg1.rowCount do
   sg1.Cells[p,t]:='';
 end;
k:=1; i:=1;
for l:=1 to 300 do
 begin
 adata[i].name:='';
 adata[i].dd:=0;
 adata[i].mm:=0;
 adata[i].yy:=0;
 adata[i].UT:=0;
 adata[i].A:=0;
 adata[i].B:=0;
 adata[i].R:=0;
 adata[i].Ao:=0;
 adata[i].Bo:=0;
 adata[i].Ag:=0;
 adata[i].Bg:=0;
 adata[i].An:=0;
 adata[i].Bn:=0;
 adata[i].F:=0;
 adata[i].Fyn:=0;
 adata[i].V:=0;
 adata[i].E1:=0;
 adata[i].Q1:=0;
 adata[i].E2:=0;
 adata[i].Q2:=0;
 end;
sg1.ColCount:=5;
end;

procedure TForm1.N9Click(Sender: TObject);
var f:textfile;
    UT,A,H,R,g,m,s:real;
    Path,Ext,Nam:string;
    dd,mm,yy:integer;
    DateS:string[6];
    Ac,Bc,Ass,Bss,JD:extended;
    rmoon:vector;
begin
button6.OnClick(nil);
opendialog1.FilterIndex:=1;
Path:=extractfilepath(Application.ExeName);
OpenDialog1.InitialDir:=path+'Data\';
if OpenDialog1.Execute then
  if OpenDialog1.FileName<>'' then
  begin
    AssignFile(F, OpenDialog1.FileName);
    Reset(F);
    readln(f,DateS);
    yy:=strtoint(Dates[1]+Dates[2]);
    data.yy:=yy;
    case data.yy of
     60..99:data.yy:=1900+data.yy;      //1900+
     00..59:data.yy:=2000+data.yy;      //2000+
     end;
    mm:=strtoint(Dates[3]+Dates[4]);
    data.mm:=mm;
    dd:=strtoint(Dates[5]+Dates[6]);
    Data.dd:=dd;
    while not eof(f) do
     Begin
     Readln(F,UT,A,H,R);   //Для обох систем координат!!!
                           //тут пофіг, погані перетераються
     g:=int(UT);
     m:=int((UT-g)*100);
     s:=((UT-g)*100-m)*100;
     UT:=g+m/60+s/3600;
     data.UT:=UT;
     data.A:=A;
     Data.Agor:=A;
     data.B:=H;
     Data.Bgor:=H;
    // mc.Sys:=2;         TEST
     data.R:=R*1000;
     Nam:=OpenDialog1.FileName;
     Path:=extractfilePath(OpenDialog1.FileName);
     delete(Nam,1,length(Path));
     Ext:=ExtractFileExt(OpenDialog1.FileName);
     delete(Nam,pos(Ext,Nam),length(Ext));
     Data.Name:=Nam;
     ////////////////////sam obpaxunk, begin i end fiktivni
     BEGIN
     Conf.Fi:=Mc.Fi;
     conf.Lya:=Mc.Lya;
     Conf.H:=Mc.H;
    if mc.Sys=2 then
      begin
      gorez(data.dd,data.mm,data.yy,data.UT,
        Conf.Lya,Conf.Fi,data.Agor,data.Bgor,data.A,data.B);
      end;
    if mc.Sys=1 then
      begin
     // ABvGor(data.A,data.B,conf.Lya,conf.Fi,data.UT,
      //       data.dd,data.mm,data.yy,data.Agor, data.Bgor);
     RADEC_AzEL(data.A,data.B,data.UT,conf.lya,conf.Fi,
                data.dd,data.mm,data.yy,data.Agor,Data.Bgor);
      end;
    Geon(data.dd,data.mm,data.yy,data.UT,Conf.Lya,Conf.Fi,Conf.H,
       data.R/6378.137,data.A,data.B,data.Ag,data.Bg);
       Normal(data.dd,data.mm,data.yy,data.UT,data.A,data.B,
       data.An,data.Bn);
       ABSun(data.dd,data.mm,data.yy,data.UT,Ass,Bss);
       NormG(data.A+180,Ac);
       Bc:=-data.B;
       data.F:=Ugol(Ass,Bss,Ac,Bc);
       data.V:=Ugol(data.An,data.Bn,data.Ag,data.Bg);
       data.E1:=Ugol(Ass,Bss,data.Ag,data.Bg);
       data.Q1:=Ugol(Ac,Bc,data.Ag,data.Bg);
       data.E2:=Ugol(Ass,Bss,data.An,data.Bn);
       data.Q2:=Ugol(Ac,Bc,data.An,data.Bn);
       data.Ao:=Ass;
       data.Bo:=Bss;
       JDAY_UT(data.yy,data.mm,data.dd,data.UT,JD);
       Moon(JD,Rmoon,data.Al,data.Bl);
       data.Fyn:=fync(data.f);
     //memo2add;
     Adata[i]:=data;
     /////
     if i<>1 then
      begin
        Rn(Adata[i-1].dd,Adata[i-1].mm,adata[i-1].yy,
           adata[i-1].UT,adata[i-1].An,adata[i-1].Bn,
           Adata[i].dd,Adata[i].mm,adata[i].yy,
           adata[i].UT,adata[i].An,adata[i].Bn,adata[i].Ar,adata[i].Br);
      end else begin adata[i].Ar:=0; adata[i].Br:=0; end;
     data.Ar:=adata[i].Ar;
     data.Br:=adata[i].Br;
   memo2add;
     //////////
     i:=i+1;
     END;
    ////////////////////////////////
     End;
    CloseFile(F);
    SaveInFile;
  end;
  //mc.Sys:=1;       TEST
end;
procedure TForm1.N11Click(Sender: TObject);
begin
 AboutBox.show;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
//Kartinka.visible:=true
end;

procedure TForm1.N13Click(Sender: TObject);
var loadfile:textfile;
    path:string ;
begin
i:=1;
opendialog1.FilterIndex:=2;
Path:=extractfilepath(Application.ExeName);
OpenDialog1.InitialDir:=path+'Data\';
if OpenDialog1.Execute then
  if OpenDialog1.FileName<>'' then
 Begin
   AssignFile(loadfile,Opendialog1.FileName);
   reset(loadfile);
   while not eof(loadfile) do
    begin
    readln(loadfile,data.Name,data.dd,data.mm,
    data.yy,data.UT,data.A,data.B,
    data.An,data.Bn,data.Ag,data.Bg,
    data.Ao,data.Bo,
    data.F,data.V,data.E1,data.Q1,
    data.E2,data.Q2,data.Fyn,data.R);
     memo2add;
     Adata[i]:=data;     i:=i+1;
    end;
 end;
end;

end.

