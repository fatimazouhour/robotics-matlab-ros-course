close all
clear all
clc

unicycle_mod= unicycleKinematics;
unicycle_mod.VehicleInputs= 'VehicleSpeedHeadingRate';

tspan = 0:0.5:1;
initial_state= [0 0 0];  %[x y theta] 
input = [2 pi/4]; %[v w]

[t,q_unicycle] = ode45(@(t,q_unicycle)derivative(unicycle_mod, ...
    q_unicycle,input),tspan,initial_state)

figure
plot(q_unicycle(:,1),q_unicycle(:,2)) , grid on, zoom on
title('2D trajectory of unicycle model')
xlabel('x(t)')
ylabel('y(t)')