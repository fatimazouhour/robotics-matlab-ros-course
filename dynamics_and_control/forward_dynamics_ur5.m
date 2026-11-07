clear all
close all
clc

ur5 = loadrobot("universalUR5e", "DataFormat","row", Gravity=[0 0 -9.81]);
ur5conf.qn = [0 -1.07 1.38 -0.3 0 -2.3];
qdd = ur5.forwardDynamics(ur5conf.qn)


% can also use simulink
sl_zerotorque
r=sim("sl_zerotorque");

t = r.find("tout");
q = r.find("yout");

plot(t,q(:,1:3))

% Animation
rc = rateControl(10);
for i = 1:size(q,1)
 ur5.show(q(i,:),FastUpdate=true,PreservePlot=false);
 rc.waitfor;
end
