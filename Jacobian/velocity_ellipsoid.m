% Velocity ellipsoid and manipulbility

clear all
close all
clc 

% defining the robot
planar2=ETS2.Rz("q1")*ETS2.Tx(1)*ETS2.Rz("q2")*ETS2.Tx(1);
planar2.teach(deg2rad([30 40]),'vellipse')

% reminder from course 

%bigger ellipse = more ability to more along x and y axis
%more flatted ellipse= inability to move to along the axis

%for a 3d robot we should see a sphere when the robot is not in a sing
%config

[puma,conf]= loadrvcrobot('puma') 

J=puma.geometricJacobian(conf.qn,"link6")

Jt=J(4:6,:); % translational vel ellpsoid
Et=inv(Jt*Jt')
plotellipsoid(Et)

Jr=J(1:3,:) % rotational vel ellipsoid
Er=inv(Jr*Jr')
plotellipsoid(Er)
