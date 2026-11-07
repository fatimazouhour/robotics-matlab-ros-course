clear all
close all
clc

clear all
close all
clc

abb = loadrobot("abbIrb1600", DataFormat="row");   

aIK = analyticalInverseKinematics(abb);
abbIKFcn = aIK.generateIKFunction("ikIRB1600");

start = se3(3,"roty",[0.6 -0.5 0.1]);
goal  = se3(2,"rotx",[0.4  0.5 0.1]);

t = 0:0.02:2;

[s,sd,sdd] = minjerkpolytraj([0 1], [0 2], numel(t));

Ts = transformtraj(start, goal, [0 2], t, TimeScaling=[s;sd;sdd]);

p = Ts.trvec;  plot(p(:,1), p(:,2))     

q = ikineTraj(abbIKFcn, Ts);

r=rateControl(50);

for i=1:size(q,1)
    abb.show(q(i,:), FastUpdate=true, PreservePlot=false);
    trajT(i) = se3(abb.getTransform(q(i,:),"tool0"));
     r.waitfor;
end
hold on, plot(p(:,1),p(:,2)), hold off
figure, xplot(t, q, unwrap=true) 