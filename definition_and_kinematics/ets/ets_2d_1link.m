clear all
close all
clc

%one link example

a1=1;       % link length =1 unit
e=ETS2.Rz('q1')*ETS2.Tx(a1)   

%ETS2 = elementary tranform sequence in 2D
e.fkine(pi/6)  % with q1=  pi/6 return the pose of the arms tip

%homogenous tranformation in matlab
se2(pi/6,'theta')*se2(eye(2),[a1  0])
