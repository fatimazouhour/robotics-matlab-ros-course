clear all
close all
clc

panda= loadrobot('frankaEmikaPanda','DataFormat','row')
panda.showdetails

qr=[0 -0.3 0 -2.1 0 2 0.78 0 0]; %give a set of joint pos
panda.show(qr)

intPanda=interactiveRigidBodyTree(panda, Configuration=qr) % to interact with robot

a=intPanda.Configuration'  %saves value of that config