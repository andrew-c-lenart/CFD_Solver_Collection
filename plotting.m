function plotting(xCoords,yCoords,U,N)

%% STREAMLINES

figure

U2 = U(2:end-1, 2:end-1, 2);
U3 = U(2:end-1, 2:end-1, 3);

streamslice(xCoords, yCoords,U2, U3,1.6);

xlabel('X [-]');
ylabel('Y [-]');
axis equal;
%% CONTOUR PLOTS

figure;
contourf(xCoords, yCoords, U(2:end-1,2:end-1,1), 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;


colorbarHandle.Label.String = 'Pressure [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

% Create the contour plot
figure;
contourf(xCoords, yCoords, U(2:end-1,2:end-1,2), 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;

% Labeling the colorbar
colorbarHandle.Label.String = 'U Velocity [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

% % Create the contour plot
figure;
contourf(xCoords, yCoords, U(2:end-1,2:end-1,3), 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;

% Labeling the colorbar
colorbarHandle.Label.String = 'V Velocity [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

