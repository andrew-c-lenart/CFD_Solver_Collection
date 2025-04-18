function [Grid,GridVelX,GridVelY,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess)
Grid(:,:) = ones(N,N); %Pressure
GridVelX = ones(N,N-1) .* UGuess; %x velocity
GridVelY = ones(N-1,N).* UGuess; %y velocity

%Set the grid space with x and y values
spaces = linspace(0,H,N);
delta = spaces(2) - spaces(1);
xVecPres = repmat(spaces,1,N);
yVecPres = repelem(spaces, N);


%set it to a matrix that is easy to understand geometrically
yCoords = flipud(reshape(yVecPres,N,N)');
xCoords = flipud(reshape(xVecPres,N,N)');

xCoordsXVel = xCoords + delta/2;
xCoordsXVel = xCoordsXVel(:,1:end-1);
yCoordsXVel = yCoords(:,1:end-1);

yCoordsYVel = yCoords + delta/2;
yCoordsYVel = yCoordsYVel(2:end,:);
xCoordsYVel = xCoords(2:end,:);





end
