% Re 100
close all
clc
clear
load('variables.mat')
x = [32,64,129]-1;
% interpolate grids to the coarse grid

[uError(1),vError(1)] = interpolateGrids(179,x(1),U_Re100_N180(2:end,:),V_Re100_N180(:,2:end),U_Re100_N32(2:end,:),V_Re100_N32);
[uError(2),vError(2)] = interpolateGrids(179,x(2),U_Re100_N180(2:end,:),V_Re100_N180(:,2:end),U_Re100_N64(2:end,:),V_Re100_N64);
[uError(3),vError(3)] = interpolateGrids(179,x(3),U_Re100_N180(2:end,:),V_Re100_N180(:,2:end),U_Re100_N129(2:end,:),V_Re100_N129);

figure(1)
loglog(x, uError, '-o')  
hold on 
slopeRe100_U = logslope(x, uError);

figure(1)
loglog(x, vError, '-o')  
hold on 
slopeRe100_V = logslope(x, vError);

%% Re 400
x = [26,32,64,129]-1;
[uError(1),vError(1)] = interpolateGrids(179,x(1),U_Re400_N180(2:end,:),V_Re400_N180(:,2:end),U_Re400_N26(2:end,:),V_Re400_N26(:,2:end));
[uError(2),vError(2)] = interpolateGrids(179,x(2),U_Re400_N180(2:end,:),V_Re400_N180(:,2:end),U_Re400_N32(2:end,:),V_Re400_N32(:,2:end));
[uError(3),vError(3)] = interpolateGrids(179,x(3),U_Re400_N180(2:end,:),V_Re400_N180(:,2:end),U_Re400_N64(2:end,:),V_Re400_N64(:,2:end));
[uError(4),vError(4)] = interpolateGrids(179,x(4),U_Re400_N180(2:end,:),V_Re400_N180(:,2:end),U_Re400_N129(2:end,:),V_Re400_N129(:,2:end));

figure(1)
loglog(x, uError, '--s')  
hold on 
title('Error vs Grid Spacing for Different Velocities and Values of Re')
slopeRe400_U = logslope(x, uError);

figure(1)
loglog(x, vError, '--s')  
hold on 
title('Error vs Grid Spacing for Different Velocities and Values of Re')
slopeRe400_V = logslope(x, vError);
ylabel('MSE Error')
xlabel('N Grid Points')
legend('Re 100, U Velocity', 'Re 100, V Velocity','Re 400, U Velocity','Re 400, V Velocity')


text(30, 1*10^(-5), ['Slope Re 100, U = ', num2str(slopeRe100_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(30, 1*10^(-4.9), ['Slope Re 100, V = ', num2str(slopeRe100_V, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(30, 1*10^(-4.2), ['Slope Re 400, U = ', num2str(slopeRe400_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(30, 1*10^(-4.1), ['Slope Re 400, V = ', num2str(slopeRe400_V, '%.2f')], 'FontSize', 8, 'Color', 'red');