# E2 – Robot definition and kinematics

| Folder | Content |
|---|---|
| `homogenous_transforms/` | Rotation matrices Rx, Ry, Rz and homogeneous transforms T = [R p; 0 1] |
| `ets/` | Robots as Elementary Transform Sequences (ETS2/ETS3): 1-link, 2-link planar and 6-DOF arms; forward kinematics with `fkine`, `teach` GUI; conversion to rigidBodyTree (`ets2rbt`) |
| `rigidbodytree/` | Building a 2-link arm body by body (`rigidBody`, `rigidBodyJoint`) with an animation; loading the Franka Panda with `loadrobot` and moving it with `interactiveRigidBodyTree` |
| `dh_params/` | Robots from Denavit–Hartenberg tables: cylindrical arm (1 revolute + 2 prismatic joints) and Puma560 |
| `inverse_kinematics/` | IK four ways: 2-link arm analytical (symbolic, both elbow solutions) vs numerical (`fminsearch`, one solution); ABB IRB1600 analytical (`analyticalInverseKinematics`, possible thanks to its spherical wrist) vs numerical (`inverseKinematics`, result depends on the initial guess) |


