clear all
close all
clc

% compute using pinv command

%robot definition
a1=1; a2=1;
e2link = ETS2.Rz("q1")*ETS2.Tx(a1)*ETS2.Rz("q2")*ETS2.Tx(a2);

%set current joint angles
qn= [1 1];

%calculate the jacobian at those angles
J=e2link.jacob0(qn)
rank(J)

%define desired velocities
xd_des=[0 0.1 0.2]'; 

%calculate the joint vel using pseudoinv
qd = pinv(J)*xd_des

%vel robot can produce with qd
v = J*qd 
error = norm(xd_des - v)

% controlling only some vel
Jyw=J(2:3,:);

qd = inv(Jyw)*xd_des(2:3);

%check again
v = J*qd
error=norm(xd_des-v) 