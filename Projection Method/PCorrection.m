function [U,V] = PCorrection(UStar,VStar,P,deltaT,rho,delta,N,U,V)
% Corrects the U and V star velocities based on the pressure field
    for y = 2:N-1
        for x = 2:N-1
            U(y,x) = UStar(y,x) - deltaT/rho/delta*(P(y,x+1) - P(y,x)); 
            V(y,x) = VStar(y,x) - deltaT/rho/delta*( P(y,x) - P(y+1,x));
        end
    end