function [ X, count, truth ] = gen_data( num_data, baseline, increment )
% Generate a dataset to do experiment
% Return X (the coordinates of datapoints), count (the expected counts and the observed counts)
    X = rand(num_data, 2) .* 2 - 1;
    count = [baseline * ones(num_data, 1), poissrnd(baseline + increment * in_region(X), num_data, 1)];
    truth = 2 .* in_region(X) - 1;

    % Plot the dataset
    plot(X(in_region(X), 1), X(in_region(X), 2), 'b.', X(~in_region(X), 1), X(~in_region(X), 2), 'c.')
    axis equal
    axis([min(X(:,1)), max(X(:,1)), min(X(:,1)), max(X(:,2))])
    legend('Poisson(120)', 'Possion(100)')
    
end

