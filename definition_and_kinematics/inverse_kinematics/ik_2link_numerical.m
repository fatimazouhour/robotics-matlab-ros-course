clear all
close all
clc


e2link = ETS2.Rz("q1")*ETS2.Tx(1)*ETS2.Rz("q2")*ETS2.Tx(1);

pdes = [1.2080 1.4397];

q = fminsearch(@(q) norm(se2(e2link.fkine(q)).trvec - pdes), [0 0])
rad2deg(q)

q2 = fminsearch(@(q) norm(se2(e2link.fkine(q)).trvec - pdes), [1 -1])
rad2deg(q2)

e2link.teach(q)