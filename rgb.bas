start:
CLS RGB(0,0,0)
Font 1
Color RGB(0,255,0),RGB(0,0,0)
ask:
Input "Nb of squares/lines? [16] ",a$
If a$="" Then
 n=16
Else
 n=Val(a$)
 If n< 2 Or n > 320 Then
  Print "Min 2 & Max 320"
  GoTo ask
 EndIf
EndIf
w=320\n
h=320\n
For y=0 To n-1
 For x=0 To n-1
  r=Int(255*x/(n-1))
  g=Int(255*y/(n-1))
  b=Int(255*((x+y) Mod n)/(n-1))
  col=RGB(r,g,b)
  Box x*w, y*h, w,h,1,col,col
  If n<=16 Then
   Font 8
   fh=MM.Info(fontheight)
   Color RGB(255-r,255-g,255-b),RGB(r,g,b)
   Text x*w+1,y*w+1,Str$(r)
   Text x*w+1,y*w+fh+1,Str$(g)
   Text x*w+1,y*w+fh*2+1,Str$(b)
  EndIf
 Next x
Next y
Do
 If Inkey$ = "s" Then
  Save Image "rgb.bmp",0,0,319,319
  Color col,RGB(0,0,0)
  Font 5
  Text 80,250,"Saved!"
  Pause 500
  CLS RGB(0,0,0) :End
 Else
  If Inkey$="a" Then
   CLS RGB(0,0,0): GoTo start
  Else
   If Inkey$<>"" Then CLS RGB(0,0,0):End
  EndIf
 EndIf
Loop
