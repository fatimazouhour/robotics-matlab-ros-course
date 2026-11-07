open_system("DoublePendulum_fromSim2URDF.slx")

robot = importrobot("DoublePendulum_fromSim2URDF.slx"); 
showdetails(robot)                                     
show(robot);

exporter = urdfExporter(robot);
exporter.OutputFileName = "DoublePendulum_exported.urdf";
exporter.RobotName      = "DoublePendulum";
exporter.writefile();

type DoublePendulum_exported.urdf