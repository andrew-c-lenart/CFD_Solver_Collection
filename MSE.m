function error = MSE(N,phi,phi_actual)
%finds the mean squared error for a given analytic function and numerical
%results
    sum = 0;
    for x = 1:length(phi)
        sum = (phi(x) - phi_actual(x))^2 + sum;
    end

    error = sum;
end

        