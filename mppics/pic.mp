input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[oneside]{article}
\usepackage{../paper}
\begin{document}
etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;
%filenametemplate "%j-%1c.svg";
outputformat := "eps";

beginfig(10) 
save u,p;
u:=1cm;
path p[];

z0=(3,1.5)*u;
z1=(1.8,2.4)*u;
z2=(0,-1)*u;
z3=(-.9,.7)*u;
z4=(-1.1,-.5)*u;

z.x=(-10,0)*u;
z.ll=(-2,-2)*u;
z.ul=(-2,3)*u;
z.lr=(3,-2)*u;
z.ur=(3,3)*u;

draw z0--z1--z2--z3--z4;
draw z1--z3;
draw z2--z4;

p1=z1{(z0-z1) rotated -90}..z3{(z2-z3) rotated -90}..z.x{left}..cycle;

p2=z2{(z1-z2) rotated 90}..z4{(z3-z4) rotated 90}..z.x{left}..cycle;

p0=z.ll--z.ul--z.ur--z.lr--cycle;

hatchfill p1  withcolor (87, 2mm, -.5bp);
draw p1;

hatchfill p2  withcolor (20, 2mm, -.5bp);
draw p2;


clip currentpicture to p0;

dOt z0,z1,z2,z3,z4;

whitelabel(btex $C_1$ etex, z.ul+(15,-15));
whitelabel(btex $C_2$ etex, z.ll+(15,15));

label.rt(btex $x$ etex, z0);
whitelabel.ulft(btex $x_1$ etex, z1);
whitelabel.llft(btex $y_1$ etex, z2);
whitelabel.ulft(btex $x_2$ etex, z3);
whitelabel.llft(btex $y_2$ etex, z4);
whitelabel.ulft(btex $r_1$ etex, .5[z1,z3]);
whitelabel.llft(btex $s_1$ etex, .5[z2,z4]);
label.lrt(btex $a_1$ etex, .5[z1,z2]);
label.lft(btex $a_2$ etex, .5[z3,z4]+(0,-2));
label.urt(btex $b_1$ etex, .5[z3,z2]);
endfig;

beginfig(20) 
save u,p;
u:=1.4cm;
path p[];

z.o=origin;
z.a=(0,1)*u;
z.b=z.a rotated 120;
z.c=z.a rotated -120;
z.shift= (3,0)*u;

draw z.a--z.o--z.b pensemibold;
draw z.o--z.c pensemibold;
draw z.a+z.shift--z.o+z.shift--z.b+z.shift pensemibold;
draw z.o+z.shift--z.c+z.shift pensemibold;

%Dot z.a,z.o,z.b,z.c,z.a+z.shift,z.o+z.shift,z.b+z.shift,z.c+z.shift;

label.bot(btex $S$ etex, z.o+(0,-5));
label.bot(btex $T$ etex, z.o+z.shift+(0,-5));

label.top(btex $a$ etex, z.a);
label.lft(btex $b$ etex, z.b);
label.rt(btex $c$ etex, z.c);

label.top(btex $x$ etex, z.a+z.shift);
label.lft(btex $y$ etex, z.b+z.shift);
label.rt(btex $z$ etex, z.c+z.shift);
endfig;

beginfig(30) 
save u,p,k;
u:=1.4cm;
k:=2**(-.5);
path p[];


z.o=origin;
z.a=(-1,0)*u;
z.b=-z.a;
z.x=z.a rotated 90;
z.y=-z.x;
z.shift= (3,0)*u;

picture pic;

pic:= image(
draw z.a--z.b pensemibold;
draw z.x--z.y pensemibold;
draw z.a+z.x--z.b+z.x--z.b+z.y--z.a+z.y--cycle dashed evenly;
drawarrow (.5*(1-k))[z.a,z.x]--(.5*(1+k))[z.a,z.x] pensemibold;
drawarrow (.5*(1-k))[z.b,z.y]--(.5*(1+k))[z.b,z.y] pensemibold;
);

draw pic;
draw pic shifted z.shift;
draw pic shifted (2*z.shift);

label.lft(btex $a$ etex, z.a);
label.lft(btex $b$ etex, z.a+z.shift);
label.lft(btex $b$ etex, z.a+2*z.shift);

label.rt(btex $c$ etex, z.b);
label.rt(btex $c$ etex, z.b+z.shift);
label.rt(btex $a$ etex, z.b+2*z.shift);

label.bot(btex $x$ etex, z.x);
label.bot(btex $y$ etex, z.x+z.shift);
label.bot(btex $y$ etex, z.x+2*z.shift);

label.top(btex $z$ etex, z.y);
label.top(btex $z$ etex, z.y+z.shift);
label.top(btex $x$ etex, z.y+2*z.shift);

label.llft(btex $C_1$ etex, .5[z.a,z.x]);
label.llft(btex $C_2$ etex, .5[z.a,z.x]+z.shift);
label.llft(btex $C_2$ etex, .5[z.a,z.x]+2*z.shift);

label.urt(btex $C_3$ etex, .5[z.b,z.y]);
label.urt(btex $C_3$ etex, .5[z.b,z.y]+z.shift);
label.urt(btex $C_1$ etex, .5[z.b,z.y]+2*z.shift);
endfig;

end
