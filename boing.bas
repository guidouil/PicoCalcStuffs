' Boing Ball
option Explicit
option BASE 0

const W=320,H=320
const NU=12,NV=9
const NF=NU*(NV-1)
const FOVC=40,ZOFF=7.0
const SCL=12
const TILTZ=0.3

dim i,j,k,n,ip,jp,t
dim bx,by,vx,vy,ry,vr
dim th,ph,xx,yy,zz,zzm,sc,xz,yz
dim rad,rr,gg,bb,isRed,shade
dim ax3,ay3,az3,bx3,by3,bz3,nz
dim dx1,dx2,dx3,dy1,dy2
dim shx,shy,rxsh,rysh,ox,oy

' model
dim mx(NU-1,NV-1),my(NU-1,NV-1),mz(NU-1,NV-1)
' view
dim vx3(NU-1,NV-1),vy3(NU-1,NV-1),vz3(NU-1,NV-1)
' screen
dim sx(NU-1,NV-1),sy(NU-1,NV-1)
' faces
dim fi(NF-1),fj(NF-1),fz(NF-1),ord%(NF-1)
' poly
dim ax%(3),ay%(3)
dim fb_bg,fb_front,wallx0, wally0, wallx1, wally1, floorY

' motion
bx=W/2: by=H/2
vx=8.0: vy=4.7
rad = SCL*(FOVC/ZOFF)
vr=.35

' --- FB setup ---
framebuffer create
framebuffer write f

' --- sphere grid ---
for i=0 to NU-1
  th=2*pi*i/NU
  for j=0 to NV-1
    ph=pi*(j/(NV-1)-0.5)
    mx(i,j)=cos(ph)*cos(th)
    my(i,j)=sin(ph)
    mz(i,j)=cos(ph)*sin(th)
  next
next

n=0
for i=0 to NU-1
  for j=0 to NV-2
    fi(n)=i: fj(n)=j: ord%(n)=n: n=n+1
  next
next

do
  cls rgb(64,64,64)

  ' rotate+project (Y only)
  ry=ry+vr
  for i=0 to NU-1
    for j=0 to NV-1
      xx = mx(i,j)*cos(ry)-mz(i,j)*sin(ry)
      zz = mx(i,j)*sin(ry)+mz(i,j)*cos(ry)
      yy = my(i,j)
      xz = xx*cos(TILTZ) - yy*sin(TILTZ)
      yz = xx*sin(TILTZ) + yy*cos(TILTZ)
      xx = xz
      yy = yz
      vz3(i,j)=zz
      vx3(i,j)=xx
      vy3(i,j)=yy
      sc = FOVC/(zz+ZOFF)
      sx(i,j)=bx+xx*sc*SCL
      sy(i,j)=by+yy*sc*SCL
    next
  next

  ' depth per face
  for k=0 to NF-1
    i=fi(k): j=fj(k)
    ip=(i+1) mod NU: jp=j+1
    fz(k)=(vz3(i,j)+vz3(ip,j)+vz3(ip,jp)+vz3(i,jp))/4
  next

  ' --- wall shadow behind ball
  ox=30 : oy=0
  shx= bx + ox
  shy= by + oy
  circle shx,shy,rad+4,1,1, rgb(0,0,0), rgb(0,0,0)

  ' draw visible faces only (cull)
  for k=0 to NF-1
    i=fi(ord%(k)): j=fj(ord%(k))
    ip=(i+1) mod NU: jp=j+1

    ax3 = vx3(ip,j)-vx3(i,j)
    ay3 = vy3(ip,j)-vy3(i,j)
    az3 = vz3(ip,j)-vz3(i,j)
    bx3 = vx3(i,jp)-vx3(i,j)
    by3 = vy3(i,jp)-vy3(i,j)
    bz3 = vz3(i,jp)-vz3(i,j)
    nz  = ax3*by3 - ay3*bx3
    if nz>0 then continue for

    ax%(0)=int(sx(i,j))  : ay%(0)=int(sy(i,j))
    ax%(1)=int(sx(ip,j)) : ay%(1)=int(sy(ip,j))
    ax%(2)=int(sx(ip,jp)): ay%(2)=int(sy(ip,jp))
    ax%(3)=int(sx(i,jp)) : ay%(3)=int(sy(i,jp))

    isRed=((i+j) and 1)=0

    if isRed then
      rr=255: gg=0: bb=0
    else
      rr=255: gg=255: bb=255
    endif

    ' seam/viewport guards to avoid popping
    dx1=abs(sx(ip,j)-sx(i,j))
    dx2=abs(sx(i,jp)-sx(i,j))
    dx3=abs(sx(ip,jp)-sx(i,j))
    if dx1>W/2 or dx2>W/2 or dx3>W/2 then continue for
    if ax%(0)<-32 or ax%(0)>W+32 then continue for
    if ax%(1)<-32 or ax%(1)>W+32 then continue for
    if ax%(2)<-32 or ax%(2)>W+32 then continue for
    if ax%(3)<-32 or ax%(3)>W+32 then continue for

    polygon 4,ax%(),ay%(),rgb(rr,gg,bb),rgb(rr,gg,bb)
  next

  ' bounce 320C320
  if bx<rad then vx=abs(vx):vr=abs(vr)
  if bx>W-rad then vx=-abs(vx):vr=-abs(vr)
  if by<rad then vy=abs(vy)
  if by>H-rad then vy=-abs(vy)
  bx=bx+vx: by=by+vy

  framebuffer copy f,n

loop until inkey$<>""
