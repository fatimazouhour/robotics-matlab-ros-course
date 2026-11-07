clear all
close all
clc

abb = loadrobot('abbIrb1600', 'DataFormat', 'row');

% same desired pose as the analytical example (ik_abb_robot.m)
T1 = trvec2tform([0.93 0 0.5])*eul2tform([0 pi/2 0]);

% numerical IK solver
abbIK   = inverseKinematics(RigidBodyTree=abb);
abbHome = abb.homeConfiguration;

% arguments: end-effector, desired pose, weights [orientation xyz, position xyz], initial guess
[q_sol_ns, sol_info] = abbIK("tool0", T1, ones(1,6), abbHome)
T3 = abb.getTransform(q_sol_ns, "tool0"); printtform(T3)
abb.show(q_sol_ns);

% a different initial guess gives a different solution (slide 34)
[q_sol_ns2, sol_info2] = abbIK("tool0", T1, ones(1,6), [0 0 0 pi 0 0])
T4 = abb.getTransform(q_sol_ns2, "tool0"); printtform(T4)
figure
abb.show(q_sol_ns2);