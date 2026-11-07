clear all
close all
clc

[puma,conf]= loadrvcrobot('puma')
puma.show(conf.qn);

qd=zeros(1,6);

% given a set of pos, vel, acc we obtain torques needed to keep the robot
% in that pos
Q=puma.inverseDynamics(conf.qn,qd,qd)


% to experiment , a possible modification to parameters can be done:

% inspect
puma.Bodies{2} 

%to change one one the params
%puma.Bodies{n}.paramName

puma.Bodies{2}.Mass=20 % now it overwrites

g=puma.gravityTorque(conf.qn)  

puma.Gravity %check current

puma.Gravity= puma.Gravity/6 %e.g moon gravity /6

puma.Gravity=[0 0 -9.81] %restore

%inertia matrix (symmetric, positive definite)
M = puma.massMatrix(conf.qn)

%Coriolis matrix, joint 3 moving at 1 rad/s
qd = [0 0 1 0 0 0];
C  = puma.coriolisMatrix(conf.qn, qd)
puma.velocityProduct(conf.qn, qd)

