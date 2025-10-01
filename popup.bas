' popup.bas
cls
gr=rgb(0,255,0)
bl=rgb(0,0,0)
sub mainwindow
print chr$(201);
print string$(38,205);
print chr$(187)
print chr$(186);
print string$(38,173);
print chr$(186);
print chr$(204);
print string$(38,205);
print chr$(185);
for i=0 to 20
print chr$(186);
print string$(38,chr$(177));
print chr$(186);
next
print chr$(200);
print string$(38,205);
print chr$(188)
text 160,13," POP UP ",ct
end sub
sub popup
rbox 50,100,220,100,6,gr,bl
line 52,101,268,101,3
text 160,120,"Did you mean dialog?",ct,4
text 115,162,"YES",ct,2
rbox 90,160,50,25,4,gr
text 205,162,"NO",ct,2
rbox 180,160,50,25,4,gr
end sub
sub yes
text 160,13," DIALOG RULES"+chr$(169)+" ",ct
rbox 90,160,50,25,4,gr,gr
text 115,162,"YES",ct,2,,bl,gr
rbox 180,160,50,25,4,gr,bl
text 205,162,"NO",ct,2
end sub
sub no
text 160,13," "+chr$(159)+" POPUP WINS "+chr$(159)+" ",ct
rbox 180,160,50,25,4,gr,gr
text 205,162,"NO",ct,2,,bl,gr
rbox 90,160,50,25,4,gr,bl
text 115,162,"YES",ct,2
end sub
sub hep
 rbox 100,260,120,22,5,gr,bl
 text 160,265,"Esc to quit.",ct
end sub
mainwindow
popup
do
 k$=inkey$
 if k$="s" then save image "popup.bmp"
 if k$="y" or k$="Y" or k$=chr$(130) then yes
 if k$="n" or k$="N" or k$=chr$(131) then no
 if k$<>"" then hep
 if k$=chr$(27) then cls :end
loop
