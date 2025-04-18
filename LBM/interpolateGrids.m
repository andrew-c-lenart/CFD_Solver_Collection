function [errorU,errorV] = interpolateGrids(N1,N2,u1,v1,u2,v2)
% 1 is fine grid, 2 is coarse grid
N1 = N1-2;
N2 = N2-2;

spaces = linspace(0,1,N1);
xVec = repmat(spaces,1,N1);
yVec = repelem(spaces, N1);
yCoords1 = flipud(reshape(yVec,N1,N1)');
xCoords1 = flipud(reshape(xVec,N1,N1)');

spaces = linspace(0,1,N2);
xVec = repmat(spaces,1,N2);
yVec = repelem(spaces, N2);
yCoords2 = flipud(reshape(yVec,N2,N2)');
xCoords2 = flipud(reshape(xVec,N2,N2)');

%Use interpolate function
u1 = interp2(xCoords1, yCoords1, u1(2:end-1,2:end-1), xCoords2, yCoords2, 'linear');
v1 = interp2(xCoords1, yCoords1, v1(2:end-1,2:end-1), xCoords2, yCoords2, 'linear');


    N = N2;
    errorU = MSE(N,u1,u2);
    errorV = MSE(N,v1,v2);

    errorU = sqrt(errorU)/N^2;
    errorV = sqrt(errorV)/N^2;