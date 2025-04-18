clc
clear
close all


%% Constant simulation parameters across all simulations
PlateVel = 1;
H = 1;
beta = .35;
deltaT = 0.0001;
UGuess = 0.0; 
initializePlots()
%% Re = 100
Re = 100; %set Re
D = [0,1,1]
eMax = 9e-9; %Set error to exit at
N = 200; %set grid points
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT);
U_Re100_N200 = U;

N = 129;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT);
plotting(xCoords,yCoords,U,N)
plottingCenter(xCoords,yCoords,U,N)
U_Re100_N129 = U;

N = 64;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
plotting(xCoords,yCoords,U,N)
plottingCenter(xCoords,yCoords,U,N)
U_Re100_N64 = U;

N = 32;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
plotting(xCoords,yCoords,U,N)
plottingCenter(xCoords,yCoords,U,N)
U_Re100_N32 = U;

N = 20;

[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
U_Re100_N20 = U;
%% Re = 400
Re = 400;
D = [0,1,1]
eMax = 5e-9;

N = 200;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT);
U_Re400_N200 = U;

N = 129;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT);
plotting(xCoords,yCoords,U,N)
plottingCenter(xCoords,yCoords,U,N)
U_Re400_N129 = U;

N = 64;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
plotting(xCoords,yCoords,U,N)
plottingCenter(xCoords,yCoords,U,N)
U_Re400_N64 = U;

N = 32;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
plotting(xCoords,yCoords,U,N)
plottingCenter(xCoords,yCoords,U,N)
U_Re400_N32 = U;

N = 26;
deltaT = 0.00001;
beta = .55;
[grid,xCoords,yCoords,delta] = Initialize(N,H,UGuess);
U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)
U_Re400_N26 = U;

figure(1)
title('U Velocity Along Vertical Centerline')
xlabel('Y Pos. [-]')
ylabel('U Velocity [-]')
legend('Theoretical Re = 100','Theoretical Re = 400', 'Re = 400, N = 129','Re = 400, N = 64','Re = 400, N = 32','Re = 100, N = 129','Re = 100, N = 64','Re = 100, N = 32')

figure(2)
title('V Velocity Along Vertical Centerline')
xlabel('Y Pos. [-]')
ylabel('V Velocity [-]')
legend('Theoretical Re = 100','Theoretical Re = 400', 'Re = 400, N = 129','Re = 400, N = 64','Re = 400, N = 32','Re = 100, N = 129','Re = 100, N = 64','Re = 100, N = 32')