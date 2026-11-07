clear all
close all
clc


load parkingLotCostVal.mat
map = binaryOccupancyMap(costVal, 3);

ss = stateSpaceSE2;
ss.StateBounds = [map.XWorldLimits; map.YWorldLimits; [-pi pi]];
sv = validatorOccupancyMap(ss);
sv.Map = map;

planner = plannerHybridAStar(sv, MinTurningRadius=4, MotionPrimitiveLength=6);
start = [4 9 pi/2];
goal  = [30 19 -pi/2];
refpath = plan(planner, start, goal);
show(planner)