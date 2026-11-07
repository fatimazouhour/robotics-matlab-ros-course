clear all
close all
clc

format compact
% analytic solution 

syms a1 a2 real

e2link= ETS2.Rz('q1')*ETS2.Tx(a1)*...
    ETS2.Rz('q2')*ETS2.Tx(a2);

syms q1 q2 real

%compute the FK for a generic q1 and q2
Te=e2link.fkine([q1 q2])
trans_v= Te(1:2,3)';   % gives exact possition of the end effector

%know i define the system of equations and try to solve q1 and q2
% to reach a desired X and Y

syms x y real

e1 = x == trans_v(1)  %setting desired position
e2 = y == trans_v(2)

[s1,s2]=solve([e1 e2],[q1 q2])
size(s1) %we have multiple solutions to reach one position 
size(s2) 

% trying now to verify at q=(30 40)deg ,x=1.21 , y=1.44

x_v=1.21;
y_v=1.44;

q1v=30;
q2v= 40;

xdes= eval(subs(trans_v(1),[a1 a2 q1 q2],[1 1 deg2rad(q1v) deg2rad(q2v)]))
ydes=eval(subs(trans_v(2),[a1 a2 q1 q2],[1 1 deg2rad(q1v) deg2rad(q2v)]))

sol1_q1= rad2deg(eval(subs(s1(1),[a1 a2 x y],[1 1 xdes ydes])))
sol2_q1=rad2deg(eval(subs(s1(2),[a1 a2 x y],[1 1 xdes ydes])))

sol1_q2=rad2deg(eval(subs(s2(1),[a1 a2 x y],[1 1 xdes ydes])))
sol2_q2=rad2deg(eval(subs(s2(2),[a1 a2 x y],[1 1 xdes ydes])))

q_sol1=[sol1_q1 sol1_q2];
q_sol2=[sol2_q1 sol2_q2];

clear a1 a2 q1 q2 e2link
e2link = ETS2.Rz("q1")*ETS2.Tx(1)*ETS2.Rz("q2")*ETS2.Tx(1);
e2link.teach;
