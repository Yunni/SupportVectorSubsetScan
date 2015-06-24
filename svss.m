function [label] = svss(X, count, gamma, C0, C1)
% Run support vector subset scan algorithm.

    n = size(X, 1);

    % Assign the model parameters
    options.ker = 'rbf';
    options.gamma = gamma;
    options.C0 = C0;
    options.C1 = C1;
    options.C = options.C1 ./ options.C0;

    % Alternatively optimize the model
    delta = zeros(n, 1);
    last_obj = 0;
    obj = 1;
    while abs(last_obj - obj) > 10 ^ -7
        last_obj = obj;
        label = ltss(count, options.C1 * delta);
        [delta, model, fval] = support_vector(X, label, options);
        plot_svss(X, label, model)
        obj = f(count(label==1,:), 0) + options.C0 * fval;
        pause(1)
    end
    
    % Use SVM to learn the decision boundry
    cl = fitcsvm(X,label,'KernelFunction','rbf', 'KernelScale', 5,'BoxConstraint',1000,'ClassNames',[-1,1]);
    plot_svm( X, label, cl)
    
end