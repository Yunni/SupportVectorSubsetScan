function [ q ] = find_q( x, xi )
% Use Newton Raphson's methods to find all intervals for penalized LTSS
% Return a sorted array of q
    num_points = size(x, 1);
    mu = repmat(x(:, 1), 2, 1);
    x = repmat(x(:, 2), 2, 1);
    xi = repmat(xi, 2, 1);

    % Use 1 and 10^7 for the intial guess
    q1 = 10^7 * ones(num_points, 1);
    q2 = 1 * ones(num_points, 1);
    q = [q1; q2];
    
    % Use Newton Raphson's methods to find all zero points of q
    for i = 1:1:5000
        f = x .* log(q) + mu .* (1 - q) + xi;
        f_d = x ./ q - mu;
        q = q - f ./ f_d;
        q(q < 1 | f_d == 0) = 1;
    end
    q = sort(unique(q));

end