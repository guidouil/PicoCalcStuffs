' PicoPaint
cls
black=rgb(0,0,0)
white=rgb(255,255,255)
green=rgb(0,255,0)
'w=16:b=19 '20x20
w=8:b=39   '40x40
x=0:y=0:dim d%(b,b)
for i=0 to b
for j=0 to b
d%(i,j)=0
next
next
framebuffer create
framebuffer write f
sub cel l,c,cc
 box l*w,c*w,w,w,0,black,cc
end sub
sub ds d%()
 for xx=0 to b
  for yy=0 to b
   col%=d%(xx,yy)
   if col%<>0 then cel xx,yy,col%
  next yy
 next xx
end sub
do
 cls
 ds d%()
 cel x,y,green
 k$=inkey$
 if k$=chr$(27) then cls :end 'esc
 if k$=chr$(128) and y>0 then y=y-1
 if k$=chr$(129) and y<b then y=y+1
 if k$=chr$(130) and x>0 then x=x-1
 if k$=chr$(131) and x<b then x=x+1
 if k$=chr$(127) or k$=chr$(8) or k$="0" then d%(x,y)=rgb(black)
 if k$="w" or k$="9" or k$=chr$(13) then d%(x,y)=rgb(white)
 if k$="r" or k$="1" then d%(x,y)=rgb(red)
 if k$="g" or k$="2" then d%(x,y)=rgb(green)
 if k$="b" or k$="3" then d%(x,y)=rgb(blue)
 if k$="y" or k$="4" then d%(x,y)=rgb(yellow)
 if k$="c" or k$="5" then d%(x,y)=rgb(cyan)
 if k$="l" or k$="6" then d%(x,y)=rgb(lilac)
 if k$="C" or k$="7" then d%(x,y)=rgb(cerulean)
 if k$="m" or k$="8" then d%(x,y)=rgb(midgreen)
 if k$="f" then d%(x,y)=rgb(fuchsia)
 if k$="M" then d%(x,y)=rgb(magenta)
 if k$="s" or k$="S" then save image "paint.bmp"
 framebuffer copy f,n
loop
