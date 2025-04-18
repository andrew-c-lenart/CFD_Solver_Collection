function [T,counter,resid,time] = SOR(T,gridSize,U,V,alpha,rho,delta,deltaT)
%Assuming going down to up%
error = 100000;
const2 = .25;
counter = 0;
convergenceCrit = (3.5)*10^(-3)
tic;
p = 1;
while error > convergenceCrit
    

    TOld = T;
    TOld2 = TOld;
    residTemp = 0;
    insidePoints = 0;
for j = 2:gridSize-1
    for i = 2:(gridSize - 1)
            u_e = U(j,i);
            u_w = U(j,i-1);
            v_n = V(j-1,i);
            v_s = V(j,i);

            Q(j,i) = const2*rho*delta/deltaT * (u_e-u_w+v_n-v_s);
            
            T(j,i) = (1-alpha)*T(j,i) + alpha*(-Q(j,i) +const2 * (TOld(j,i-1)+ TOld(j,i+1) +TOld(j-1,i) + TOld(j+1,i)));
            % T(j,i) = (1-alpha).*T(j,i) + alpha .* (const2 * TOld(j,i-1) +const2 * TOld(j,i+1) + const2 * TOld(j-1,i) +const2 * TOld(j+1,i) - Q(j,i) );
            TOld(j,i) = T(j,i);
        
    end
end


%     resid(counter) = sqrt(residTemp)/(gridSize.^2);
% 
% 
% 
TDiff = (T - TOld2).^2;
TDiff = sum(sum(TDiff));
error = sqrt(TDiff)/(gridSize^2);
% error = error

% if error > convergenceCrit
%         p = p + 1
%     else
%         p = 1
%     end
% end
% time = toc;
end
end

