clear
clc

% Generate a dataset 
rng(1)
n=1000;
[X, count] = gen_data(n, 100, 20);

% Assign the model parameters
options.ker = 'rbf';
options.gamma = 0.4;
options.C0 = 400;
options.C1 = 40;
options.C = options.C1 ./ options.C0;

% Alternatively optimize the model
delta = zeros(n, 1);
last_obj = 0;
obj = 1;
while abs(last_obj - obj) > 10 ^ -7
    last_obj = obj;
    label = ltss(count, options.C1 * delta);
    [delta, model, fval] = support_vector(X, label, options);
    plot_result(X, label, model)
    obj = f(count(label==1,:), 0) + options.C0 * fval;
    %pause
end