function plotting(P,U,V,xCoords,yCoords,xCoordsXVel,yCoordsXVel, xCoordsYVel,yCoordsYVel)

figure
contourf(xCoordsXVel(2:end-1,2:end-1), yCoordsXVel(2:end-1,2:end-1), U(2:end-1,2:end-1), 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;
colorbarHandle.Label.String = 'X Velocity [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

figure
contourf(xCoords, yCoords, P, 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;
colorbarHandle.Label.String = 'Pressure [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

figure
contourf(xCoordsYVel(2:end-1,2:end-1), yCoordsYVel(2:end-1,2:end-1), V(2:end-1,2:end-1), 9, 'LineColor', 'none'); % 20 contour levels
colormap(jet)
colorbarHandle = colorbar;
colorbarHandle.Label.String = 'Y Velocity [-]';
xlabel('X [-]');
ylabel('Y [-]');
axis equal; % Set equal scaling for both axes

figure
% Define a regular grid for interpolation
[Xq, Yq] = meshgrid(linspace(min(xCoords(1,:)), max(xCoords(1,:)), 30), linspace(min(yCoords(:,1)), max(yCoords(:,1)), 30));

% Interpolate u and v onto the regular grid
Uq = griddata(xCoordsXVel(2:end-1,2:end-1), yCoordsXVel(2:end-1,2:end-1), U(2:end-1,2:end-1), Xq, Yq, 'linear');
Vq = griddata(xCoordsYVel(2:end-1,2:end-1),  yCoordsYVel(2:end-1,2:end-1), V(2:end-1,2:end-1), Xq, Yq, 'linear');

% Plot streamlines
streamslice(Xq, Yq, Uq, Vq);
axis equal;
xlabel('X [-]');
ylabel('Y [-]');