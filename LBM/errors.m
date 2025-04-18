% Re 100
close all
clc


x = [35,70,120]+1;
% interpolate grids to the coarse grid

[uError(1),vError(1)] = interpolateGrids(141,x(1),u_Re100_N140,v_Re100_N140,u_Re100_N35,v_Re100_N35);
[uError(2),vError(2)] = interpolateGrids(141,x(2),u_Re100_N140,v_Re100_N140,u_Re100_N70,v_Re100_N70);
[uError(3),vError(3)] = interpolateGrids(141,x(3),u_Re100_N140,v_Re100_N140,u_Re100_N120,v_Re100_N120);

figure(1)
loglog(x, uError, '-o')  
hold on 
slopeRe100_U = logslope(x, uError);

figure(1)
loglog(x, vError, '-o')  
hold on 
slopeRe100_V = logslope(x, vError);

%% Re 1000
x = [35,70,120]+1;
% interpolate grids to the coarse grid

[uError(1),vError(1)] = interpolateGrids(141,x(1),u_Re1000_N140,v_Re1000_N140,u_Re1000_N35,v_Re1000_N35);
[uError(2),vError(2)] = interpolateGrids(141,x(2),u_Re1000_N140,v_Re1000_N140,u_Re1000_N70,v_Re1000_N70);
[uError(3),vError(3)] = interpolateGrids(141,x(3),u_Re1000_N140,v_Re1000_N140,u_Re1000_N120,v_Re1000_N120);

figure(1)
loglog(x, uError, '-o')  
hold on 
slopeRe1000_U = logslope(x, uError);

figure(1)
loglog(x, vError, '-o')  
hold on 
slopeRe1000_V = logslope(x, vError);

%% Re 400
x = [35,70,120]+1;
[uError(1),vError(1)] = interpolateGrids(141,x(1),u_Re400_N140,v_Re400_N140,u_Re400_N35,v_Re400_N35);
[uError(2),vError(2)] = interpolateGrids(141,x(2),u_Re400_N140,v_Re400_N140,u_Re400_N70,v_Re400_N70);
[uError(3),vError(3)] = interpolateGrids(141,x(3),u_Re400_N140,v_Re400_N140,u_Re400_N120,v_Re400_N120);

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
legend('Re 100, U Velocity', 'Re 100, V Velocity','Re 1000, U Velocity','Re 1000, V Velocity','Re 400, U Velocity','Re 400, V Velocity')


text(42, 1*10^(-6.1), ['Slope Re 100, U = ', num2str(slopeRe100_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(42, 1*10^(-6.05), ['Slope Re 100, V = ', num2str(slopeRe100_V, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(42, 1*10^(-6), ['Slope Re 400, U = ', num2str(slopeRe400_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(42, 1*10^(-5.9), ['Slope Re 400, V = ', num2str(slopeRe400_V, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(42, 1*10^(-5.8), ['Slope Re 1000, U = ', num2str(slopeRe1000_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(42, 1*10^(-5.7), ['Slope Re 1000, V = ', num2str(slopeRe1000_V, '%.2f')], 'FontSize', 8, 'Color', 'red');