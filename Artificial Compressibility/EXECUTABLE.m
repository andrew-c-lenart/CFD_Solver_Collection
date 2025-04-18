clc
clear
close all


%% Constant simulation parameters across all simulations
PlateVel = 1;
H = 1;
beta = .35;
deltaT = 0.0001;
UGuess = 0.0; 
%% Re = 100
Re = 100; %set Re
D = [0,1,1]
eMax = 9e-9; %Set error to exit at

N = 129; % Set number of grid points, 129x129 for example
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess); % Initialize conditions
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT); % Solver
plotting(xCoords,yCoords,U,N) %Plotting
U_Re100_N129 = U; %Storing Values
% 
% N = 64;
% [grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
% U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
% plotting(xCoords,yCoords,U,N)
% U_Re100_N64 = U;
% 
% N = 32;
% [grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
% U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
% plotting(xCoords,yCoords,U,N)
% U_Re100_N32 = U;
% 
% N = 20;
% 
% [grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
% U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
% U_Re100_N20 = U;
%% Re = 400
Re = 400;
D = [0,1,1]
eMax = 5e-9;


N = 129;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT);
plotting(xCoords,yCoords,U,N)
U_Re400_N129 = U;

% N = 64;
% [grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
% U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
% plotting(xCoords,yCoords,U,N)
% U_Re400_N64 = U;
% 
% N = 32;
% [grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
% U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
% plotting(xCoords,yCoords,U,N)
% U_Re400_N32 = U;
