clear all
close all
clc

% cylindrical arm exercise

% Denavit Hartenberg Parameters ir order (a alpha d theta)
dhparams = [0 0	0 0;
            0 -pi/2 0 0
            0 0	0	0];

cyl_arm = rigidBodyTree(DataFormat="row");

bodies = cell(3,1);
joints = cell(3,1);

for i = 1:3
    
    %Only the first joint is revolute
    if i == 1
        bodies{i} = rigidBody(['body' num2str(i)]);
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
        setFixedTransform(joints{i},dhparams(i,:),"dh");
        bodies{i}.Joint = joints{i};
    %The other joints are prismatic    
    else
        bodies{i} = rigidBody(['body' num2str(i)]);
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"prismatic");
        setFixedTransform(joints{i},dhparams(i,:),"dh");
        bodies{i}.Joint = joints{i};
    end

        if i == 1 % Add first body to base
        addBody(cyl_arm,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(cyl_arm,bodies{i},bodies{i-1}.Name)
    end
end

showdetails(cyl_arm)
introbot_cyl = interactiveRigidBodyTree(cyl_arm,MarkerScaleFactor=0.3);

%Verify that the Jacobian matrix coincides with the one obtained in theory

J=cyl_arm.geometricJacobian([0 0.5 0.5],"body3")