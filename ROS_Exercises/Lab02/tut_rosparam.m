rosshutdown; % to shutdoewn previous if any open
rosinit("192.168.56.101", 11311,"NodeHost", "192.168.56.1");


%some useful are:
%   - has()
%   - set()
%   - get()
%   - search()

ptree = rosparam; %it will be an object
ptree.AvailableParameters;

r= get(ptree, "/turtlesim/background_r")
g= get(ptree, "/turtlesim/background_g")
b= get(ptree, "/turtlesim/background_b")

%now lets change them 

set(ptree, "/turtlesim/background_r", 255)
set(ptree, "/turtlesim/background_g", 150)
set(ptree, "/turtlesim/background_b", 0)

clearClient =rossvcclient("/clear");
call(clearClient);

search(ptree, "background")            
set(ptree, "/my_param", 42);
get(ptree, "/my_param")
del(ptree, "/my_param");

%%
rosshutdown