function [T,counter,resid,time,spatialError] = gaussSeidel(convergenceCrit,T,gridSize,const2,const3,Q)
%Assuming going down to up%
error = 100000;
counter = 0;
tic;
while error > convergenceCrit %Set convergence criterion statement
    TOld = T; %Save previous temp profile
    TOld2 = TOld; %save it in a 2nd location for later
    residTemp = 0;
    insidePoints = 0;

for j = 1:gridSize
    for i = 2:(gridSize - 1)
        if j == 1
            T(j,i) = TOld(j+1,i);
            TOld(j,i) = T(j,i); %same boundary conditions as before, but now update old temp profile with new temps
        elseif j == gridSize
            T(j,i) = TOld(j-1,i);
            TOld(j,i) = T(j,i);
        else
            %TOld is updated with each temp update, so it automatically
            %takes the newest updated temp if possible
            T(j,i) = Q(j,i) / const2 -const3 * TOld(j,i-1) -const3 * TOld(j,i+1) -const3 * TOld(j-1,i) -const3 * TOld(j+1,i);
            TOld(j,i) = T(j,i);
        end
    end
end
%Calculating residual
    for j = 1:gridSize
    for i = 2:(gridSize - 1)
        if j == 1
            
        elseif j == gridSize
            
        else
            QExp =1.* ((T(j,i-1) + T(j,i+1) + T(j-1,i) + T(j+1,i)).*const2.*const3 + const2 .* T(j,i));
            residTemp = residTemp + (Q(j,i)- QExp).^2;
            insidePoints = insidePoints + 1;
        end
    end
    end
    counter  = counter+1;
    resid(counter) = sqrt(residTemp)/(insidePoints);

    TDiff = (T - TOld2).^2;
    TDiff = sum(sum(TDiff));
    error = sqrt(TDiff)/(gridSize^2);

end


time = toc;
end
