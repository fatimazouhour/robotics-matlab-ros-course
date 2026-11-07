clear all
close all
clc


a1=1;
a2=1;

e3D= ETS3.Rx('q1')*ETS3.Ry('q2')*ETS3.Tz(a1)*ETS3.Ry('q3')*...
    ETS3.Tz(a2)*ETS3.Rz('q4')*ETS3.Ry('q5')*ETS3.Rz('q6');

robot6dof= ets2rbt(e3D) % reusing the one made previosly
robot6dof.showdetails
