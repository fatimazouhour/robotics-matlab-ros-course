rosshutdown;
rosinit                

exampleHelperROSStartTfPublisher 

tftree = rostf("DataFormat","struct");
pause(1)
tftree.AvailableFrames

camTF = getTransform(tftree, "robot_base", "camera_center")

% new frame: wheel at [0 -0.2 -0.3], rotated 30 deg around Y
tfMsg = rosmessage("geometry_msgs/TransformStamped","DataFormat","struct");
tfMsg.Header.FrameId = 'robot_base';
tfMsg.ChildFrameId   = 'wheel';
tfMsg.Transform.Translation.X = 0;
tfMsg.Transform.Translation.Y = -0.2;
tfMsg.Transform.Translation.Z = -0.3;
q = eul2quat([0 deg2rad(30) 0]);% [w x y z]
tfMsg.Transform.Rotation.W = q(1);
tfMsg.Transform.Rotation.X = q(2);
tfMsg.Transform.Rotation.Y = q(3);
tfMsg.Transform.Rotation.Z = q(4);
tfMsg.Header.Stamp = rostime("now","DataFormat","struct");
sendTransform(tftree, tfMsg)
pause(1)

tftree.AvailableFrames 
wheelTF = getTransform(tftree, "robot_base", "wheel")

exampleHelperROSStopTfPublisher
rosshutdown