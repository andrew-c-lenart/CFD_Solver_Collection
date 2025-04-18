function [f,u,v,r,error] = iterativeSolver(f,N,n,c,w,cs,ULid,omega,r,u,v)
uOld = u;
vOld = v;
rOld = r;
for i = 1:N 
        for j = 1:N 
            UMag = (u.^2 + v.^2); %Calculate U Squared (Each component Squared)
            for k = 1:9
                cdotu = c(k,1) .* u(j,i) + c(k,2).* v(j,i); %Calculate C Dot U
                cdotu2 = cdotu ^ 2; 
                feq = r(j,i).*w(k) * (1 + cdotu / (cs^2) + cdotu2 / 2 / (cs^4) - UMag(j,i)/2/(cs^2)); %Calculate FEq
                f(k,j,i) = f(k,j,i) .* (1-omega) + feq*omega; %Calculate the new f
            end
        end
end
    f = streaming(f,N);
    f = boundaryConditions(f,ULid,N);
    
    


error(1:3) = 0;
%% Calculate Macroscopic properties such as velocity and rho
for i = 1:N
        for j = 1:N 
            rSum = 0;
            ruSum = 0;
            rvSum = 0;
            for k = 1:9
                rSum = rSum + f(k,j,i);
                ruSum = ruSum + f(k,j,i) * c(k,1);
                rvSum = rvSum + f(k,j,i) * c(k,2);
            end
            r(j,i) = rSum;
            u(j,i) = ruSum / rSum;
            v(j,i) = rvSum / rSum;

            error(1) = error(1) + (u(j,i) - uOld(j,i)).^2;
            error(2) = error(2) + (v(j,i) - vOld(j,i)).^2;
            error(3) = error(3) + (r(j,i) - rOld(j,i)).^2;
        end
end
error = sqrt(error)./((N).^2); %Calculate Error
error = max(error)
end
    

