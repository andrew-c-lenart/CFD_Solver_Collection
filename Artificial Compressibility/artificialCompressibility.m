function U = artificialCompressibility(grid,eMax,PlateVel,Re,D,beta,N,delta,deltaT)

grid{2}(1,:) = PlateVel*2; %Set top points to be twice plate velocity, preset the ghost nodes (helps with simulation)

U(:,:,1) = grid{1};
U(:,:,2) = grid{2};
U(:,:,3) = grid{3}; %Translate the grid to a more efficient way of storage
UNew = U;
p = 0;
error = 1e6;
while error > eMax
   
    U = UNew;
    p =  p+1
    
%Boundary Conditions
    %top wall    
    U(1,2:end-1,1) = U(2,2:end-1,1) ;
    U(1,2:end-1,2) = 2 * PlateVel - U(2,2:end-1,2);  % Lid velocity
    U(1,2:end-1,3) = -U(2,2:end-1,3);  % y-velocity at top
    
    %bottom wall
    U(end,2:end-1,1) = U(end-1,2:end-1,1);
    U(end,2:end-1,2) =  -U(end-1,2:end-1,2);
    U(end,2:end-1,3) = -U(end-1,2:end-1,3);
    
    %right wall
    U(2:end-1,end,1) = U(2:end-1,end-1,1);
    U(2:end-1,end,2) = -U(2:end-1,end-1,2);
    U(2:end-1,end,3) = -U(2:end-1,end-1,3);

    %left wall
    U(2:end-1,1,1) = U(2:end-1,2,1);
    U(2:end-1,1,2) =  -U(2:end-1,2,2);
    U(2:end-1,1,3) =  -U(2:end-1,2,3);



%Calculate Constants

    E(:,:,1) = U(:,:,2)./beta;
    E(:,:,2) = U(:,:,1) + U(:,:,2).^2;
    E(:,:,3) = U(:,:,2) .* U(:,:,3);
            
    F(:,:,1) = U(:,:,3)./beta;
    F(:,:,2) = U(:,:,2) .* U(:,:,3);
    F(:,:,3) = U(:,:,1) + U(:,:,3).^2;
    
    error(1:3) = 0;
    % Update velocities using finite difference and artificial compressibility
    for j = 2:(N-1)
        for i = 2:(N-1)
            for k = 1:3
                deltaE = (E(j, i+1, k) - E(j, i-1, k)) ./ (2 * delta);
                deltaF = (F(j-1, i, k) - F(j+1, i, k)) ./ (2 * delta);
                deltaUx = (U(j, i+1, k) - 2 .* U(j, i, k) + U(j, i-1, k)) ./ (delta.^2);
                deltaUy = (U(j+1, i, k) - 2 .* U(j, i, k) + U(j-1, i, k)) ./ (delta.^2);

                deltaU = deltaT .* (-deltaE - deltaF + (1 ./ Re) .* D(k) .* (deltaUx + deltaUy));
                UNew(j, i, k) = U(j, i, k) + deltaU;
                error(k) = error(k) + ((UNew(j,i,k) - U(j,i,k))).^2;
            end
        end
    end
    error = sqrt(error)./((N-2).^2);
    error = max(error)


if p > 300000 %Exits loop if error isnt achieved in 300k iterations
        error = 1e-100;
end
end