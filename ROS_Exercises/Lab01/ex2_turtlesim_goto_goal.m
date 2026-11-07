rosshutdown; % to shutdoewn previous if any open
rosinit("192.168.56.101", 11311,"NodeHost", "192.168.56.1");

pose_sub = rossubscriber("/turtle1/pose");%publishes its pose
cmd_vel_pub = rospublisher("/turtle1/cmd_vel","geometry_msgs/Twist","DataFormat","struct");
cmd_vel_msg = rosmessage(cmd_vel_pub); %empty message

goal= [9;9] % x y vector
kv= 0.25; %gain on distance error
kw= 1;  %gain on heading error
for k=1:100
    fprintf('k=%d \n',k)
    posedata=receive(pose_sub,10);


    turtle_pos= [posedata.X;posedata.Y];
    turtle_orient = double(posedata.Theta);
    fprintf("Current turtlesim position: \n x = %f \n y =%f \n", turtle_pos(1), turtle_pos(2))

    vect_dist_from_goal = goal - turtle_pos; %error goal to the turtles pose
    dist=double(norm(turtle_pos-goal)); %euclidean norm
    ref_angel = atan2(vect_dist_from_goal(2),vect_dist_from_goal(1)); %direction of goal

    cmd_vel_msg.Linear.X = kv*dist; 
    cmd_vel_msg.Angular.Z = kw*double(ref_angel-turtle_orient); %turn toward goal
    
    send(cmd_vel_pub, cmd_vel_msg)
    
    if norm(goal-turtle_pos)<=0.3
        fprintf("Goal reached: \n x = %f \n y =%f \n", turtle_pos(1), turtle_pos(2))
        break
    end

    pause(0.5)

end

%%
rosshutdown
