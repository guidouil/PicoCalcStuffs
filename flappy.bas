' Flappy Bird clone PicoMite/WebMite
' SPACE/W flap, Q quit, R reset

randomize timer
cls rgb(0,0,0)
framebuffer create
framebuffer write f

dim px(3)
dim gy(3)
dim hit(3)

gosub INIT
gosub BG
gosub HUD
framebuffer copy f,n

do
 k$=inkey$
 if k$="q" then end
 if st=0 then
  if k$<>"" then st=1
  gosub HUD
  pause 10
  goto NXT
 endif
 if k$=" " or k$="w" or k$=chr$(128) then
  vy=fp
  'play TONE 1200,1200,40
 endif
 vy=vy+gr
 by=by+vy
 for i=1 to np
  px(i)=px(i)-spd
  if px(i)+pw<0 then gosub NP
 next i
 gosub CHK
 framebuffer copy f,n
 gosub DRAW
 framebuffer copy f,n
 pause 15
NXT:
loop

end

INIT:
' vars
bx=60
by=160
vy=0
fp=-4.6
gr=0.35
spd=2.5
pw=26
gp=74
np=3
sc=0
st=0
' colors
sk=rgb(80,170,255)
gr1=rgb(240,180,60)
gr2=rgb(255,220,90)
pc=rgb(0,200,100)
pb=rgb(0,110,60)
bd=rgb(255,230,90)
blk=rgb(0,0,0)
wht=rgb(255,255,255)
oc=rgb(255,120,60)
' pipes
for i=1 to np
 px(i)=320+(i-1)*140
 gy(i)=40+int(rnd*200)
 hit(i)=0
next i
return

BG:
' sky
box 0,0,320,300,0,sk,sk
' ground
box 0,300,320,20,0,gr1,gr1
for x=0 to 319 step 8
 line x,300,x+4,300,3,gr2
next x
return

HUD:
' overlay top
box 0,0,320,14,0,blk,blk
if st=0 then
 text 160,7,"FLAPPY CALC",CM,2
 text 160,24,"Press any key",CM,1
elseif st=2 then
 text 160,7,"GAME OVER",CM,2
 text 160,24,"R to retry",CM,1
else
 text 8,7,str$(sc),LM,2
endif
return

NP:
' new pipe for i
px(i)=px(i)+np*140
 gy(i)=40+int(rnd*200)
 hit(i)=0
return

DRAW:
cls
gosub BG
for i=1 to np
 t=gy(i)-int(gp/2)
 b=gy(i)+int(gp/2)
 box px(i),0,pw,t,1,pb,pc
 box px(i),b,pw,300-b,1,pb,pc
 box px(i)-2,t-8,pw+4,8,1,pb,bd
 box px(i)-2,b,pw+4,8,1,pb,bd
next i
x=bx
y=int(by)
box x-6,y-4,12,8,1,blk,bd
circle x+2,y-1,2,1,1,blk,wht
line x+5,y-1,x+8,y,1,oc
gosub HUD
return

CHK:
if by<0 or by>300 then
 st=2
 play TONE 220,220,300
 do
  k$=inkey$
  if k$="r" or k$="R" then
   gosub INIT
   st=1
   exit do
  endif
  if k$="q" then end
 loop
endif
for i=1 to np
 if bx>px(i)+pw and hit(i)=0 then
  sc=sc+1
  hit(i)=1
  play TONE 900,900,60
 endif
 if bx>px(i)+pw+5 then hit(i)=0
 t=gy(i)-int(gp/2)
 b=gy(i)+int(gp/2)
 if bx+6>=px(i) then
  if bx-6<=px(i)+pw then
   if by-4<=t or by+4>=b then
    st=2
    play TONE 180,180,250
   endif
  endif
 endif
next i
return
