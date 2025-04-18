%% Re 100
close all
x = [20,32,64,129];
%interpolate grids to the coarse grid
[uError(1),vError(1)] = interpolateGrids(200,x(1),U_Re100_N200(:,:,2),U_Re100_N200(:,:,3),U_Re100_N20(:,:,2),U_Re100_N20(:,:,3));
[uError(2),vError(2)] = interpolateGrids(200,x(2),U_Re100_N200(:,:,2),U_Re100_N200(:,:,3),U_Re100_N32(:,:,2),U_Re100_N32(:,:,3));
[uError(3),vError(3)] = interpolateGrids(200,x(3),U_Re100_N200(:,:,2),U_Re100_N200(:,:,3),U_Re100_N64(:,:,2),U_Re100_N64(:,:,3));
[uError(4),vError(4)] = interpolateGrids(200,x(4),U_Re100_N200(:,:,2),U_Re100_N200(:,:,3),U_Re100_N129(:,:,2),U_Re100_N129(:,:,3));

figure(1)
loglog(x, uError, '-o')  
hold on 
slopeRe100_U = logslope(x, uError, 30, 1 * 10^(-10 / 3));

figure(1)
loglog(x, vError, '-o')  
hold on 
slopeRe100_V = logslope(x, vError, 30, 1 * 10^(-10 / 3));

%% Re 400
x = [26,32,64,129];
[uError(1),vError(1)] = interpolateGrids(200,x(1),U_Re400_N200(:,:,2),U_Re400_N200(:,:,3),U_Re400_N26(:,:,2),U_Re400_N26(:,:,3));
[uError(2),vError(2)] = interpolateGrids(200,x(2),U_Re400_N200(:,:,2),U_Re400_N200(:,:,3),U_Re400_N32(:,:,2),U_Re400_N32(:,:,3));
[uError(3),vError(3)] = interpolateGrids(200,x(3),U_Re400_N200(:,:,2),U_Re400_N200(:,:,3),U_Re400_N64(:,:,2),U_Re400_N64(:,:,3));
[uError(4),vError(4)] = interpolateGrids(200,x(4),U_Re400_N200(:,:,2),U_Re400_N200(:,:,3),U_Re400_N129(:,:,2),U_Re400_N129(:,:,3));

figure(1)
loglog(x, uError, '--s')  
hold on 
title('Error vs Grid Spacing for Different Velocities and Values of Re')
slopeRe400_U = logslope(x, uError, 30, 1 * 10^(-10 / 3));

figure(1)
loglog(x, vError, '--s')  
hold on 
title('Error vs Grid Spacing for Different Velocities and Values of Re')
slopeRe400_V = logslope(x, vError, 30, 1 * 10^(-10 / 3));
ylabel('MSE Error')
xlabel('N Grid Points')
legend('Re 100, U Velocity', 'Re 100, V Velocity','Re 400, U Velocity','Re 400, V Velocity')


text(45, 1*10^(-2.1), ['Slope Re 100, U = ', num2str(slopeRe100_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(45, 1*10^(-2.3), ['Slope Re 100, V = ', num2str(slopeRe100_V, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(45, 1*10^(-2.5), ['Slope Re 400, U = ', num2str(slopeRe400_U, '%.2f')], 'FontSize', 8, 'Color', 'red');
text(45, 1*10^(-2.7), ['Slope Re 400, V = ', num2str(slopeRe400_V, '%.2f')], 'FontSize', 8, 'Color', 'red');