' weed.bas
cls
const FG=rgb(20,140,40)
const ST=rgb(90,160,30)
x=MM.HRES/2
y=MM.VRES*0.62
box x-2,y,4,20,2,ST,ST
leaf -90,x,y,-0.8
leaf -60,x,y,-1.2
leaf -30,x,y,-1.6
leaf   0,x,y,-2
leaf  30,x,y,-1.6
leaf  60,x,y,-1.2
leaf  90,x,y,-0.8
text 160,240,"420",ct,7,10,FG

sub leaf a,cx,cy,s
 local x%(5),y%(5),tx%(5),ty%(5)
 local i,ca,sa,bx,by
 ca=cos(rad(a))
 sa=sin(rad(a))
 x%(0)=0    :y%(0)=0
 x%(1)=10*s :y%(1)=24*s
 x%(2)=0    :y%(2)=96*s
 x%(3)=-10*s:y%(3)=24*s
 x%(4)=0    :y%(4)=0
 for i=0 to 4
  bx=x%(i) : by=y%(i)
  tx%(i)=cx+cint(bx*ca-by*sa)
  ty%(i)=cy+cint(bx*sa+by*ca)
 next i
 polygon 5,tx%(),ty%(),ST,FG
end sub

do :loop until inkey$<>""
