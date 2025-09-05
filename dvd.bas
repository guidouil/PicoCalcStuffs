'dvd.bas by Guidouil
CLS
Randomize Timer
w=MM.HRES:h=MM.VRES
bg=RGB(blue)
wh=RGB(white)
Dim colors(9)=(RGB(brown),RGB(blue),  RGB(pink),RGB(midgreen),RGB(green),  RGB(lilac),RGB(fuchsia),RGB(myrtle), RGB(cerulean),RGB(red))
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
x=Int(Rnd*w)
y=Int(Rnd*h)
dx=5:dy=4:sx=53:sz=27
Sub chbg()
 pickc: idx = Int(Rnd*10)
 If bg = colors(idx) GoTo pickc
 bg=colors(idx)
End Sub
Do
 If Inkey$<>"" Then CLS :End
 CLS RGB(0,0,0)
 RBox x+2,y+2,sx,sz,3,wh
 RBox x,y,sx,sz,3,bg,bg
 Text x+3,y+3,"DVD",,3,1,wh,bg
 x=x+dx:y=y+dy
 If x<0 Then x=0:dx=-dx:chbg()
 If y<0 Then y=0:dy=-dy:chbg()
 If x+sx>=w Then x=w-sx:dx=-dx:chbg()
 If y+sz>=h Then y=h-sz:dy=-dy:chbg()
 FRAMEBUFFER WAIT
 FRAMEBUFFER COPY F, N
Loop
