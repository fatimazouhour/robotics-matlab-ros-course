clear all
close all
clc

Km = 0.228; %  mototr torque
Jm = 200e-6; % motor inertia
Bm = 817e-6; %  viscous friction
G = 107.815; %  gear ratio
tau_max = 0.9; % maximum torque
qd_max = 165; %  max speed

Gmotor=tf(Km,[Jm Bm]);

rlocus(Gmotor) 
rltool(Gmotor)  %interactive

OS   = 0.02;
zeta = -log(OS)/sqrt(pi^2 + log(OS)^2);
wn   = 5;
Kp = (2*zeta*wn*Jm - Bm)/Km
Ki = wn^2*Jm/Km

C = pid(Kp, Ki);
T = feedback(C*Gmotor, 1);
figure, step(T), grid on
stepinfo(T)