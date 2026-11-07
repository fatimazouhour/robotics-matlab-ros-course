clear all
close all
clc

tspan= 0:0.01:1;
initial_state= [0,0,0];

[t,q] = ode45(@bicycle, tspan, initial_state);


figure
plot(q(:,1),q(:,2)), 
axis equal,grid on, zoom on
title('2D trajectory of Bicycle model')
xlabel('x(t)')
ylabel('y(t)')

function dq = bicycle(t, q)
    x = q(1);
    y = q(2);
    theta = q(3);

    l = 0.1; % wheelbase L
    phi = 0.3; % steering angle
    v = 2; % vehicle speed

    w = v*tan(phi)/l; % heading angular speed
    dq = [v*cos(theta); v*sin(theta); w];
end