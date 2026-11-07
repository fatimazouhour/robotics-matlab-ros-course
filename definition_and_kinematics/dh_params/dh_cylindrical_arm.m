clear all
close all
clc

dh_params=[0 0 0 0;
    0 -pi/2 0  0;
    0 0 0 0];
cyl_arms= rigidBodyTree("DataFormat",'row');

bodies=cell(3,1);
joints=cell(3,1);

for i=1:3
    if i==1
        bodies{i}=rigidBody(['body' num2str(i)]);
        joints{i}= rigidBodyJoint(['joint' num2str(i)],'revolute');
        setFixedTransform(joints{i},dh_params(i,:),'dh');
        bodies{i}.Joint=joints{i};
    else
        bodies{i} = rigidBody(['body' num2str(i)]);
        joints{i} = rigidBodyJoint(['joint' num2str(i)],"prismatic");
        setFixedTransform(joints{i},dh_params(i,:),"dh");
        bodies{i}.Joint = joints{i};
    end

end

for i = 1:3
     if i == 1 % Add first body to base
        addBody(cyl_arms,bodies{i},"base")
     else % Add current body to previous body by name
        addBody(cyl_arms,bodies{i},bodies{i-1}.Name)
     end
end

showdetails(cyl_arms)
intr_cyl = interactiveRigidBodyTree(cyl_arms)