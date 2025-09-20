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
dim xl%(2)=(10,52,10)
dim yl%(2)=(90,127,164)
dim xr%(2)=(94,52,94)
dim yr%(2)=(90,127,164)
dim xu%(2)=(10,52,94)
dim yu%(2)=(90,127,90)
dim xd%(2)=(10,52,94)
dim yd%(2)=(164,127,164)
g=rgb(0,255,0)
b=rgb(0,0,0)
do
 k$=ucase$(inkey$)
 darrow 149,130,xl%(), yl%(),25,127,k$
 darrow 148,131,xr%(), yr%(),80,127,k$
 darrow 146,128,xu%(), yu%(),52,108,k$
 darrow 147,129,xd%(), yd%(),52,150,k$
 dtopline v0$(),l0$(),4,90,k$,90
 dtopline v1$(),l1$(),4,115,k$,90
 dline l2$(),6,140,k$,90
 dline l3$(),9,170,k$
 dline l4$(),9,200,k$
 dline l5$(),8,230,k$
 dline l6$(),8,260,k$
 dline l7$(),1,290,k$,200
 dkey "En",chr$(13),280,230,25,55,k$
 dkey "Space"," ",120,290,80,25,k$
 framebuffer copy f,n
 if k$=chr$(27) then cls : end
loop

sub dline a$(),l%,h%,k$,m%
 for i=0 to l%
  box i*30+10+m%,h%,25,25,1,g,b
  text i*30+15+m%,h%+5,a$(i)
  if k$=a$(i) then
   box i*30+10+m%,h%,25,25,1,g,g
   text i*30+15+m%,h%+5,a$(i),,,,b,g
  endif
 next
end sub

sub dtopline va$(),la$(),l%,h%,k$,m%
 for i=0 to l%
  box i*42+10+m%,h%,36,20,1,g,b
  text i*42+15+m%,h%+5,la$(i)
  if k$=chr$(val(va$(i))) then
   box i*42+10+m%,h%,36,20,1,g,g
   text i*42+15+m%,h%+5,la$(i),,,,b,g
  endif
 next
end sub

sub dkey la$,va$,x%,y%,w%,h%,k$
 box x%,y%,w%,h%,1,g,b
 text x%+5,y%+5,la$
 if k$=va$ then
  box x%,y%,w%,h%,1,g,g
  text x%+5,y%+5,la$,,,,b,g
 endif
end sub

sub darrow la%,va%,xx%(),yy%(),x%,y%,k$
 polygon 3,xx%(),yy%(),g,b
 text x%,y%,chr$(la%),cm,1,2
 if k$=chr$(va%) then
  polygon 3,xx%(),yy%(),g,g
  text x%,y%,chr$(la%),cm,1,2,b,g
 endif
end sub
