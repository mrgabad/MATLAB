% analogClockDDA.m
% 4/12/22
% Description: Creates video of analog clock from 3:59:40 to 4:00:10
clear all;
close all;
hold on
N=300;
I = uint8(zeros(N,N,3));
 
vidObj = VideoWriter('analogClockMRA.avi');
vidObj.FrameRate = 10;
open(vidObj);
hour=3;minute=59;second=40;
for i=0:300 % 30frames for 10fps
   % draw circle
   for x=-124:124
       for y=-124:124
           if x^2 + y^2 < 125^2
               I(150+round(y),150+round(x),:)=[230 230 250];
           end
       end
   end
 
	xc=150;yc=150;
	% hour hand
	xend=round(xc+60*sin(2*pi*hour/12));
	yend=round(yc-60*cos(2*pi*hour/12));
   I=plotLine(I,xc,yc,xend,yend,[255 0 255])
	
	% minute hand
	xend=round(xc+90*sin(2*pi*minute/60));
	yend=round(yc-90*cos(2*pi*minute/60));
   I=plotLine(I,xc,yc,xend,yend,[255 0 0]);
	
	% second hand
	xend=round(xc+100*sin(2*pi*second/60));
	yend=round(yc-100*cos(2*pi*second/60));
   I=plotLine(I,xc,yc,xend,yend,[0 255 255]);
	
	% show image and add text
	imshow(I); text(90,10,'Analog Clock by Marc','FontName','AvantGarde','Color',[0 0 1]);
   text(145,30,'12','FontName','AvantGarde','Color',[0 0 1]);
   text(200,45,'1','FontName','AvantGarde','Color',[0 0 1]);
   text(250,90,'2','FontName','AvantGarde','Color',[0 0 1]);
   text(265,150,'3','FontName','AvantGarde','Color',[0 0 1]);
   text(250,205,'4','FontName','AvantGarde','Color',[0 0 1]);
   text(200,255,'5','FontName','AvantGarde','Color',[0 0 1]);
   text(145,270,'6','FontName','AvantGarde','Color',[0 0 1]);
   text(95,255,'7','FontName','AvantGarde','Color',[0 0 1]);
   text(45,205,'8','FontName','AvantGarde','Color',[0 0 1]);
   text(25,150,'9','FontName','AvantGarde','Color',[0 0 1]);
   text(45,90,'10','FontName','AvantGarde','Color',[0 0 1]);
   text(95,45,'11','FontName','AvantGarde','Color',[0 0 1]);
	currFrame = getframe;
	writeVideo(vidObj,currFrame);
   % increment time
   if i ~= 0
       if mod(i,10) == 0
           second=second + 1;
           if second > 59
               minute=minute+1;
               second=0;
               if minute > 59
                   hour=hour+1;
                   minute=0;
               end
           end
       end
   end
   close all;
end
close(vidObj) % Close the file
