rosshutdown;
rosinit("192.168.56.101", 11311, "NodeHost", "192.168.56.1");

% move forward 4 s
robotCmd = rospublisher("/cmd_vel","DataFormat","struct");
velMsg = rosmessage(robotCmd);
velMsg.Linear.X = 0.1;
send(robotCmd, velMsg)
pause(4)
velMsg.Linear.X = 0;
send(robotCmd, velMsg)

% pose from odometry
odomSub = rossubscriber("/odom","DataFormat","struct");
odomMsg = receive(odomSub, 3);
pose = odomMsg.Pose.Pose;
[pose.Position.X pose.Position.Y pose.Position.Z]
quat = pose.Orientation;
angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
theta = rad2deg(angles(1))

% lidar while rotating
lidarSub = rossubscriber("/scan","DataFormat","struct");
velMsg.Angular.Z = 0.1;
send(robotCmd, velMsg)
figure
tic

while toc < 20
    scanMsg = receive(lidarSub);
    rosPlot(scanMsg)
end
velMsg.Angular.Z = 0;
send(robotCmd, velMsg)

rosshutdown