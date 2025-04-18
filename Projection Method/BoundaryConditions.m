function [P,U,V] = BoundaryConditions(P,U,V,VWall)
    % No pressure gradient at inlet condition
    P(1,:) = P(2,:);
    P(end,:) = P(end-1,:);
    P(:,1) = P(:,2);
    P(:,end) = P(:,end-1);


    %Top wall
    U(1,:) = 2*VWall - U(2,:);
    V(1,:) = 0;

    %Right Wall
    U(:,end) = 0;
    V(:,end) = -V(:,end-1);

    %Left Wall
    U(:,1) = 0;
    V(:,1) = -V(:,2);

    %Bottom Wall
    V(end,:) = 0;
    U(end,:) = -U(end-1,:);
end
