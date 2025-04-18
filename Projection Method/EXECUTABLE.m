clc
clear
close all
%Set constant parameters
H = 1;
PlateVel = 1;
visc = 5;
UGuess = 0;

deltaT = .0001;

%% Re = 400
Re = 400;
rho = Re*visc/PlateVel/H; %Calculate the corresponding rho for the given Reynolds number

% N = 26;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re400_N26 = U;
% V_Re400_N26 = V;
% P_Re400_N26 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)
% 
N = 32;
[P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
[P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
U_Re400_N32 = U;
V_Re400_N32 = V;
P_Re400_N32 = P;
plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)

% N = 64;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re400_N64 = U;
% V_Re400_N64 = V;
% P_Re400_N64 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)
% 
% N = 129;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re400_N129 = U;
% V_Re400_N129 = V;
% P_Re400_N129 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)

% N = 180;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re400_N180 = U;
% V_Re400_N180 = V;
% P_Re400_N180 = P;





%% Re = 100
% Re = 100;
% rho = Re*visc/PlateVel/H;
% 
% N = 26;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re100_N26 = U;
% V_Re100_N26 = V;
% P_Re100_N26 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)

% N = 32;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re100_N32 = U;
% V_Re100_N32 = V;
% P_Re100_N32 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)

% N = 64;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re100_N64 = U;
% V_Re100_N64 = V;
% P_Re100_N64 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)
% 
% N = 129;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re100_N129 = U;
% V_Re100_N129 = V;
% P_Re100_N129 = P;
% plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)
% 
% N = 180;
% [P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel,xCoordsYVel,yCoordsYVel,delta] = InitializeStag(N,H,UGuess);
% [P,U,V] =  Solver(P,U,V,deltaT,rho,visc,N,delta,PlateVel);
% U_Re100_N180 = U;
% V_Re100_N180 = V;
% P_Re100_N180 = P;





