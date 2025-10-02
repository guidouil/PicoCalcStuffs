'win10
randomize timer
bl=rgb(135,206,235)
wh=rgb(white)
cls bl
dim x1%(3)=(60,160,160,60)
dim y1%(3)=(160,160,60,70)
polygon 4,x1%(),y1%(),bl,wh
dim x2%(3)=(60,160,160,60)
dim y2%(3)=(250,260,160,160)
polygon 4,x2%(),y2%(),bl,wh
dim x3%(3)=(160,260,260,160)
dim y3%(3)=(160,160,50,60)
polygon 4,x3%(),y3%(),bl,wh
dim x4%(3)=(160,260,260,160)
dim y4%(3)=(260,270,160,160)
polygon 4,x4%(),y4%(),bl,wh
do
s=rnd*180
circle 160,290,12,3,1,bl
for a=s+1 to s+280
arc 160,290,12,15,s,a,bl
next
for a=s+1 to s+280
arc 160,290,12,15,s,a,wh
next
loop until inkey$<>""
cls bl
text 61,120,"(",lm,3,2,wh,bl
text 40,118,":",lm,3,2,wh,bl
msg$="Your PC ran into"
text 40,160,msg$,lm,3,,wh,bl
msg$="a problem it"
text 40,190,msg$,lm,3,,wh,bl
msg$="couldn't handle."
text 40,220,msg$,lm,3,,wh,bl
msg$="Your PC is a PicoCalc and Guidouil"
text 40,290,msg$,lm,1,1,wh,bl
msg$="is having fun with MMBasic :)"
text 40,310,msg$,lm,1,1,wh,bl
do :loop until inkey$<>""
cls
