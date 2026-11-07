clear all
close all
clc

tspan=0:0.01:2;
initialState=[0 0 0];

[t,q]=ode45(@diffDrive, tspan, initialState);

figure
plot(q(:,1),q(:,2)), axis equal
grid on
title('trajectory of differential drive robot')
xlabel('x(t)')
ylabel('y(t)')

function dq = diffDrive (t, q)
    x=q(1);
    y=q(2);
    theta=q(3);
    
    r=1; %wheel radius
    d=2; %distance between the wheels
    
    dphi_L= 0; %left wheel's speed
    dphi_R= 10; %right wheel's speed
     
    v=r*(dphi_R+dphi_L)/2; %heading linear speed
    w=r*(dphi_R-dphi_L)/d; %heading angular speed
    
    dq = [cos(theta) 0; sin(theta) 0; 0 1]*[v;w];
end