' keyb.bas - Keyboard testing
cls
framebuffer create
framebuffer write f
dim v0$(4)=("145","146","147","148","149")
dim l0$(4)=("F1","F2","F3","F4","F5")
dim v1$(4)=("27","9","","127","8")
dim l1$(4)=("Esc","Tab","Cap","Del","Bck")
dim l2$(6)=("`","/","\","-","=","[","]")
dim l3$(9)=("1","2","3","4","5","6","7","8","9","0")
dim l4$(9)=("Q","W","E","R","T","Y","U","I","O","P")
dim l5$(8)=("A","S","D","F","G","H","J","K","L")
dim l6$(8)=("Z","X","C","V","B","N","M",",",".")
dim l7$(1)=(";","'")
dim xl%(2)=(1,40,1)
dim yl%(2)=(86,119,150)
dim xr%(2)=(90,50,90)
dim yr%(2)=(86,119,150)
dim xu%(2)=(5,45,85)
dim yu%(2)=(82,115,82)
dim xd%(2)=(5,45,85)
dim yd%(2)=(156,122,156)
g=rgb(0,255,0)
b=rgb(0,0,0)
do
 k$=ucase$(inkey$)
 darrow 149,130,xl%(), yl%(),15,119,k$
 darrow 148,131,xr%(), yr%(),75,119,k$
 darrow 146,128,xu%(), yu%(),46,97,k$
 darrow 147,129,xd%(), yd%(),46,144,k$
 dtopline v0$(),l0$(),4,82,k$,96
 dtopline v1$(),l1$(),4,106,k$,96
 dline l2$(),6,130,k$,96
 dline l3$(),9,162,k$
 dline l4$(),9,194,k$
 dline l5$(),8,226,k$
 dline l6$(),8,258,k$
 dline l7$(),1,290,k$,200
 dkey "En",chr$(13),288,226,28,60,k$
 dkey "Space"," ",115,290,80,28,k$
 framebuffer copy f,n
 if k$=chr$(27) then cls : end
loop

sub dline a$(),l%,h%,k$,m%
 for i=0 to l%
  box i*32+m%,h%,28,28,1,g,b
  text i*32+5+m%,h%+3,a$(i),,3
  if k$=a$(i) then
   playkey asc(a$(i))
   box i*32+m%,h%,28,28,1,g,g
   text i*32+5+m%,h%+3,a$(i),,3,,b,g
  endif
 next
end sub

sub dtopline va$(),la$(),l%,h%,k$,m%
 for i=0 to l%
  box i*45+m%,h%,40,20,1,g,b
  text i*45+5+m%,h%+5,la$(i)
  if k$=chr$(val(va$(i))) then
   playkey asc(va$(i))
   box i*45+m%,h%,40,20,1,g,g
   text i*45+5+m%,h%+5,la$(i),,,,b,g
  endif
 next
end sub

sub dkey la$,va$,x%,y%,w%,h%,k$
 box x%,y%,w%,h%,1,g,b
 text x%+5,y%+5,la$
 if k$=va$ then
  playkey asc(va$)
  box x%,y%,w%,h%,1,g,g
  text x%+5,y%+5,la$,,,,b,g
 endif
end sub

sub darrow la%,va%,xx%(),yy%(),x%,y%,k$
 polygon 3,xx%(),yy%(),g,b
 text x%,y%,chr$(la%),cm,1,2
 if k$=chr$(va%) then
  playkey va%
  polygon 3,xx%(),yy%(),g,g
  text x%,y%,chr$(la%),cm,1,2,b,g
 endif
end sub

sub playkey t%
 t%=t%*12
 play tone t%,t%,100
end sub
