clear all
close all
clc

abb=loadrobot("abbIrb1600", DataFormat="row");

aIK = analyticalInverseKinematics(abb);
abbIKFcn = aIK.generateIKFunction("ikIRB1600");

%define initial e goal
start = se3(3,"roty",[0.6 -0.5 0.1]); 
goal = se3(2,"rotx",[0.4 0.5 0.1]); 

sol1 = abbIKFcn(start.tform);
sol2 = abbIKFcn(goal.tform);
waypts = [sol1(1,:)' sol2(1,:)'];

t=0:0.02:2;

[q,qd,qdd]=trapveltraj(waypts,numel(t),EndTime=2);


r=rateControl(50);

%see animation
for i=1:size(q,2)
    abb.show(q(:,i)', FastUpdate=true, PreservePlot=false);
    trajT(i) = se3(abb.getTransform(q(:,i)',"tool0"));
    r.waitfor;
end

p = trajT.trvec;

hold on,
plot(p(:,1),p(:,2))
hold off % plot of the cartesian motion in XY plane