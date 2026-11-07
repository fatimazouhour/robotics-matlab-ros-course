clear all
close all
clc

%% copied from the map_building.m 

map = binaryOccupancyMap(100, 80, 1); % empty occ grid
occ = zeros(80, 100); % initialzie free spaces

%walls
occ(1,:) = 1;
occ(end,:) = 1;
occ([1:30, 51:80],1) = 1;
occ([1:30, 51:80],end) = 1;

%parking slots

occ(40,20:80) = 1;
occ(28:52,[20:21 32:33 44:45 56:57 68:69 80:81]) = 1;
occ(1:12, [20:21 32:33 44:45 56:57 68:69 80:81]) = 1;
occ(end-12:end, [20:21 32:33 44:45 56:57 68:69 80:81]) = 1;

setOccupancy(map, occ)

figure
show(map)

mapInflated=copy(map);

robotRadius = 0.25;

inflate(mapInflated, robotRadius)
show(mapInflated)
%%

prm = mobileRobotPRM;
prm.Map = mapInflated;
prm.NumNodes = 1500;   %nb of random samples
prm.ConnectionDistance = 5;

start = [0 40];
goal  = [100 40];
path = findpath(prm, start, goal);
show(prm)