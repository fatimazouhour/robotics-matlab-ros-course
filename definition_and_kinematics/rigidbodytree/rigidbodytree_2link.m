clear all
close all
clc

%2D example
a1=1;
a2=1;

link1= rigidBody('link1')
link1.Joint=rigidBodyJoint('joint1','revolute');
link2= rigidBody('link2')
link2.Joint= rigidBodyJoint('joint2','revolute');
link2.Joint.setFixedTransform(se3([a1 0 0],'trvec'));

%for the end effector
link3=rigidBody('link3')
link3.Joint.setFixedTransform(se3([a2 0 0],'trvec'));

%adding up
myRobot= rigidBodyTree("DataFormat","row"); % q represented by a row vec
myRobot.addBody(link1,myRobot.BaseName);
myRobot.addBody(link2,link1.Name);
myRobot.addBody(link3,link2.Name);

myRobot.homeConfiguration % shows the home position
myRobot.show  % shows the figure / visualization of robot


% myRobot.showdetails   shows info abou the built of robot

T= myRobot.getTransform(deg2rad([30 40]),'link3')
myRobot.show(deg2rad([30 40]))
view(0,90)

T=myRobot.getTransform(deg2rad([30 40]), "link2", "link1")% get the relative pose 
%of link 2 wrt link1


%an animation to see robot moving 
q=[linspace(0,2*pi,100)' linspace(2*pi,-2*pi,100)'];
r=rateControl(10);

for i=1:size(q,1)
    myRobot.show(q(i,:), FastUpdate=true, PreservePlot=false);
    r.waitfor;
    view(0,90);
end