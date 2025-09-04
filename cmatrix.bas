' cmatrix.bas
' by GPT5 & Guidouil
CLS
Font 2
Text 0,0,"FOLLOW THE WHITE RABBIT..."
Pause 1000
CLS
Font 8
fw=MM.Info(fontwidth)
fh=MM.Info(fontheight)
w=MM.HRES
h=MM.VRES
nc=w\fw
Dim yp(nc-1)
For i=0 To nc-1
  yp(i)=-Rnd*h
Next
Do
 If Inkey$<>"" Then End
 For i=0 To nc-1
  x=i*fw
  y0=yp(i)
  Color 0,0
  Box x,y0-4*fh,x+fw-1,y0-3*fh-1, ,0
  Color RGB(0,120,0),1
  Text x,y0-2*fh,Chr$(33+Rnd*90)
  Color RGB(0,200,0),1
  Text x,y0-fh,Chr$(33+Rnd*90)
  Color RGB(170,255,170),1
  Text x,y,Chr$(33+Rnd*90)
  yp(i)=y0+fh
  If yp(i)>h Then yp(i)=-Rnd*h
 Next
 Pause 1
Loop
