function [P,U,V] = Pressure(P,UStar,VStar,deltaT,rho,N,delta,U,V) 
    % Call SOR to calculate the new P, and then correct velocities
    P = SOR(P,N,UStar,VStar,0.7,rho,delta,deltaT);
    [U,V] = PCorrection(UStar,VStar,P,deltaT,rho,delta,N,U,V);
end
    