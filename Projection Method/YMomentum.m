function VStar = YMomentum(P,U,V,N,visc,delta,deltaT,rho);
%Same as X Momentum but for Y Direction
    VStar = V;
    for y = 2:N-2
        for x = 2:N-1
            V_P = V(y,x);
            V_N = V(y-1,x);
            V_S = V(y+1,x);
            V_E = V(y,x+1);
            V_W = V(y,x-1);

            U_ne = U(y,x);
            U_nw = U(y,x-1);
            U_se = U(y+1,x);
            U_sw = U(y+1,x-1);

            P_N = 0; % P(y,x);
            P_S = 0; %P(y+1,x);

            tau_yy_dy = 2 * visc * (V_N-2*V_P+V_S) / (delta^2);
            tau_xy_east = visc*( (V_E - V_P)/delta + (U_ne - U_se)/delta);
            tau_xy_west = visc*( (V_P - V_W)/delta + (U_nw - U_sw)/delta);
            tau_xy_dx = (tau_xy_east-tau_xy_west)/delta;

            delta_vv_y = ((V_N+V_P)^2-(V_P+V_S)^2) / (4*delta);

            U_e = (U_ne+U_se)/2;
            V_e = (V_E+V_P)/2;
            U_w = (U_nw+U_sw)/2;
            V_w = (V_P+V_W)/2;

            delta_uv_x = (U_e*V_e - U_w*V_w)/delta;

            dpdy = (P_N-P_S) / delta;


            VStar(y,x) = V(y,x) + deltaT/rho * (-rho*delta_uv_x - rho*delta_vv_y - dpdy + tau_xy_dx + tau_yy_dy);

        end
    end