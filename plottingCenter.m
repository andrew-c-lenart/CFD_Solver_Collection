function plottingCenter(xCoords,yCoords,U,N)
figure(5)
midPoint = floor(N/2);
xVelCenter = U(2:end-1, midPoint)
yPos = yCoords(2:end-1,1)
plot(yPos,xVelCenter)
hold on



end

