% plotH.m
% 4/5/22
% Description: Creates branching image with parameters (iterations, length, x position, y position)
function plotH(I,L,x,y)
	hold on % keep all lines on one figure
    while(I ~= 0)
        Hg = plot([x-L x+L], [y y],'g-');
        Hr = plot([x-L x-L], [y-(L/sqrt(2)) y+(L/sqrt(2))],'r-');
        Hb = plot([x+L x+L], [y-(L/sqrt(2)) y+(L/sqrt(2))],'b-');
        I=I-1; % decrement
		% loop with each point of the H
        plotH(I,L/2,x-L,y+(L/sqrt(2)))
        plotH(I,L/2,x+L,y+(L/sqrt(2)))
        plotH(I,L/2,x-L,y-(L/sqrt(2)))
        plotH(I,L/2,x+L,y-(L/sqrt(2)))
    end
    title('H tree'); xlim([-2 2]); ylim([-2 2]);
end
