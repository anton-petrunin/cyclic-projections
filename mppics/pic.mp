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


end
