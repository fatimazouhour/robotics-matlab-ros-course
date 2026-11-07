# Robotics – MATLAB, Simulink and ROS

Exercises and labs from the Robotics course (Politecnico di Torino, 2025/2026):
mobile robot models, manipulator kinematics, Jacobian, dynamics and control,
path planning, and ROS with MATLAB.

| Folder | Sheet | Content |
|---|---|---|
| [`Basic_models`](Basic_models) | E1 | Kinematic models of mobile robots: unicycle, bicycle, differential drive |
| [`definition_and_kinematics`](definition_and_kinematics) | E2 | Homogeneous transforms, ETS, rigidBodyTree, DH parameters, forward and inverse kinematics |
| [`Jacobian`](Jacobian) | E3 | Geometric Jacobian, singularities, velocity ellipsoids, non-square Jacobian |
| [`dynamics_and_control`](dynamics_and_control) | E4 | Inverse/forward dynamics, UR20 model, PI joint control, joint-space and Cartesian trajectories |
| [`trajectory_and_pathplanning`](trajectory_and_pathplanning) | E5 | LiDAR SLAM, occupancy maps, PRM, A*, Hybrid A* |
| [`ROS_Exercises`](ROS_Exercises) | L1–L3 | ROS 1 with MATLAB: topics, services, parameters, TF, URDF, rosbag, TurtleBot3 in Gazebo |


## Requirements
- MATLAB R2023b+ (i used my Matlab 2025b) with Robotics System Toolbox, Navigation Toolbox, ROS Toolbox,
  Control System Toolbox, Symbolic Math Toolbox, Simulink, Simscape Multibody
- [Robotics, Vision & Control Toolbox (RVC3)](https://github.com/petercorke/RVC3-MATLAB)
  for ETS2/ETS3, `teach`, `loadrvcrobot` and the `sl_*` models (not included here)
- ROS labs: Ubuntu 20.04 VM with ROS Noetic, turtlesim, TurtleBot3 Gazebo packages

## Notes & Disclaimers
The code here is my own work on the robotics labs / technical exercises, mistakes are possible (so dont follow blindly),in case you find any,contact me to discuss further. For any other inquiry, please dont hestitate to email me. 

Some folders have a readme explaining them, for others , I dont thinks it's necessarily needed.

Course slides and provided questions / exercises / files  are not included.

During this course, I have also worked on a robotics project (robust indoor-outdoor localization), if you're interested, take a look at it in [here](https://github.com/fatimazouhour/localization-project-PoliTO).
