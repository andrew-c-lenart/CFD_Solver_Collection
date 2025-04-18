function slope = logslope(x,y)
%Comments copied from homework 2 and 3
log_x = log(x);
log_y = log(y);

% Step 2: Perform linear regression on the log-transformed data
coeffs = polyfit(log_x, log_y, 1);  % First-degree polynomial fit (linear fit)

% Step 3: The slope is the first coefficient
slope = coeffs(1);

