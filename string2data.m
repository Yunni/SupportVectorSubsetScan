function [ X, count, label] = string2data( string, baseline, increment )
% Generate a dataset use a string as its shape

    % Get the image of the string
    img = 1 - text2im(string)';
    num_points = 1000 * length(string);
    
    % Generate a number of datapoint
    [width, height] = size(img);
    X1 = rand(num_points, 1) .* width;
    X2 = rand(num_points, 1) .* height;
    X = [X1 X2];
    
    % Generate the count of each data points according to its position
    roundx = max(round(X), 1);
    label = diag(img(roundx(:, 1), height + 1 - roundx(:, 2)));
    count = [baseline * ones(num_points, 1), poissrnd(baseline + increment * label, num_points, 1)];
    
    % Plot the dataset
    plot(X(label==1, 1), X(label==1, 2), 'b.', X(label==0, 1), X(label==0, 2), 'c.')
    axis equal
    axis([0, width, 0, height])
    legend('Poisson(115)', 'Possion(100)')
    
    label = 2 .* label - 1;

end

