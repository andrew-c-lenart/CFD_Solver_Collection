function f = boundaryConditions(f,ULid,N)
%Bounceback boundary condition for all nodes at the walls
%Bounceback with transfer of momentum for top wall
    %Right Wall
    f(3+1,:,end) = f(1+1,:,end);
    f(7+1,:,end) = f(5+1,:,end);
    f(6+1,:,end) = f(8+1,:,end);

    %Left Wall
    f(1+1,:,1) = f(3+1,:,1);
    f(5+1,:,1) = f(7+1,:,1);
    f(8+1,:,1) = f(6+1,:,1);

    %Bottom Wall
    f(2+1,end,:) = f(4+1,end,:);
    f(5+1,end,:) = f(7+1,end,:);
    f(6+1,end,:) = f(8+1,end,:);

    %Top Wall
    for i = 2:N-1
    rho = f(0+1,1,i)+f(1+1,1,i)+f(3+1,1,i)+2*(f(2+1,1,i)+f(6+1,1,i)+f(5+1,1,i));
    f(4+1,1,i) = f(2+1,1,i);
    f(7+1,1,i) = f(5+1,1,i) - 1/6 * rho * ULid;
    f(8+1,1,i) = f(6+1,1,i) + 1/6 * rho * ULid;
    end
    end