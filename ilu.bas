cls :w=MM.HRES:h=MM.VRES
l=0:t=0:r=w-1:b=h-1:s=5
c=w/2
do
 line l,t,r,t,2
 l=l+s
 line r,t,r,b,2
 t=t+s
 if t>c then exit do
 line r,b,l,b,2
 r=r-s
 if r<c then exit do
 line l,b,l,t,2
 b=b-s
loop
do
 if inkey$="s" then
  save image "ilu.bmp"
 else
  if inkey$<>"" then end
 endif
loop
