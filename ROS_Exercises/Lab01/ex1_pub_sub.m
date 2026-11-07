rosshutdown;
rosinit;

pub = rospublisher ('/chatter','std_msgs/String','DataFormat','Struct');
sub = rossubscriber('/chatter','std_msgs/String',@upperCallback,'DataFormat','struct');

pause(1) 

msg= rosmessage(pub); % creates an empty message of typer std_msgs /string
for txt =["hello robot","ros is interesting","matlab node"]
    msg.Data =char(txt); %converts so that it comes as an array not a matlab string
    send(pub,msg); % thats when subscriber recieves the message and it prints
end
