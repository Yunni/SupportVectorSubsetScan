function d=dist_from_center(X,model)
% The distance of the data points from the center
% Return a array of size n, where n is the number of rows in X
    num_data =size(X, 1);
    x2 = diagker( X', model.options.ker, model.options.gamma);
    Ksvx = kernel( X', model.sv.X', model.options.ker, model.options.gamma) .* (ones(num_data,1) * model.sv.label);
    d = x2 - 2*Ksvx*model.mu + model.b*ones(num_data,1) ;
end