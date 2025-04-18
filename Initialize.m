function [grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess)
grid{1} = ones(N,N); %Pressure
grid{2} = ones(N,N) .* UGuess; %x velocity
grid{3} = ones(N,N).* UGuess; %y velocity

%Set the grid space with x and y values
N = N-2
spaces = linspace(0,H,N);
xVec = repmat(spaces,1,N);
yVec = repelem(spaces, N);
%set it to a matrix that is easy to understand geometrically
yCoords = flipud(reshape(yVec,N,N)');
xCoords = flipud(reshape(xVec,N,N)');
delta = spaces(2) - spaces(1);


end
