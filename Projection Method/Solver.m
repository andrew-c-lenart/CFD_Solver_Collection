function [P,U,V] = Solver(P,U,V,deltaT,rho,visc,N,delta,VWall)
eMax = 1e-6;
error = 1e6;
p = 1;
while error > eMax %While the error is greater than the threshold
% while p < 30000 
    p =   p+1 %count iterations
    POld = P;
    UOld = U;
    VOld = V; %store old values

    [P,U,V] = BoundaryConditions(P,U,V,VWall); %Enable boundary conditions

    % Get U and V Star Values
    UStar = XMomentum(P,U,V,N,visc,delta,deltaT,rho);
    VStar = YMomentum(P,U,V,N,visc,delta,deltaT,rho);
    % Calculate pressure and correct velocities
    [P,U,V] = Pressure(P,UStar,VStar,deltaT,rho,N,delta,U,V);
    
    error(1:3) = 0;
    %Calculate Errors
      for j = 2:(N-1)
      for i = 2:(N-1)

                error(1) = error(1) + (U(j,i) - UOld(j,i)).^2;
                error(2) = error(2) + (V(j,i) - VOld(j,i)).^2;
                error(3) = error(3) + (P(j,i) - POld(j,i)).^2;
        end
      end
    error = sqrt(error)./((N-2).^2);
    error = max(error)


end
