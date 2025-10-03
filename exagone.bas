randomize timer
cls
dim x%(5),y%(5)
framebuffer create
framebuffer write f
do
cls
for j=0 to 240 step 40
s=int(rnd*2)
ode j,s
s=int(rnd*2)
even j,s
next
s=int(rnd*2)
ode 280,s
framebuffer copy f,n
if inkey$<>"" then end
loop
cls

sub ode m,s
for i=0 to 300 step 20
x%(0)=(10+i):y%(0)=(0+m)
x%(1)=(0+i):y%(1)=(10+m)
x%(2)=(0+i):y%(2)=(20+m)
x%(3)=(10+i):y%(3)=(30+m)
x%(4)=(20+i):y%(4)=(20+m)
x%(5)=(20+i):y%(5)=(10+m)
c=rgb(255*rnd,255*rnd,255*rnd)
if s mod 2 = 0 then
polygon 6,x%(),y%(),,c
else
polygon 6,x%(),y%()
endif
inc s
next
end sub

sub even m,s
for i=0 to 280 step 20
x%(0)=(20+i):y%(0)=(20+m)
x%(1)=(10+i):y%(1)=(30+m)
x%(2)=(10+i):y%(2)=(40+m)
x%(3)=(20+i):y%(3)=(50+m)
x%(4)=(30+i):y%(4)=(40+m)
x%(5)=(30+i):y%(5)=(30+m)
c=rgb(255*rnd,255*rnd,255*rnd)
if s mod 2 = 0 then
polygon 6,x%(),y%(),,c
else
polygon 6,x%(),y%()
endif
inc s
next
end sub
