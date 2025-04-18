clc
clear
close all
%% D2Q9 Constants
%Here set weights and constants that are the same across all D2Q9
%simulations
Weights = [4/9,1/9,1/9,1/9,1/9,1/36,1/36,1/36,1/36];
c = [0,0;
    1,0;
    0,1;
    -1,0;
    0,-1;
    1,1;
    -1,1;
    -1,-1;
    1,-1];

dx = 1.0;
dt = 1.0;

n = 9;

%% Simulation parameters
Re = 100;
N = 80; %Number of grid points
ULid = .1;
% nu = .114;
nu = N*ULid/Re; %Calculate nu off of other parameters
% L = Re*nu/ULid;
% N = ceil(L/dx);
L = N;
N = N+1;
cs = sqrt(1/3);
% lamda = (nu/(-cs^2) - .5)^-1
tau =  nu/(cs^2)+.5  %-1/lamda
lamda = -1/tau
omega = dt/tau;
Mach = ULid/cs

%%
[f,u,v,r] = initialize(N,n,c,Weights,cs,ULid); %Initialize the grid
fInitial = f;
error = 50000;
% for  p = 1:4
while error > 1.3e-11
    % p = p
   [f,u,v,r,error] = iterativeSolver(f,N,n,c,Weights,cs,ULid,omega,r,u,v); %solve for each time step

end
deltaf = fInitial - f;
yPoints = linspace(0,L,N);


%Post processing scripts, copy into command terminal whichever is needed

%% Generate Coordinate System
spaces = 0:1:N-1
xVec = repmat(spaces,1,N);
yVec = repelem(spaces, N);
%set it to a matrix that is easy to understand geometrically
yCoords = flipud(reshape(yVec,N,N)');
xCoords = flipud(reshape(xVec,N,N)');

%% Plot U Field
figure
contourf(xCoords, yCoords, u, 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;
colorbarHandle.Label.String = 'X Velocity [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

%% Plot Streamlines
figure
% Plot streamlines
streamslice(xCoords, yCoords, u, v,2);
axis equal;
xlabel('X [-]');
ylabel('Y [-]');
