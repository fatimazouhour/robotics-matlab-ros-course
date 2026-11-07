clear all
close all
clc

a1= 1;
a2=1;

e2link=ETS2.Rz('q1')*ETS2.Tx(a1)*ETS2.Rz('q2')*ETS2.Tx(a2);
T= e2link.fkine(deg2rad([30 40]))
printtform2d(se2(T),unit='deg')

e2link.teach % can use the gui to se