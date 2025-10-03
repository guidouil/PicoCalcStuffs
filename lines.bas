' lines.bas
w=MM.HRES:do
 for i=16 to 2 step -1:cls
  for j=0 to w step i
   line j,0,w-j,w:line 0,w-j,w,j
   if inkey$<>"" then cls :end
  next :pause w
 next :pause 1337
loop
