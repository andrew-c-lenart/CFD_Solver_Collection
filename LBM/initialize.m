function [grid,u,v,r] = initialize(N,n,c,w,cs,ULid)
    %Initializes the velocity, density, and f grid
    grid = [1:n,N,N];
    u = zeros(N,N);
    v = zeros(N,N);
    r = ones(N,N);
    

    for i = 1:N 
        for j = 1:N 
            UMag = (u.^2 + v.^2);
            for k = 1:9
                cdotu = c(k,1) .* u(j,i) + c(k,2).* v(j,i);
                cdotu2 = cdotu .^ 2;
                grid(k,j,i) = r(j,i).*w(k) * (1 + cdotu / cs^2 + cdotu2 / 2 / cs^4 - UMag(j,i)/2/(cs^2));
            end
        end
    end
    grid = boundaryConditions(grid,ULid,N);
end