' PicoCalc MOD Player by @Guidouil
dim fname$(128,2)
fcount=0
sel=0:wl=15:id=0
black=rgb(0,0,0)
w=MM.HRES
h=MM.VRES
green=rgb(0,255,0)
grey=rgb(80,80,80)

function fsz(f$)
 if dir$(f$)="" then
  fsz=0
  exit function
 endif
 open f$ for input as #1
  fsz=lof(#1)
 close #1
end function

chdir "modfiles"
listfiles()
filesview()

sub listfiles()
'list mod files & size
file$=dir$("*.mod",FILE)
do while file$ <> "" and fcount<128
 if left$(file$,1) <> "." then
  fname$(fcount,0)=file$
  fcount=fcount+1
 endif
 file$=dir$()
loop
if fcount>0 then
 for i=0 to fcount-1
  sz=int(fsz(fname$(i,0))/1024)
  fname$(i,1)=str$(sz)
 next i
endif
end sub

sub filesview()
cls black


if fcount=0 then
 cls green
 color black,green
 font 8,4
 text 160,160,"404: NO MOD FOUND",c
 do
  if inkey$<>"" then cls :end
 loop
else
'show mod files
do
 'window
font 8,4
fht=mm.info(fontheight)
box 0,0,w,fht+10,2,green,grey
color green,grey
text w/2,6,"PicoCalc MOD Player",c
box 0,fht+10,w,h,1,green
font 8,2
color black,green
box 0,h-13,w,13,1,green,green
text w/2,h-11,"ESC : Quit       ENTER or RIGHT : Play",c
 k$=inkey$
 ' ESC
 if k$=chr$(27) or k$="q" then
  chdir ".."
  cls black
  end
 endif
 if fcount<wl then wl=fcount
 for i=id to wl+id
  if (fname$(i,0)<>"") then
  font 7,2
  fh=mm.info(fontheight)
  color green,black
  if i=sel then
   color black,green
  end if
  sho$=fname$(i,0)
  if len(sho$)>22 then
   sho$=left$(sho$,22)
  endif
  text 2,(i-id)*(fh+1)+36,sho$
  text 318,(i-id)*(fh+1)+36,fname$(i,1)+"K",r
 endif
 next i
 ' DOWN
 if k$=chr$(129) and sel<(fcount-1) then
  sel=sel+1
  if sel>wl then
   id=id+1
   box 0,toph,w,h,1,green,black
  endif
 endif
 ' UP
 if k$=chr$(128) and sel>0 then
  sel=sel-1
  if sel<id then
   id=id-1
   box 0,toph,w,h,1,green,black
  endif
 endif
 ' ENTER or RIGHT
 if k$=chr$(13) or k$=chr$(131) then
  playerview(fname$(sel,0), fname$(sel,1))
 endif

loop
end if
end sub ' filesview end

sub playerview(f$,s$)
 if val(s$)>192 then
  cls green
  color black,green
  font 7,3
  text 160,140,s$+"K > 192K",c
  text 160,180,"FILE TOO BIG ",c
  pause 1500
  filesview()
 endif
 ' now playing
 mute(0)
 play modfile f$
 timer =0
 playing=1
 cls black
 font 8,3
 color green,black
 text 160,10,"Now Playing:",c
 font 7,2
 text 160,30,f$+" "+s$+"K",c
 font 7,1
 fh=mm.info(fontheight)
 box 60,70,200,fh*6,1,green
 text 66,75,"ESC or LEFT : Back To List"
 text 66,85,"ENTER : Play / Pause"
 text 66,95,"MINUS (-) : Mute / Unmute"
 text 66,105,"Keys 1 to C : Sample 1 to 32"
 showbat()
 do
  if playing=1 then
   font 7,2
   text 160,50,str$(int(timer/1000))+"s",c
  endif
  k$=inkey$
  ' ESC or LEFT
  if k$=chr$(27) or k$=chr$(130) then
   play stop
   filesview()
  endif
  ' ENTER
  if k$=chr$(13) then
   font 7,1
   fh=mm.info(fontheight)
   if playing=1 then
    p=timer
    play pause
    playing=0
    text w,h-fh,"PAUSE",r
   else
    timer =p
    play resume
    playing=1
    text w,h-fh,"     ",r
   endif
  endif
  ' - minus
  if k$=chr$(45) then
   if muted = 0 then
    mute(1)
   else
    mute(0)
   endif
  endif
  ' play samples
  if playing=1 then
   if k$="1" then playsamp(1,1,"1")
   if k$="2" then playsamp(2,2,"2")
   if k$="3" then playsamp(3,3,"3")
   if k$="4" then playsamp(4,4,"4")
   if k$="5" then playsamp(5,1,"5")
   if k$="6" then playsamp(6,2,"6")
   if k$="7" then playsamp(7,3,"7")
   if k$="8" then playsamp(8,4,"8")
   if k$="9" then playsamp(9,1,"9")
   if k$="0" then playsamp(10,3,"0")
   if k$="q" then playsamp(11,4,"Q")
   if k$="w" then playsamp(12,1,"W")
   if k$="e" then playsamp(13,2,"E")
   if k$="r" then playsamp(14,3,"R")
   if k$="t" then playsamp(15,4,"T")
   if k$="y" then playsamp(16,1,"Y")
   if k$="u" then playsamp(17,2,"U")
   if k$="i" then playsamp(18,3,"I")
   if k$="o" then playsamp(19,4,"O")
   if k$="p" then playsamp(20,1,"P")
   if k$="a" then playsamp(21,2,"A")
   if k$="s" then playsamp(22,3,"S")
   if k$="d" then playsamp(23,4,"D")
   if k$="f" then playsamp(24,1,"F")
   if k$="g" then playsamp(25,2,"G")
   if k$="h" then playsamp(26,3,"H")
   if k$="j" then playsamp(27,4,"J")
   if k$="k" then playsamp(28,1,"K")
   if k$="l" then playsamp(29,2,"L")
   if k$="z" then playsamp(30,3,"Z")
   if k$="x" then playsamp(31,4,"X")
   if k$="c" then playsamp(32,1,"C")
  endif
 loop
end sub

sub playsamp(sp%,ch%,key$)
 muting=0
 if muted=1 then mute(0):muting=1
 play modsample sp%,ch%,64
 font 5,6
 fh=mm.info(fontheight)
 text w/2,h-fh,key$,c
 pause 250
 text w/2,h-fh,"  ",c
 if muting=1 then pause 250:mute(1)
 showbat()
end sub

sub mute(state)
 font 7,1
 fh=mm.info(fontheight)
 if state=0 then
  play volume 100,100
  muted=0
  text 0,h-fh,"    "
 else
  play volume 0,0
  muted=1
  text 0,h-fh,"MUTE"
 endif
end sub

sub showbat()
 font 7,1
 bat$=str$(mm.info(battery))+"%"
 text w,0,bat$,r
end sub
