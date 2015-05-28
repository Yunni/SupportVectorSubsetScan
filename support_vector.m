function [ delta, model, fval ] = support_vector( X, label, options)
% Support Vector Step: Learn support vectors to seperate detected and
% undetected data points
% Return delta(bonus/penalty for all data points), model(model opject)
[num_data, dim] = size(X);

% Define a quadratic programming problem and optimize it
K = kernel( X', 'rbf', options.gamma ) .* (label * label');
f = -diag(K) .* label;
H=2*K;
b=options.C;
I=(1:1:num_data)';
[mu, fval, ~] = qpssvm(H,f,b,I);

% Store the optimization results of the model
inx= find(mu > 0);
model.mu = mu(inx);
model.fsv_ind=find(mu > 0&mu < options.C-10^(-7)); %free support vectors
model.bsv_ind=find(mu >= options.C-10^(-7)); % bounded support vectors
model.sv.X= X(inx, :);
model.sv.label = label(inx, :)';
model.sv.inx = inx;
if size(model.fsv_ind, 1) < 1
    error('Model not seperable. Try other parameters.')
end
model.options = options;
model.b = mu(inx)'*(K(inx,inx) .* (model.sv.label' * model.sv.label)) *mu(inx);
model.r2 = mean(dist_from_center(X(model.fsv_ind, :),model));

% Bonus/Penalty of each data points
delta = model.r2 - dist_from_center(X, model);

end

