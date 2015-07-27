function [label, spatial_label] = svss(X, count, gamma, C0, C1)
% Run support vector subset scan algorithm.

    n = size(X, 1);

    % Assign the model parameters
    options.ker = 'rbf';
    options.gamma = gamma;
    options.C0 = C0;
    options.C1 = C1;
    options.C = options.C0 ./ options.C1;

    % Alternatively optimize the model
    delta = zeros(n, 1);
    last_obj = 0;
    obj = 1;
    while abs(last_obj - obj) > 10 ^ -7
        last_obj = obj;
        label = ltss(count, options.C * delta);
        if count(label==1,:) <= 0
            printf('No sites are abnormal!\n');
            break
        end
        [delta, model, fval] = support_vector(X, label, options);
        spatial_label = plot_svm(X, label, model);
        obj = fval - options.C1 .* f(count(label==1,:), 0);
        pause(1)
    end
end