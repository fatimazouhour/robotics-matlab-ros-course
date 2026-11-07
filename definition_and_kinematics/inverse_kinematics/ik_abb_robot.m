clear all
close all
clc

abb= loadrobot('abbIrb1600','DataFormat','row')
abb.show
abb.showdetails

%Only because it has a spherical wrist, it is possible to have an
%analytical inverse kinematics

aIK=analyticalInverseKinematics(abb)
aIK.showdetails


%it has two groups because the tool is connected to Link6, but with a
%different orientation. If not specified for the computation of the IK, the
%algorithm takes the last part of the body tree, in this case, tool0

abb.getBody("tool0").Joint.Type
T=abb.getBody("tool0").Joint.JointToParentTransform;
printtform(T)


% we create a function handle for the inverse kinematics
abbIKFcn = aIK.generateIKFunction("ikIRB1600")
des_pose=trvec2tform([0.93 0 0.5])*eul2tform([0 pi/2 0])

qsol_cs=abbIKFcn(des_pose)

q_sol1=qsol_cs(1,:)
q_sol2=qsol_cs(2,:)


abb.show(q_sol1)
figure
abb.show(q_sol2)

%verifying the results

T1=abb.getTransform(q_sol1,"tool0"); printtform(T1)
T2=abb.getTransform(q_sol2,"tool0"); printtform(T2)