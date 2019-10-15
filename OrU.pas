unit OrU;


interface
type
Direct = (FROM,TOO);
 MyFile=record
             Name:String[20];
             dd:Integer;
             mm:Integer;
             yy:Integer;
             UT:Extended;
             A:Extended;
             B:Extended;
             Agor:Extended;
             Bgor:Extended;
             Ao:Extended;
             Bo:Extended;
             Al:Extended;
             Bl:Extended;   //- Al, Del Moon
             Ag:Extended;
             Bg:Extended;
             An:Extended;
             Bn:Extended;
             Ar:Extended;
             Br:Extended;   //-Al,Del напрямку осі обертання
             F:Extended;
             Fyn:Extended;
             V:Extended;
             E1:Extended;
             Q1:Extended;
             E2:Extended;
             Q2:Extended;
             R:Extended;
            End;
 MyConf=record
             Name:string[10];
             Fi:Extended;
             Lya:Extended;
             H:Extended;
             Sis:Integer;
{            A:Integer;
             B:Integer;
             R:Integer;
             D:Integer;
             T:Integer   }
            End;
  MainConf=Record
           Name:string[10];
           Fi,
           Lya,
           H:extended;
           Sys:integer;
           End;
 Vector     = ARRAY[1..4] of EXTENDED;

Function So(D,M,G:Integer):Extended;
Procedure Geon(D,M,G:Integer;T,L,FF,H,R,A,B:Extended;Var Ag,Bg:Extended);
Procedure Rn (D1,M1,G1:Integer;T1,A1,B1:Extended;D2,M2,G2:Integer;T2,A2,B2:Extended;Var Ar,Br:Extended);
Procedure Normal(D,M,G:Integer;T,A,B:Extended;Var An,Bn:Extended);
Procedure ABSun(D,M,G:Integer;T:Extended;Var A,B:Extended);
Procedure NormG (A:Extended;Var B:Extended);
Function Ugol(A1,B1,A2,B2:Extended):Extended;
Function Fync (F:Extended):Extended;
Procedure Gorez(D,M,G:Integer;T,L,F,A,H:Extended;Var Ae,Be:Extended);
Function Hms(A:Extended):Extended;
Function Hhh(A:Extended):Extended;
PROCEDURE RADEC_AZEL     ( RtAsc,Decl,UT,Latgd,Longd     : EXTENDED;
                           d,m,y                              :integer;
                           VAR Az,El                          : EXTENDED );

Procedure MOON (JD: EXTENDED; VAR RMoon: Vector; VAR RtAsc,Decl: EXTENDED);
PROCEDURE JDAY_UT (Year,Mon,Day,UT: EXTENDED; VAR JD : EXTENDED );
Procedure VectMultipl (Aa,Ab,Ba,Bb:extended; var Ca,Cb:extended);
Procedure Check_Ta (Ta,Ag:extended; var Ta2:extended);

implementation
Uses Math;
FUNCTION MODFUNC  ( XVal,Modby: EXTENDED ) : EXTENDED;
   VAR
       TempValue: EXTENDED;
   BEGIN
     TempValue := XVal;
     WHILE ABS(TempValue) > ModBy DO
         TempValue:= TempValue - INT(XVal/ModBy)*ModBy;
     MODFUNC:= TempValue;
   END;  { FUNCTION MODFUNC }
FUNCTION ASIN              ( XVal                                  : EXTENDED ) : EXTENDED;
   CONST
     Small      : EXTENDED =     0.000001;
   VAR
     Temp : EXTENDED;
   BEGIN
     IF ABS( XVal ) < 1.0 THEN
         Temp:= ARCTAN( XVal / SQRT(1.0 - XVal*XVal) )
       ELSE
         IF ABS(XVal)-1.0 < Small THEN
             IF XVal > 0.0  THEN
                 Temp:=   Pi / 2.0  { XVal =  1.0 }
               ELSE
                 Temp:=  -Pi / 2.0  { XVal = -1.0 }
           ELSE
             Writeln( 'Error in ASIN argument = ',XVal );

     ASIN:= Temp;
   END;  { FUNCTION ASIN }
   
FUNCTION ATAN2  ( SinValue,CosValue : EXTENDED ) : EXTENDED;
   CONST
     TwoPi      : EXTENDED =     2.0 * pi;    { 6.28318530717959; }
   VAR
     TanArg               : EXTENDED;
     Quadrant, SinINTEGER : INTEGER;
   BEGIN
     Quadrant:= 5;
     IF (SinValue > 0.0 ) and (SinValue < 1.0 ) and
        (CosValue > 0.0 ) and (CosValue < 1.0 ) THEN
          quadrant:= 1;
     IF (SinValue > 0.0 ) and (SinValue < 1.0 ) and
        (CosValue < 0.0 ) and (CosValue >-1.0 ) THEN
          quadrant:= 2;
     IF (SinValue > -1.0 ) and (SinValue < 0.0 ) and
        (CosValue <  0.0 ) and (CosValue >-1.0 ) THEN
          quadrant:= 3;
     IF (SinValue > -1.0 ) and (SinValue < 0.0 ) and
        (CosValue >  0.0 ) and (CosValue < 1.0 ) THEN
          quadrant:= 4;
     IF Quadrant <> 5 THEN
       BEGIN
         tanarg:= ARCTAN(SinValue/CosValue);
         IF (Quadrant <  4) and (Quadrant <> 1) THEN
             tanarg:= tanarg + Pi
           ELSE
             IF Quadrant =  4 THEN
                 tanarg:= tanarg + TwoPi;
       END
       ELSE
         BEGIN                                  { Special Cases }
           SinINTEGER:= Round(SinValue);
           CASE SinINTEGER OF
             -1 :  TanArg:= 3.0*Pi/2.0;
              0 :  IF ROUND(CosValue) > 0.0 THEN
                       TanArg:= 0.0
                     ELSE
                       TanArg:= Pi;
              1 :  TanArg:=  Pi/2.0;
           END; { Case }
         END;
     ATAN2:= tanarg;
   END; { FUNCTION ATAN2 }


Function Hms(A:extended):extended;
var h,m,s:extended;
begin
h:=int(A);
m:=int((A-h)*60);
s:=(((A-h)*60)-m)*60;
result:=(h+(m/100)+(s/10000));
end;

Function Hhh(A:extended):extended;
var h,m,s:extended;
begin
h:=int(A);
m:=int((A-h)*100);
s:=((A-h)*100-m)*100;
result:=h+m/60+s/3600;
end;

Procedure NormG (A:Extended;Var B:Extended);
 Begin
  While A<0 Do A:=A+360;
  While A>360 Do A:=A-360;
  B:=A
 End;

Procedure NormH (A:Extended;Var B:Extended);
 Begin
  While A<0 Do A:=A+24;
  While A>24 Do A:=A-24;
  B:=A
 End;

Procedure NormR(A:Extended;Var B:Extended);
begin
While a<0 do b:=a+2*pi;
While a>(2*pi) do b:=a-2*pi;
end;

Procedure XYA (X,Y:Extended;Var A:Extended);
 Begin
  If X=0 Then A:=90
         Else A:=180*ArcTan(Y/X)/Pi;
  If (X<0) And (Y>=0) And (A<0) Then A:=180+A;
  If (X<0) And (Y<0) And (A>=0) Then A:=180+A;
  If (X>=0) And (Y<0) And (A<0) Then A:=360+A;
 End;

Procedure XYB (X,Y:Extended;Var A:Extended);
 Begin
  If X=0 Then A:=90
         Else A:=180*ArcTan(Y/X)/Pi;
  If Y>=0
   Then A:=ABS(A)
   Else A:=-1*ABS(A);
 End;

function ArcSin(X:Extended):Extended;
begin
  If X=1 Then ArcSin:=0
         Else ArcSin:=ArcTan(X/Sqrt(1-X*X));
end;

Function ArcCos(X:Extended):Extended;
begin
  If X=1 Then ArcCos:=Pi/2
         Else ArcCos:=(-1)*ArcTan(X/Sqrt(1-X*X))+Pi/2;
end;
Procedure EE(M,E:Extended;Var A:Extended);
 Begin
  A:=M;
  While Abs(A-E*Sin(A)-M)>0.00000000001 Do
   Begin
    A:=A-(A-E*Sin(A)-M)/(1-E*Cos(A))
   End;
 End;

Function JD (D,M,G:Integer):Extended;
 Var A:Longint;
 Begin
  If M<3
   Then
    Begin
     G:=G-1;
     M:=M+12
    End;
  A:=Trunc(G/100);
  A:=2-A+Trunc(A/4);
  A:=A+Trunc(365.25*G);
  A:=A+Trunc(30.6001*(M+1));
  JD:=A+D+1720994.5
 End;
Function So(D,M,G:Integer):Extended;
 Var S:Extended;
 Begin
  S:=(JD(D,M,G)-2451545)/36525;
  S:=6+41/60+(50.54841+8640184.812866*S+0.093104*S*S-(6.2E-6)*S*S*S)/3600;
  NormH(S,S);
  So:=S
 End;

Function Sso(D,M,G:Integer):Extended;
 Var A:Extended;
 Begin
  A:=(JD(0,1,G)-2415020)/36525;
  A:=6.6460656+2400.051262*A+0.00002581*A*A;
  A:=24-(A-24*(G-1900));
  A:=(JD(D,M,G)-JD(0,1,G))*0.0657098-A;
  NormH(A,A);
  Sso:=A
 End;


Function LSun(D,M,G:Integer;T:Extended):Extended;
 Const E=0.016718;
   Var A:Extended;
 Begin
  T:=(JD(D,M,G)-2451545+T/24)/36525;
  NormG((1287099.804+129596581.224*T-0.577*T*T-0.012*T*T*T)/3600,A);
  EE(A*Pi/180,E,A);
  NormG(360*ArcTan(Sin(A/2)*Sqrt((1+E)/(1-E))/Cos(A/2))/Pi,A);
  NormG((1018578.046+6190.046*T+1.666*T*T+0.012*T*T*T)/3600,T);
  NormG(T+A,A);
  LSun:=A
 End;

Function LSun1(D,M,G:Integer;T:Extended):Extended;
 Const E=0.016718;
       Wg=282.596403;
       Eg=278.83354;
   Var A:Extended;
 Begin
  A:=JD(D,M,G)-JD(0,1,1980)+T/24;
  NormG(360*A/365.2422,A);
  NormG(A+Eg-Wg,A);
  EE(A*Pi/180,E,A);
  A:=360*ArcTan(Sin(A/2)*Sqrt((1+E)/(1-E))/Cos(A/2))/Pi;
  NormG(A+Wg,A);
  LSun1:=A
 End;

Procedure Gorez(D,M,G:Integer;T,L,F,A,H:Extended;Var Ae,Be:Extended);
 Var S,D1:Extended;
 Begin
  L:=L/15;
  H:=H*Pi/180;
  F:=F*Pi/180;
  A:=A*Pi/180;
  D1:=Sin(H)*Sin(F)+Cos(H)*Cos(F)*Cos(A);
  D1:=ArcSin(D1);
  Be:=D1*180/Pi;
  D1:=(Sin(H)-Sin(D1)*Sin(F))/(Cos(D1)*Cos(F));
  D1:=ArcCos(D1)*180/Pi;
  If Sin(A)>=0 Then D1:=360-D1;
  NormH(So(D,M,G)+L+T*(1+9.86/3600),S);
  NormG(S*15-D1,Ae)
 End;


Function Eklip(D,M,G:Integer):Extended;
 Var T:Extended;
 Begin
  T:=(JD(D,M,G)-2451545)/36525;
  NormG((84381.448-46.815*T-0.00059*T*T+0.001813*T*T*T)/3600,T);
  Eklip:=T
 End;

Procedure ABSun(D,M,G:Integer;T:Extended;Var A,B:Extended);
 Var A1:Extended;
 Begin
  A1:=LSun(D,M,G,T)*Pi/180;
  XYA(Cos(A1),Sin(A1)*Cos(Eklip(D,M,G)*Pi/180),A);
  A1:=Sin(A1)*Sin(Eklip(D,M,G)*Pi/180);
  XYB(Sqrt(1-A1*A1),A1,B)
 End;

Procedure Geon(D,M,G:Integer;T,L,FF,H,R,A,B:Extended;Var Ag,Bg:Extended);
 Var
  S,F,Y,Z,A1,B1,G1,G2:Extended;
  Begin
   L:=L/15;
   H:=H/6378137;
   A:=A*Pi/180;
   B:=B*Pi/180;
   FF:=FF*Pi/180;
   NormH(So(D,M,G)+L+T*(1+9.86/3600),S);
   S:=S*15*Pi/180;
   F:=1/298.257;
   Y:=Sqrt(1-(2*F-Sqr(F))*Sqr(Sin(FF)));
   G1:=(1/Y)+H;
   G2:=(Sqr(1-F)/Y)+H;
   Z:=R*Cos(B)*Cos(A)+G1*Cos(ff)*Cos(S);
   XYA(Z,R*Cos(B)*Sin(A)+G1*Cos(ff)*Sin(S),A1);
   XYB(Z/Cos(A1*Pi/180),R*Sin(B)+G2*Sin(ff),B1);
   If A1+180<=360
    Then Ag:=A1+180
    Else Ag:=A1-180;
   Bg:=-B1
  End;

Procedure AB_XYZ(A,B:Extended;Var X,Y,Z:Extended);
 Begin
   A:=A*Pi/180;
   B:=B*Pi/180;
   X:=Cos(A)*Cos(B);
   Y:=Sin(A)*Cos(B);
   Z:=Sin(B)
 End;

Procedure XYZ_AB (X,Y,Z:Extended;Var A,B:Extended);
 Begin
   XYA(X,Y,A);
   If (A=90) OR (A=180)
    Then
     Begin
      If Z>=0
       Then B:=90
       Else B:=-90;
     End
    Else XYB(X/Cos(A*Pi/180),Z,B);
  End;

Procedure Normal(D,M,G:Integer;T,A,B:Extended;Var An,Bn:Extended);
 Var Det,X,Y,Z,Xo,Yo,Zo,Ao,Bo:Extended;
  Begin
   NormG(A+180,A);
   B:=-B;
   ABSun(D,M,G,T,Ao,Bo);
   AB_XYZ(A,B,X,Y,Z);
   AB_XYZ(Ao,Bo,Xo,Yo,Zo);
   X:=X+Xo;
   Y:=Y+Yo;
   Z:=Z+Zo;
   Det:=Sqrt(X*X+Y*Y+Z*Z);
   XYZ_AB(X/Det,Y/Det,Z/Det,An,Bn)
  End;

Function Ugol(A1,B1,A2,B2:Extended):Extended;
 Begin
  A1:=A1*Pi/180;
  A2:=A2*Pi/180;
  B1:=B1*Pi/180;
  B2:=B2*Pi/180;
  Ugol:=ArcCos(Sin(B1)*Sin(B2)+Cos(B1)*Cos(B2)*Cos(A1-A2))*180/Pi
 End;

// Визначення детермінанта//
Function Gaus (X1,X2,X3,X4,X5,X6,X7,X8,X9:Extended):Extended;
 Begin
  Gaus:=X1*X5*X9+X7*X2*X6+X4*X8*X3-X7*X5*X3-X4*X2*X9-X1*X8*X6
 End;

// Визначення напрямку осі обертання по двом дзеркальним спалахам//
Procedure Rn (D1,M1,G1:Integer;T1,A1,B1:Extended;D2,M2,G2:Integer;T2,A2,B2:Extended;Var Ar,Br:Extended); 
 Var DD1,DD2,DD3,X1,Y1,Z1,Xo,Yo,Zo,X2,Y2,Z2,dX,dY,dZ,Ao,Bo:Extended;
  Begin
   NormG(A1+180,A1);
   B1:=-B1;
   AB_XYZ(A1,B1,X1,Y1,Z1);
   NormG(A2+180,A2);
   B2:=-B2;
   AB_XYZ(A2,B2,X2,Y2,Z2);
   ABSun(D1,M1,G1,T1,Ao,Bo);
   AB_XYZ(Ao,Bo,Xo,Yo,Zo);
   ABSun(D2,M2,G2,T2,Ao,Bo);
   AB_XYZ(Ao,Bo,dX,dY,dZ);
   dX:=dX-Xo;
   dY:=dY-Yo;
   dZ:=dZ-Zo;
   DD1:=Gaus(1,Yo,Zo,-1,Y1,Z1,-1,Y2+dY,Z2+dZ);
   DD2:=Gaus(-1,Xo,Zo,1,X1,Z1,1,X2+dX,Z2+dZ);
   DD3:=Gaus(1,Xo,Yo,-1,X1,Y1,-1,X2+dX,Y2+dY);
   DD1:=DD1/Sqrt(DD1*DD1+DD2*DD2+DD3*DD3);
   DD2:=DD2/Sqrt(DD1*DD1+DD2*DD2+DD3*DD3);
   DD3:=DD3/Sqrt(DD1*DD1+DD2*DD2+DD3*DD3);
   XYZ_AB(DD1,DD2,DD3,Ar,Br)
  End;

Procedure T(Ag1,Bg1,Ag2,Bg2:extended; var At,Bt:extended);
var x1,y1,z1,x2,y2,z2,Tx,Ty,Tz:extended;
begin
AB_XYZ(Ag1,Bg1,x1,y1,z1);
AB_XYZ(Ag2,Bg2,x2,y2,z2);
Tx:=y1*z2-y2*z1;
Ty:=z1*x2-x1*z2;
Tz:=x1*y2-y1*x2;
XYZ_AB(Tx,Ty,Tz,At,Bt);
end;

// Векторний добуток векторів представлених в Альфa Дельта //
Procedure VectMultipl (Aa,Ab,Ba,Bb:extended; var Ca,Cb:extended);
var x1,y1,z1,x2,y2,z2,Cx,Cy,Cz:extended;
begin
AB_XYZ(Aa,Ab,x1,y1,z1);
AB_XYZ(Ba,Bb,x2,y2,z2);
Cx:=y1*z2-y2*z1;
Cy:=z1*x2-x1*z2;
Cz:=x1*y2-y1*x2;
XYZ_AB(Cx,Cy,Cz,Ca,Cb);
end;

Function Fync (F:Extended):Extended;
 Begin
  F:=F*Pi/180;
  F:=(Sin(F)+(Pi-F)*Cos(F))/Pi;
  Fync:=Ln(F)/Ln(10)
 End;

Function FyncCil (F,E2,Q2:Extended):Extended;
 Begin
  F:=F*Pi/180;
  E2:=E2*Pi/180;
  Q2:=Q2*Pi/180;
  F:=((Sin(F)+(Pi-F)*Cos(F))/Pi)*sin(E2)*sin(Q2);
  FyncCil:=Ln(F)/Ln(10)
 End;

//---Moon Alfa, Delta ---//
// похибка по Дельта до 6', MyMoon з AstroUnit точніше! там похибка до 1'
PROCEDURE MOON               ( JD                                    : EXTENDED;
                               VAR RMoon                             : Vector;
                               VAR RtAsc,Decl                        : EXTENDED );
   CONST
     TwoPi      : EXTENDED =     2.0 * pi;  { 6.28318530717959; }
     Deg2Rad    : EXTENDED =     pi /180.0;  { 0.01745329251994; }
   VAR
//     Hr, MIN, Deg : INTEGER;
     {SEC,} TTDB, l, m, n, {Temp,} Obliquity,
     EclpLong, EclpLat, HzParal : EXTENDED;
   BEGIN
     { --------------------  Initialize values   -------------------- }
     TTDB := ( JD - 2451545.0 ) / 36525.0;

     EclpLong:= 218.32 + 481267.883*TTDB
                + 6.29*SIN( (134.9+477198.85*TTDB)*Deg2Rad )
                - 1.27*SIN( (259.2-413335.38*TTDB)*Deg2Rad )
                + 0.66*SIN( (235.7+890534.23*TTDB)*Deg2Rad )
                + 0.21*SIN( (269.9+954397.70*TTDB)*Deg2Rad )
                - 0.19*SIN( (357.5+ 35999.05*TTDB)*Deg2Rad )
                - 0.11*SIN( (186.6+966404.05*TTDB)*Deg2Rad );     { Deg }

     EclpLat :=   5.13*SIN( ( 93.3+483202.03*TTDB)*Deg2Rad )
                + 0.28*SIN( (228.2+960400.87*TTDB)*Deg2Rad )
                - 0.28*SIN( (318.3+  6003.18*TTDB)*Deg2Rad )
                - 0.17*SIN( (217.6-407332.20*TTDB)*Deg2Rad );     { Deg }

     HzParal :=   0.9508 + 0.0518*COS( (134.9+477198.85*TTDB)*Deg2Rad )
                + 0.0095*COS( (259.2-413335.38*TTDB)*Deg2Rad )
                + 0.0078*COS( (235.7+890534.23*TTDB)*Deg2Rad )
                + 0.0028*COS( (269.9+954397.70*TTDB)*Deg2Rad );   { Deg }

     EclpLong := MODFUNC( EclpLong*Deg2Rad, TwoPi );
     EclpLat  := MODFUNC( EclpLat*Deg2Rad, TwoPi );
     HzParal  := MODFUNC( HzParal*Deg2Rad, TwoPi );

     Obliquity:= 23.439291 - 0.0130042*TTDB; {deg}
     Obliquity:= Obliquity *Deg2Rad;

     { ------------- Find the geocentric direction cosines ---------- }
     l:= COS( EclpLat ) * COS( EclpLong );
     m:= COS(Obliquity)*COS(EclpLat)*SIN(EclpLong)
         - SIN(Obliquity)*SIN(EclpLat);
     n:= SIN(Obliquity)*COS(EclpLat)*SIN(EclpLong)
         + COS(Obliquity)*SIN(EclpLat);

     { -------------- Calculate MOON position vector ---------------- }
     RMoon[4]:= 1.0/SIN( HzParal );
     RMoon[1]:= RMoon[4]*l;
     RMoon[2]:= RMoon[4]*m;
     RMoon[3]:= RMoon[4]*n;

     { --------------- Find Rt Ascension and Declination ------------ }
     RtAsc:= ATAN2( m,l );
     Decl := ArcSIN( n );
     RtAsc:=radtodeg(RtAsc);
     Decl:=radtodeg(Decl);
   {  IF Show = 'Y' THEN
       BEGIN
         WriteLn('MOON Test Case ' );
         WriteLn( 'TTDB     ',TTDB:18:12 );
         DMS_RAD( Deg,MIN,SEC,FROM, EclpLong );
         WriteLn( 'Ecl Lon  ',EclpLong/Deg2Rad:15:9,Deg:3,MIN:3,SEC:7:3 );
         DMS_RAD( Deg,MIN,SEC,FROM, EclpLat );
         WriteLn( 'Ecl Lat  ',EclpLat/Deg2Rad:15:9,Deg:3,MIN:3,SEC:7:3 );
         WriteLn( 'Parallax ',HzParal/Deg2Rad:15:9 );
         DMS_RAD( Deg,MIN,SEC,FROM, Obliquity );
         WriteLn( 'Obliquit ',Obliquity/Deg2Rad:15:9,Deg:3,MIN:3,SEC:7:3 );
         HMS_RAD( Hr,MIN,SEC, FROM, RtAsc );
         WriteLn( 'RtAsc    ',RtAsc/Deg2Rad:15:9,Hr:3,MIN:3,SEC:7:3,'HMS' );
         DMS_RAD( Deg,MIN,SEC, FROM, Decl );
         WriteLn( 'decl     ',Decl/Deg2Rad:15:9,Deg:3,MIN:3,SEC:7:3 );
         WriteLn( RMoon[1]:14:7,RMoon[2]:14:7,RMoon[3]:14:7,RMoon[4]:18:7,' ER' );
         Temp:= 6378.1363;
         WriteLn( RMoon[1]*temp:18:6,RMoon[2]*Temp:18:6,RMoon[3]*Temp:18:6,RMoon[4]*Temp:18:6,' km' );
       END;  }
   END;  { PROCEDURE MOON }

PROCEDURE JDAY (Year,Mon,Day,Hr,MIN: INTEGER; SEC: EXTENDED;
                                                     VAR JD : EXTENDED );
   BEGIN
     JD:= 367.0 * Year
          - TRUNC( (7* (Year+TRUNC ( (Mon+9)/12.0) ) ) * 0.25 )
          + TRUNC( 275*Mon / 9.0 )
          + Day + 1721013.5
          + ( (SEC/60.0 + MIN ) / 60.0 + Hr ) / 24.0;  { UT in days }
          { - 0.5*SGN(100.0*Year + Mon - 190002.5) + 0.5; }
   END;  { PROCEDURE JDAY }

PROCEDURE JDAY_UT (Year,Mon,Day,UT: EXTENDED; VAR JD : EXTENDED );
   BEGIN
     JD:= 367.0 * Year
          - TRUNC( (7* (Year+TRUNC ( (Mon+9)/12.0) ) ) * 0.25 )
          + TRUNC( 275*Mon / 9.0 )
          + Day + 1721013.5
          + ( UT ) / 24.0;  { UT in days }
          { - 0.5*SGN(100.0*Year + Mon - 190002.5) + 0.5; }
   END;  { PROCEDURE JDAY_UT }

{ ------------------------------------------------------------------------------
|
|                           FUNCTION GSTIME
|
|  this function finds the Greenwich sidereal time (iau-82).
|
|  Author        : David Vallado                  719-573-2600    1 Mar 2001
|
|  Inputs          Description                    Range / Units
|    JDUT1       - Julian Date in UT1             days from 4713 BC
|
|  OutPuts       :
|    GSTIME      - Greenwich SIDEREAL Time        0 to 2Pi rad
|
|  Locals        :
|    Temp        - Temporary variable for reals   rad
|    TUT1        - Julian Centuries from the
|                  Jan 1, 2000 12 h epoch (UT1)
|
|  Coupling      :
|    MODFUNC     - MOD FUNCTION for REAL variables
|
|  References    :
|    Vallado       2007, 193, Eq 3-43
|
 ----------------------------------------------------------------------------- }

FUNCTION GSTIME          ( JDUT1                  : EXTENDED ): EXTENDED;
   CONST
     TwoPi      : EXTENDED =     2.0*Pi;  { 6.28318530717959; }
     Deg2Rad    : EXTENDED =     Pi/180.0;
   VAR
     Temp, TUT1 : EXTENDED;
   BEGIN
     TUT1:= ( JDUT1 - 2451545.0 ) / 36525.0;
     Temp:= - 6.2E-6*TUT1*TUT1*TUT1
            + 0.093104*TUT1*TUT1
            + (876600.0*3600 + 8640184.812866)*TUT1
            + 67310.54841;  {sec }
     Temp:= MODFUNC( Temp*Deg2Rad/240.0,TwoPi ); { 360/86400 = 1/240, to deg, to rad }

     { ------------------------ Check quadrants --------------------- }
     IF Temp < 0.0 THEN
         Temp:= Temp + TwoPi;

     GSTIME:= Temp;

   END; { FUNCTION GSTIME }


{ ------------------------------------------------------------------------------
|
|                           PROCEDURE LSTIME
|
|  this procedure finds the Local sidereal time at a given location.
|
|  Author        : David Vallado                  719-573-2600    1 Mar 2001
|
|  Inputs          Description                    Range / Units
|    Lon         - SITE longitude (WEST -)        -2Pi to 2Pi rad
|    JDUT1       - Julian Date in UT1             days from 4713 BC
|
|  OutPuts       :
|    LST         - Local sidereal Time            0.0 to 2Pi rad
|    GST         - Greenwich sidereal Time        0.0 to 2Pi rad
|
|  Locals        :
|    None.
|
|  Coupling      :
|    MODFUNC       MOD FUNCTION for REAL variables
|    GSTIME        Finds the Greenwich sidereal Time
|
|  References    :
|    Vallado       2007, 194, alg 15, ex 3-5
|
 ----------------------------------------------------------------------------- }

PROCEDURE LSTIME             ( Lon,JDUT1                             : EXTENDED;
                               VAR LST,GST                           : EXTENDED );
   CONST
     TwoPi      : EXTENDED =     2.0*Pi;  { 6.28318530717959; }
   BEGIN
     GST := GSTIME( JDUT1 );
     LST := Lon + GST;

     { ------------------------ Check quadrants --------------------- }
     LST := MODFUNC( LST,TwoPi );
     IF LST < 0.0 THEN
         LST:= LST + TwoPi;

   END; { PROCEDURE LSTIME }

{ ------------------------------------------------------------------------------
|
|                           PROCEDURE RADEC_AZEL
|
| This PROCEDURE converts right ascension declination values with
|   azimuth, and elevation.  Notice the range is not defined because
|   Right ascension declination only allows a unit vector to be formed.
|
|  Author        : David Vallado                  719-573-2600    1 Mar 2001
|
|  Inputs          Description                    Range / Units
|    RtAsc       - Right Ascension                deg
|    Decl        - Declination                    deg
|    UT          - Universal Time                 hours hh,hhh
|    Latgd       - Geodetic Latitude              deg
|
|  Outputs       :
|    Az          - Azimuth                        deg
|    El          - Elevation                      deg
|
|  Locals        :
|    LHA         - Local Hour ANGLE               -2Pi to 2Pi rad
|    LST         - Local Sideral Time             -2Pi to 2Pi rad
|    Sinv        - Sine value
|    Cosv        - Cosine value
|
|  Coupling      :
|    ASIN      - Arc sine FUNCTION
|    ATAN2       - Arc Tangent FUNCTION that resolves quadrant ambiguites
|
|  References    :
|    Vallado       2001, 255-257, Alg 28
|    Kudak         2009.03.18
 ----------------------------------------------------------------------------- }

PROCEDURE RADEC_AZEL     ( RtAsc,Decl,UT,Latgd,Longd     : EXTENDED;
                           d,m,y                         : integer;
                           VAR Az,El                     : EXTENDED );
   VAR
     Sinv, Cosv, LHA,LST,GST,JD :  EXTENDED;
   BEGIN
       BEGIN
       rtAsc:=degtorad(rtAsc); Decl:=degtorad(Decl);
       Latgd:=degtorad(Latgd); Longd:=degtorad(Longd);

        JDAY_UT(Y,M,D,UT,JD);
        LStime(Longd,JD,LST,GST);
        LHA := LST - RtAsc;

      El  := ASIN( SIN(Decl)*SIN(Latgd) + COS(Decl)*COS(Latgd)*COS(LHA) );
         Sinv:= -SIN(LHA)*COS(Decl)*COS(Latgd)/(COS(el)*COS(Latgd));
         Cosv:= ( SIN(Decl)-SIN(el)*SIN(Latgd) )/(COS(el)*COS(Latgd));
         Az  := ATAN2( Sinv,Cosv );
         El:=radtodeg(El);
         Az:=radtodeg(Az);
       END;
   END;  { PROCEDURE RADEC_AZEL }

Function SectionX(X:extended):extended;
begin
  if (x>=0) and (x<=90) then sectionx:=1;
  if (x>90) and (x<=180) then sectionx:=2;
  if (x>180) and (x<=270) then sectionx:=3;
  if (x>270) and (x<360) then sectionx:=4;
end;

Procedure Check_Ta(Ta, Ag   : EXTENDED;
            VAR Ta2:Extended);
var x1,x2,z:Extended;
begin
  x1:= sectionx(Ag);
  x2:= sectionx(Ta);
  z:= x1-x2;

  if z > 1 then Ta2:=-1*(Ta-360);
  if z = 1 then Ta2:=Ta+90;
  if z < 1 then Ta2:=Ta-90;
end;
end.
