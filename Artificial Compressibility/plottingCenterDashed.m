function plottingCenterDashed(xCoords,yCoords,U,N)
figure(1)
midPoint = floor(N/2);
xVelCenter = U(2:end-1, midPoint, 2);
yPos = yCoords(:,1);
plot(yPos,xVelCenter,'--')
hold on


figure(2)
yVelCenter = U( midPoint,2:end-1, 3);
xPos = xCoords(1,:);
plot(xPos,yVelCenter,'--')
hold on
end