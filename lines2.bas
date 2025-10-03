' lines2.bas
framebuffer create
framebuffer write f
cls :w=MM.HRES:s=0:stp=-pi
do
 for j=w to 0 step stp
  if s=0 then cls
  for i=0 to w step j
   if i>0 then
    line i,0,w,i
    line w,i,w-i,w
    line w-i,w,0,w-i
    line 0,w-i,i,0
    line i/2,w/2,w/2,w/2-i/2
    line w/2,w/2-i/2,w-i/2,w/2
    line i/2,w/2,w/2,w/2+i/2
    line w/2,w/2+i/2,w-i/2,w/2
   endif
   if inkey$<>"" then cls :end
  next i :framebuffer copy f,n
 next j
 if s=0 then
  colour rgb(black):stp=-pi*.8:s=1
 else
  colour rgb(green):stp=-pi:s=0:cls
 endif
loop
