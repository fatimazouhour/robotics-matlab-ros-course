# E4 – Dynamics and control

| File | Content |
|---|---|
| `dynamics_puma.m` | Inverse dynamics, changing parameters, gravity, inertia and Coriolis matrices (D1–D5) |
| `forward_dynamics_ur5.m` | Forward dynamics of the UR5e + zero-torque Simulink simulation (D6–D7) |
| `ur20_model.m` | UR20 built from its DH table with masses, centres of mass and inertias |
| `decentralized_control.m` | PI speed control of Puma560 joint 2 tuned with the root locus (C1) |
| `ControlSystemDesignerSession.mat` | Saved `rltool` session |
| `joint_space_trajectory.m` | Joint-space trajectory of the ABB IRB1600 with `trapveltraj` (T1) |
| `cartesian_trajectory.m` | Cartesian trajectory with `minjerkpolytraj` + `transformtraj` + IK (T2) |
| `figures/` | Plots |
