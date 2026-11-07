# ROS labs (MATLAB + ROS 1 Noetic / ROS 2)

| Lab | File | Content |
|---|---|---|
| L1 | `ex1_pub_sub.m` | Publisher/subscriber on `/chatter`, callback prints uppercase |
| L1 | `ex2_turtlesim_goto_goal.m` | P controller driving turtlesim to a goal (`/turtle1/pose` → `/turtle1/cmd_vel`) |
| L2 | `ex1_teleport_service.m` | Service client: `/turtle1/teleport_absolute` with keyboard input |
| L2 | `tut_rosparam.m` | Parameter server: change turtlesim background colour |
| L2 | `tut_tf.m` | TF tree: read transforms, add a `wheel` frame |
| L2 | `sim2urdf.m`, `urdf2sim.m` | Simscape model ↔ URDF (double pendulum) |
| L2 | `tut_rosbag.m` | Read a rosbag and plot the recorded path |
| L3 | `tut_turtlebot3.m` | TurtleBot3 in Gazebo: `/cmd_vel`, `/odom`, `/scan` |