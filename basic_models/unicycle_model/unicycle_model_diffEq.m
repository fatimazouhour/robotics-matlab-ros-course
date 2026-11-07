%% Unicycle model diff equations

clear all
close all
clc

tspan= 0:0.05:1;
initial_state =[0 0 0];

[t,q]= ode45(@unicycle,tspan,initial_state);

figure
plot(q(:,1),q(:,2)), grid on

function dq= unicycle(t,q)
    % vector definition
    x= q(1);
    y=q(2);
    theta=q(3);

    r=0.1; %radius of the wheel
    dphi=2; % wheel speed 

    v= r*dphi; %vehicle speed
    w=pi/4; % heading angular speed

    dq= [v*cos(theta);
        v*sin(theta);
        w];
end