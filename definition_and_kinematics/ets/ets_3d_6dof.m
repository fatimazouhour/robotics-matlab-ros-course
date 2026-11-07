clear all
close all
clc


a1=1;
a2=1;

e3D= ETS3.Rx('q1')*ETS3.Ry('q2')*ETS3.Tz(a1)*ETS3.Ry('q3')*...
    ETS3.Tz(a2)*ETS3.Rz('q4')*ETS3.Ry('q5')*ETS3.Rz('q6');

e3D.njoints
e3D.structure   % gives the type of joints e.g revolute or prismatic

e3D.teach;