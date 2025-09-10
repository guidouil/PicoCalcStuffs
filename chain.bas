' chain.bas
' Copied from javavi@thebackshed.com
' "Adapted" to PicoCalc by Gudouil
option angle degrees
cls
r=60:p=18:g=r+p
for w=0 to 420 step 93
 s=sin(w+33)
 c=cos(w+33)
 for x=0 to g
  f=x
  if f<r-p then f=r-p
  for i=0 to 60
   k=f+i*(g-f)/60
   z=s*sqr(p*p-(k-r)*(k-r))
   y=c*sqr(k*k-x*x)
   for m=-1 to 1 step 2
    for n=-1 to 1 step 2
     for o=-1 to 1 step 2
      a=m*x+w*.85
      b=n*y+o*z+160
   j=(7*(a mod 4)+5*(b mod 4)) mod 16
      if (n*Y*s/c-o*c/s)+g>19*j then
       pixel a,b ',rgb(255,215,0)
      endif
     next
    next
   next
  next
 next
next
' that was a pain to copy ^_^;
line 0,0,0,320,1,rgb(0,0,0)
line 320,0,320,320,1,rgb(0,0,0)
do
 ki$=inkey$
 if ki$="s" then
  save image "chain.bmp"
 else
  if ki$<>"" then cls :end
 endif
loop
