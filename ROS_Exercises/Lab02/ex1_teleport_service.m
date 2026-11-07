rosshutdown; % to shutdoewn previous if any open
rosinit("192.168.56.101", 11311,"NodeHost", "192.168.56.1");

client =rossvcclient('/turtle1/teleport_absolute','DataFormat','struct');
msg_req= rosmessage(client) ; %empty message (x,y,theta)

x= input('x(0-11): ');
y= input('y(0-11): ');
theta= input('theta[deg]: ');

msg_req.X= single(x); 
msg_req.Y= single(y);
msg_req.Theta= single(deg2rad(theta));


resp = call(client, msg_req, "Timeout", 5);
%% 
rosshutdown