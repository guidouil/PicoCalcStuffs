' Starfield like win95 on PicoCalc
w=MM.HRES
h=MM.VRES
framebuffer create
framebuffer write f
cx=w/2
cy=h/2
n=100+asc("*") 'The Answer
speed=.2
dim x(n),y(n),z(n)
for i=0 to n
 one
next i
do
 k$=inkey$
 if k$=chr$(27) then end
 if k$=chr$(128) then speed=speed+.1
 if k$=chr$(129) then speed=speed-.1
 cls
 for i=0 to n
  z(i)=z(i)-speed
  if z(i)<=.1 then one
  sx=int(cx+x(i)/z(i))
  sy=int(cy+y(i)/z(i))
  if sx<0 or sx>=w or sy<0 then   continue for
  if sy>=h then continue for
  c=rgb(255,255,255)
  s=.5+int((10-z(i))*.12)
  circle sx,sy,s,,,c,c
 next i
 framebuffer copy f,n
loop
sub one
 x(i)=(rnd*2-1)*w
 y(i)=(rnd*2-1)*h
 z(i)=rnd*9+1
end sub
