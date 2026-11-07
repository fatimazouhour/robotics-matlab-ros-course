clear all
close all
clc

theta= pi/2;
Rx= [1 0 0;
    0 cos(theta) -sin(theta);
    0 sin(theta) cos(theta)];

Ry= [cos(theta) 0 sin(theta);
    0 1 0;
    -sin(theta) 0 cos(theta)];
Rz=[cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1];

tver=[1 2 3]; %translation vector [x y z]

T=rotm2tform(Rx)*trvec2tform(tver)