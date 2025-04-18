function UStar = XMomentum(P,U,V,N,visc,delta,deltaT,rho);
% Calculate U star value for iteration
    UStar = U;
    for y = 2:N-1
        for x = 2:N-2
            % Set points in all directions
            U_P = U(y,x);
            U_W = U(y,x-1);
            U_E = U(y,x+1);
            U_N = U(y-1,x);
            U_S = U(y+1,x);

            V_ne = V(y-1,x+1);
            V_nw = V(y-1,x);
            V_se = V(y,x+1);
            V_sw = V(y,x);
            
            % we do not solve for P here, can change it
            P_e = 0;% P(y,x+1);
            P_w = 0; % P(y,x);
            
            % Calculate all components of equation
            tau_xx_dx = 2 * visc * (U_E-2*U_P+U_W) / (delta^2);
            tau_xy_north = visc*( (V_ne - V_nw)/delta + (U_N - U_P)/delta);
            tau_xy_south = visc*( (V_se - V_sw)/delta + (U_P - U_S)/delta);
            tau_xy_dy = (tau_xy_north-tau_xy_south)/delta;

            delta_uu_x = ((U_E+U_P)^2-(U_W+U_P)^2) / (4*delta);
            delta_uv_y = ((U_P+U_N)*(V_nw+V_ne) - (U_P+U_S)*(V_sw+V_se)) / (4*delta);

            dpdx = (P_e-P_w) / delta;

            % Calculate U Star
            UStar(y,x) = U(y,x) + deltaT/rho * (-rho*delta_uu_x - rho*delta_uv_y - dpdx + tau_xx_dx + tau_xy_dy);

        end
    end

