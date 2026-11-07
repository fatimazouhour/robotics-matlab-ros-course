clear all
close all
clc

%a, alpha,d,theta
dh_params=[0 pi/2 0.2363 0;
           -0.862 0 0 0;
           -0.7287 0 0 0;
            0 pi/2 0.201 0;
            0 -pi/2 0.1593 0;
            0 0 0.1543 0];

mass=[16.343,29.632,7.879,3.054,3.126,0.846];

com = [ 0  -0.0610  0.0062;    
        0.5226  0  0.2098;
        0.3234  0  0.0604;
        0  -0.0026  0.0393;
        0   0.0024  0.0379;
        0    -0.0003  -0.0318];

inertia=[0.0887 0.0763 0.0842 0.0072 -0.0001 -0.0001;
         0.1467 4.6659 4.6348 0.0000 -0.0516 0.0002;
         0.0261 0.7576 0.7533 0.0000 -0.0290 -0.0001;
         0.0056 0.0054 0.0040 0.0004 0.0000 0.0000;
         0.0059 0.0058 0.0043 -0.0004 0.0000 0.0000;
         0.0009 0.0009 0.0012 0.0000 0.0000 0.0000]

ur20= rigidBodyTree("DataFormat",'row');

bodies= cell(6,1);
joints= cell(6,1);


for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)], "revolute");
    setFixedTransform(joints{i}, dh_params(i,:), "dh");
    bodies{i}.Joint = joints{i};

   
    bodies{i}.Mass         = mass(i);
    bodies{i}.CenterOfMass = com(i,:);

    c = com(i,:)';  m = mass(i);
    Ic = [inertia(i,1) inertia(i,6) inertia(i,5);% rebuild the 3x3 COM tensor
      inertia(i,6) inertia(i,2) inertia(i,4);
      inertia(i,5) inertia(i,4) inertia(i,3)];
    Ib = Ic + m*(c'*c*eye(3) - c*c');% parallel-axis theorem
    bodies{i}.Inertia = [Ib(1,1) Ib(2,2) Ib(3,3) Ib(2,3) Ib(1,3) Ib(1,2)];
    bodies{i}.Inertia      = inertia(i,:);

    if i == 1
        addBody(ur20, bodies{i}, "base");
    else
        addBody(ur20, bodies{i}, bodies{i-1}.Name);
    end
end

ur20.showdetails
ur20.show