clear all
close all
clc

%jacboian used to map velocities

syms a1 a2 real
e2link= ETS2.Rz('q1')*ETS2.Tx(a1)*ETS2.Rz('q2')*ETS2.Tx(a2);

syms q1 q2 real
Te=e2link.fkine([q1 q2])

p=Te(1:2,3)
J=jacobian(p,[q1 q2])

%%
clear all
close all
clc

% we can also use the geometricJacobianFunction in matlab
[puma,conf]= loadrvcrobot('puma') 
J= puma.geometricJacobian(conf.qn,'link6')

irbt= interactiveRigidBodyTree(puma,Configuration=conf.qn)


%%
clear all
close all
clc

[puma,conf]= loadrvcrobot('puma') 

J=puma.geometricJacobian(conf.qr,"link6")
% such that conf.qr shows the pose where the robot is in a singularity

% i can also check the det of the jacobian matrix
det(J)  %if 0 , then singularity
rank(J)


% the fact that the robot is near a singularity means it needs a lot of
% effort to pull out the robot of that config and resume movements

%example q5= 5deg (near 0)
qns= conf.qr;
qns(5)= deg2rad(5)
J=puma.geometricJacobian(qns,'link6')


% move end eff 0.1m/s on the z axis

qd=inv(J)*[0 0 0 0 0 0.1]';  % high speed on 3rd joint (=9.85)
det(J) % det near 0

