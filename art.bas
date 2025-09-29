randomize timer
w=MM.HRES:h=MM.VRES
dim stp%(7)=(8,16,32,40,64,80,160,320)
i=3
framebuffer create
framebuffer write f
b=rgb(0,0,0)
do
 st=stp%(i)
 cls
 for x=0 to w-1 step st
  for y=0 to w-1 step st
   c=rgb(rnd*255,rnd*255,rnd*255)
   box x,y,st,st,1,c,c
   r=sqr(st)/2:st2=(st/2)-r
   v=st2+rnd*(st2+r)
   v2=st2+rnd*(st2+r)
   triangle x,y,x+v,y,x,y+v2,b,b
   triangle x+st,y,x+st-v2,y,x+st,y+v,b,b
   triangle x+st,y+st,x+st-v,y+st,x+st,y+st-v2,b,b
  triangle x,y+st,x+v2,y+st,x,y+st-v,b,b
  next
 next
 framebuffer copy f,n:pause 10
 k$=inkey$
 if k$=chr$(27) then end
 if k$=chr$(128) and i<7 then i=i+1
 if k$=chr$(129) and i>0 then i=i-1
loop
