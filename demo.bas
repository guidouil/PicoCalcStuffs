' demo.bas
randomize timer
cls rgb(0,0,0)
play modfile "laamaa.mod"
timer =0

scroller("PicoCalc MMBasic@252MHz!", 12000)
matrix(17000)
zbox(21000)
rond(26000)
hat(44000)
cubism(50000)
deep(62000)
cbox(66000)
knot(70000)
board(77000)
disco(83000)
sphere(90000)
cube(98000)
p9(106000)
scroller("Thx 2 TheBackShed.com from Guidouil | Music by Laamaa", 137000)

sub scroller(m$,eta)
  W=320:H=320
  local sx1(32),sy1(32),sx2(24),sy2(24)
  colour rgb(0,220,0),rgb(0,0,0)
  framebuffer create
  framebuffer write F
  'on Error Skip
  font 9,4
  sc=1
  cw=mm.info(FONTWIDTH)*sc
  ch=mm.info(FONTHEIGHT)*sc
  ' stars init
  for i=0 to 31
    sx1(i)=rnd()*W: sy1(i)=rnd()*H
  next
  for i=0 to 23
    sx2(i)=rnd()*W: sy2(i)=rnd()*H
  next
  v1=4.8: v2=18.7
  t=W: ph=0: amp=10
  do
    cls rgb(0,0,0)
    ' back layer
    for i=0 to 23 step 1
      sx2(i)=sx2(i)-v2: if sx2(i)<-1 then
        sx2(i)=W+rnd()*40: sy2(i)=rnd()*H
      endif
      pixel sx2(i),sy2(i),rgb(255,255,0)
    next
    ' front layer
    for i=0 to 31
      sx1(i)=sx1(i)-v1: if sx1(i)<-2 then
        sx1(i)=W+rnd()*60: sy1(i)=rnd()*H
      endif
      pixel sx1(i),sy1(i),rgb(0,255,255)
    next
    ' sine scroller
    t=t-4: if t<-len(m$)*cw then t=W
    ph=ph+0.12
    for k=1 to len(m$)
      x=t+(k-1)*cw
      if x>-cw and x<W+cw then
        y=140+sin((x*0.05)+ph)*amp
        c$=mid$(m$,k,1)
        text x,y,c$
      endif
    next
    framebuffer copy f,n
  loop until timer > eta
  framebuffer close
end sub

sub matrix(eta)
  cls :font 8
  fw=mm.info(fontwidth)
  fh=mm.info(fontheight)
  w=MM.HRES
  h=MM.VRES
  nc=w\fw
  dim yop(nc-1)
  for i=0 to nc-1
    yop(i)=-rnd*h
  next
  do
    for i=0 to nc-1
      x=i*fw:y0=yop(i)
      color 0,0
      c$=chr$(33+rnd*90)
      box x,y0-4*fh,x+fw-1,y0-3*fh-1, ,0
      color rgb(0,120,0),1
      text x,y0-2*fh,C$
      color rgb(0,200,0),1
      text x,y0-fh,C$
      color rgb(170,255,170),1
      text x,y,C$
      yop(i)=y0+fh
      if yop(i)>=h then yop(i)=-rnd*h
    next
    pause 7
  loop until timer >eta
end sub

sub zbox(eta)
  cls
  w=MM.HRES:h=MM.VRES
  start=w:stop=3:stp=-3
  framebuffer create
  framebuffer write f
  do
  for j=start to stop step stp
    cls
    for i=0 to w step j
    box i,i,w-i*2,h-i*2,1,rgb(0,0,255)
    next i
    framebuffer copy f,n
  next j
  if start=w then
    start=3:stop=w-3:stp=3
  else
    start=w:stop=3:stp=-3
  endif
  loop until timer>eta
  framebuffer close
end sub

sub rond(eta)
  w=MM.HRES:h=MM.VRES
  start=w/2:stop=3:stp=-3
  framebuffer create
  framebuffer write f
  do
  for j=start to stop step stp
    cls
    for i=0 to w step j
    col=rgb(0,255,0)
    circle w/2,h/2,i,1,1,col
    next i
    framebuffer copy f,n
  next j
  if start=w/2 then
    pause 200
    start=3:stop=w/2-3:stp=3
  else
    start=w/2:stop=3:stp=-3
  endif
  loop until timer > eta
  framebuffer close
end sub

sub hat(eta)
  cls rgb(0,0,0)
  RX=MM.HRES: RY=MM.VRES+42
  P=RX/2: Q=216
  XP=P*0.9: XR=1.5*pi
  YP=90: YR=1: ZP=90
  XF=XR/XP: YF=YP/YR: ZF=XR/XP

  for ZI= -Q to Q-1
  if ZI<-ZP or ZI>ZP then continue for
  ZT=ZI*XP/ZP: ZZ=ZI
  XL=int(0.5+sqr(XP*XP-ZT*ZT))

  for XI= -XL to XL
    XT=sqr(XI*XI+ZT*ZT)*XF: XX=XI
    YY=(sin(XT)+0.4*sin(3*XT))*YF
    SubPlotXY
  next XI
  next ZI
  do
  loop until timer > eta
end sub

sub cubism(eta)
  cls
  do
  Q=int(rnd*5+3): if Q=7 then Q=30
  A=rad(360/Q): S=sin(A): Co=cos(A)
  X=rnd*MM.HRES: Y=rnd*MM.VRES
  R=rnd*(sqr(Y+X)/20)*40+16
  for L=-R/5 to R/5
    N=rgb(255*rnd,255*rnd,255*rnd)
    U=R+L: V=U
    X1=X+U: Y1=Y+V
    for I=1 to Q
      T=V*Co-U*S: U=V*S+U*Co: V=T
      X2=X+U: Y2=Y+V
      line X1,Y1,X2,Y2,,N
      X1=X2: Y1=Y2
    next
  next
  loop until timer > eta
end sub

sub deep(eta)
  do
    cls
    for G=-rnd*42 to 400
      tt=rnd*99:  qq=rnd*99
      uu=rnd*320: vv=rnd*320
      A=rnd*3
      R=90/(1+rnd*100)
      Q=1+3*(.5+rnd/2)
      aa=1+3*rnd^2: Md=1
      if rnd*9<4 then Q=R:T=0:qq=0:A=0:Md=pi/3:aa=1
      Cd=(1+3*rnd^2)*R*R
      color rnd*&hFFFFFF
      for i=0 to Cd
        S=-log(rnd):  T=i*Md
        U=S*R*sin(T): V=S*Q*cos(T)
        T=S*A
        X=U*cos(T)+V*sin(T)
        Y=V*cos(T)-U*sin(T)
        D=(X*X+Y*Y)/(R*R+Q*Q)
        Z=99*((2.7^-D)+.1)
        Z=Z*(rnd-.5)^3
        y0=Y*cos(tt)+Z*sin(tt)
        Z=Z*cos(tt)-Y*sin(tt)
        x0=uu+X*cos(qq)+y0*sin(qq)
        y0=vv-X*sin(qq)+y0*cos(qq)
        pixel x0,y0
        if timer > eta then exit sub
      next
    next
  loop
end sub

sub cbox(eta)
cls
font 1
do
 x=int(rnd*40)
 y=int(rnd*40)
 s=int(rnd*7)+128
 colour int(rnd*&hFFFFFF)
 print @(x*8,y*12) chr$(s);
loop until timer > eta
end sub

sub knot(eta)
  cls
  font 10
  color rgb(147,112,219)
  do
  for n=1 to 400
    print chr$(rnd*7+32);
  next
  pause 500
  print @(0,0);
  loop until timer > eta
end sub

sub board(eta)
  dim upSet(7)=(&hCB,&hFD,&h36,&hC3,&hCB,&hCB,&h36,&h36)
  dim lfSet(7)=(&hA7,&hFD,&hA7,&h5A,&hA7,&h5A,&hA7,&h5A)
  dim upEstr(79)
  font 11: cls
  do
  lfE=0
  for i=0 to 39
    upE=upEstr(i)
    xxSet=upSet(upE) and lfSet(lfE)
    do
      tmp=int(rnd*8)
    loop until xxSet and (1<<tmp)
    lfE=tmp
    upEstr(i)=tmp
    color rgb(Green)
    if tmp=1 then colour rgb(Yellow)
    print chr$(tmp+48);
    pause 1
  next
  loop until timer > eta
end sub

sub disco(eta)
  framebuffer CREATE
  framebuffer WRITE F
  do
  cls
  t=timer
  n=7
  r=n*16
  tr=t-n*50
  ra=tr/1234
  rb=tr/2345
  for a=0 to pi step .39268
    for b=0 to pi*2 step .8-.6*sin(a)
      o=sin(a)*cos(b)
      k=sin(a)*sin(b)
      e=cos(a)*cos(ra)+k*sin(ra)
      x=(o*cos(rb)+e*sin(rb))*r+160
      y=(e*cos(rb)-o*sin(rb))*r+160
      if cos(a)*sin(ra)-k*cos(ra)<.05 then
        Col=rgb(rnd*255,rnd*255,rnd*255)
        circle x,y,4,,,Col,Col
      else
        circle x,y,1,,,0
      endif
    next b
  next a
  framebuffer COPY F,N
  loop until timer > eta
  framebuffer close
end sub

sub sphere(eta)
  cls
  dim Xa(255), Ya(255)
  x0=MM.HRES\2:y0=MM.VRES\2
  Xdir=5:Ydir=3
  n=5.5
  r=n*16
  do
  i=0
  t=timer
  tr=t-n*50
  ra=tr/1234
  rb=tr/2345
  for a=0 to pi step .39268
    for b=0 to pi*2 step .8-.6*sin(a)
      o=sin(a)*cos(b)
      k=sin(a)*sin(b)
      e=cos(a)*cos(ra)+k*sin(ra)
      pixel Xa(i),Ya(i),0
      Xa(i)=(o*cos(rb)+e*sin(rb))*r+x0
      Ya(i)=(e*cos(rb)-o*sin(rb))*r+y0
      col=rgb(255*rnd,255*rnd,255*rnd)
      pixel Xa(i),Ya(i),col
      inc i
    next b
  next a
  if x0<r then Xdir=5:Col=rgb(255*rnd,255*rnd,255*rnd)
  if y0<r then Ydir=5:Col=rgb(255*rnd,255*rnd,255*rnd)
  if x0>MM.HRES-r then Xdir=-5:Col=rgb(255*rnd,255*rnd,255*rnd)
  if y0>MM.VRES-r then Ydir=-5:Col=rgb(255*rnd,255*rnd,255*rnd)
  inc x0,Xdir:inc y0,Ydir
  loop until timer > eta
end sub

sub cube(eta)
  W=320:H=320:CX=160:CY=160
  FOV=120:SZ=2.5:ZOFF=3.6

  local xk(7),yk(7),zk(7),px(7),py(7),pz(7)
  local e1(11),e2(11),ez(11),ord(11)

  framebuffer create
  framebuffer write f

  for i=0 to 7
    xk(i)=((i and 1)*2-1)
    yk(i)=(((i\2) and 1)*2-1)
    zk(i)=(((i\4) and 1)*2-1)
  next

  restore edges
  for i=0 to 11: read e1(i),e2(i): next

  do
    cls rgb(0,0,0)
    rx=rx+0.045: ry=ry+0.030

    for i=0 to 7
      xt = xk(i)*cos(ry)-zk(i)*sin(ry)
      zt = xk(i)*sin(ry)+zk(i)*cos(ry)
      yt = yk(i)
      yy = yt*cos(rx)-zt*sin(rx)
      zz = yt*sin(rx)+zt*cos(rx)
      xx = xt
      pz(i)=zz
      s = FOV/(zz+ZOFF)
      px(i)=CX+xx*s*SZ
      py(i)=CY+yy*s*SZ
    next

    for i=0 to 11
      ez(i)=(pz(e1(i))+pz(e2(i)))/2
      ord(i)=i
    next

    for i=0 to 10
      for j=0 to 10-i
        if ez(ord(j))>ez(ord(j+1)) then
          k=ord(j): ord(j)=ord(j+1): ord(j+1)=k
        endif
      next
    next

    for i=0 to 11
      ii=ord(i): jj=ii
      s = (i)/11
      r = 40 + s*30
      g = 110 + s*145
      b = 140 + s*80
      line px(e1(jj)),py(e1(jj)),px(e2(jj)),py(e2(jj)),,rgb(r,g,b)
    next
    framebuffer copy f,n
  loop until timer > eta
  framebuffer close

  edges:
  data 0,1, 0,2, 0,4, 1,3, 1,5, 2,3
  data 2,6, 3,7, 4,5, 4,6, 5,7, 6,7
end sub

sub p9(eta)
  framebuffer create
  framebuffer write f
  a=100:b=3:xc=160:yc=120
  for n=0 to 9:for i=n to 180 step 10
  t=(i+90)*pi/180:x=a*cos(t):y=b*sin(t):cl=(y<0):ball xc+x,n*20+yc+y-112,cl
  next : for i=170+n to n step -10
  t=(i-90)*pi/180:x=a*cos(t):y=b*sin(t):cl=(y<0):ball xc+x,n*20+yc+y-112,cl
  next :next
  do
  blit 0,0,0,200,320,20:blit 0,20,0,0,320,220:framebuffer copy f,n:pause 20
  loop until timer > eta
  framebuffer close
end sub

sub ball bx,by,cl
  for d=6 to 1step -1
  if cl then :color rgb(255,255-d*42,0):else :color rgb(0,255-d*42,255):endif
  circle bx+d/2,by+d/2,d,d
  next
end sub

sub SubPlotXY
 X1= XX+ZZ+P
 Y1= RY-(YY-ZZ+Q)
 pixel X1,Y1,rgb(red)
 if Y1=0 then end sub
 line X1,Y1+1,X1,RY, 1,0
end sub

' Konami Style Font (Martin H.)
' Font type    : Full (95 ChArACtErs)
' Font size    : 8x8 pixels
' Memory usage : 764 Bytes
definefont #9
  5F200808
  00000000 00000000 18181818 00180018 006C6C6C 00000000 367F3636 0036367F
  3E683F0C 00187E0B 180C6660 00066630 386C6C38 003B666D 0030180C 00000000
  3030180C 000C1830 0C0C1830 0030180C 3C7E1800 0000187E 7E181800 00001818
  00000000 30181800 7E000000 00000000 00000000 00181800 180C0600 00006030
  7E6E663C 003C6676 18183818 007E1818 0C06663C 007E3018 1C06663C 003C6606
  6C3C1C0C 000C0C7E 067C607E 003C6606 7C60301C 003C6666 180C067E 00303030
  3C66663C 003C6666 3E66663C 00380C06 18180000 00181800 18180000 30181800
  6030180C 000C1830 007E0000 0000007E 060C1830 0030180C 180C663C 00180018
  6A6E663C 003C606E 7E66663C 00666666 7C66667C 007C6666 6060663C 003C6660
  66666C78 00786C66 7C60607E 007E6060 7C60607E 00606060 6E60663C 003C6666
  7E666666 00666666 1818187E 007E1818 0C0C0C3E 00386C0C 70786C66 00666C78
  60606060 007E6060 6B7F7763 0063636B 7E766666 0066666E 6666663C 003C6666
  7C66667C 00606060 6666663C 00366C6A 7C66667C 0066666C 3C60663C 003C6606
  1818187E 00181818 66666666 003C6666 66666666 00183C66 6B6B6363 0063777F
  183C6666 0066663C 3C666666 00181818 180C067E 007E6030 6060607C 007C6060
  18306000 0000060C 0606063E 003E0606 42663C18 00000000 00000000 FF000000
  7C30361C 007E3030 063C0000 003E663E 667C6060 007C6666 663C0000 003C6660
  663E0606 003E6666 663C0000 003C607E 7C30301C 00303030 663E0000 3C063E66
  667C6060 00666666 18380018 003C1818 18380018 70181818 6C666060 00666C78
  18181838 003C1818 7F360000 00636B6B 667C0000 00666666 663C0000 003C6666
  667C0000 60607C66 663E0000 07063E66 766C0000 00606060 603E0000 007C063C
  307C3030 001C3030 66660000 003E6666 66660000 00183C66 6B630000 00367F6B
  3C660000 00663C18 66660000 3C063E66 0C7E0000 007E3018 7018180C 000C1818
  00181818 00181818 0E181830 00301818 00466B31 00000000 FFFFFFFF FFFFFFFF
end definefont

definefont #10
08201010
C003C003 C003C003 C003C003 DFFBDFFB DFFBDFFB C003C003 C003C003 C003C003
C003C003 0000E001 FC03F001 FFF0FFC7 E3FF0FFF 800FC03F 80070000 C003C003
C003C003 C003C003 0000C003 FFFFFFFF FFFFFFFF C0030000 C003C003 C003C003
C003C003 80078007 402F000F 77EF63EF F7C6F7EE F000F402 E001E001 C003C003
C003C003 8007C007 003F800F 1FFC07FE 7FE03FF8 F001FC00 E003E001 C003C003
C003C003 E003E003 FC01F001 7FF8FFE0 0FFE3FFC 800F003F C0078007 C003C003
C003C003 8007C007 003F800F 1FFC07FE 7FE03FF8 F001FC00 E003E001 C003C003
C003C003 E001E003 FC00F001 3FF87FE0 07FE1FFC 800F003F C0078007 C003C003
end definefont

definefont #11
08300C08
00000000 00000000 00000000 667E3C18 C3C3C3C3 183C7E66
18181818 18181818 18181818 00000000 00FFFF00 00000000
18181818 00E0F038 00000000 18181818 00070F1C 00000000
00000000 38F0E000 18181818 00000000 1C0F0700 18181818
end definefont
