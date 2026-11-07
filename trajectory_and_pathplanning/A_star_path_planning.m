clear all
close all
clc

rng('default');          
map = mapClutter;       

planner = plannerAStarGrid(map);
start = [2 130];
goal  = [248 190];
plan(planner, start, goal);
show(planner)