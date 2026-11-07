clear all
close all
clc

% dh params in order : a, alpha, d, theta
dhparams = [0       pi/2   0       0;
            0.4318  0      0       0;
            0.0203 -pi/2   0.15005 0;
            0       pi/2   0.4318  0;
            0      -pi/2   0       0;
            0       0      0       0];

robotPuma560 = rigidBodyTree(DataFormat="row");

bodies = cell(6,1);
joints = cell(6,1);

for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)], "revolute");
    setFixedTransform(joints{i}, dhparams(i,:), "dh");
    bodies{i}.Joint = joints{i};

    if i == 1 % first body attached to the base
        addBody(robotPuma560, bodies{i}, "base")
    else      % the others attached to the previous body
        addBody(robotPuma560, bodies{i}, bodies{i-1}.Name)
    end
end

showdetails(robotPuma560)
robotPuma560.show                      
intPuma = interactiveRigidBodyTree(robotPuma560);