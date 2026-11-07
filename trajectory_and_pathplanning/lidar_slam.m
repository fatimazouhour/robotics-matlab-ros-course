clear all
close all
clc

load garage_fl1_southend.mat scans

scans=scans(1:40:end);

maxRange = 19.2;% max range
resolution = 10; % scan resolution

slamObj = lidarSLAM(resolution,maxRange);
slamObj.LoopClosureThreshold = 360; % weight about quality of SLAM
slamObj.LoopClosureSearchRadius = 8;


for i = 1:numel(scans)
     addScan(slamObj,scans{i});

     % every 10 scans display the stored poses and scans
     if rem(i,10) == 0
        show(slamObj);
     end
end

%build occupancy map
[scansSLAM, poses] = scansAndPoses(slamObj);
occMap = buildMap(scansSLAM, poses, resolution, maxRange);
figure, show(occMap)