bag = rosbag("ros_turtlesim.bag");         
bag.AvailableTopics                        

bSel = select(bag, "Topic", "/turtle1/pose");           
msgStructs = readMessages(bSel, "DataFormat", "struct"); 
msgStructs{1}                      

xPoints = cellfun(@(m) double(m.X), msgStructs); 
yPoints = cellfun(@(m) double(m.Y), msgStructs);  
plot(xPoints, yPoints)
axis equal; grid on; title("Recorded turtlesim path")