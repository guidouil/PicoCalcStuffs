'w95.bas
play wav "w95.wav"
bl=rgb(20,56,139)
wh=rgb(255,255,255)
gr=rgb(196,196,196)
g=rgb(0,127,127)
b=rgb(0,0,0)
for i=0 to 16
 cls gr:cls b:cls gr
next i
for j=0 to 16
 cls g:cls gr:cls g
next j
cls bl
font 2
color bl,wh
text 110,70," Windows "
font 7
color wh,bl
text 10,110,"Am error has occured. To continue:"
text 10,130,"Press Enter to return to Windows, or"
text 10,150,"Press CTL+ALT+DEL to restart your computer. If you"
text 10,160,"do this, you will lose any unsaved information"
text 10,170,"in all open applications."
text 10,190,"Error: OE : 016F : BFF983D4"
text 90,220,"Press any key to continue"
do
 if inkey$<>"" then turnoff()
 line 245,226,250,226,,wh
 pause 500
 line 245,226,250,226,,bl
 pause 500
loop

sub turnoff()
 cls b
 font 2,3
 color rgb(226,118,64),b
 text 10,10,"It's now"
 text 25,70,"safe to"
 text 10,130,"turn off"
 text 90,190,"your"
 text 5,250,"computer."
 do
  if inkey$<>"" then cls b:end
 loop
end sub
