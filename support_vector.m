function [ delta, model, fval ] = support_vector( X, label, options)
% SVM Step: Learn support vectors to seperate detected and
% undetected data points
% Return delta(bonus/penalty for all data points), model(model opject)
   
    model = fitcsvm(X,label,'KernelFunction','rbf', 'KernelScale', options.gamma,'BoxConstraint',options.C);
    [~, Score] = predict(model,X);
    xi = Score(:, 2);
    delta = (xi > -1) .* (xi + 1) + (xi < 1) .* (xi - 1);
    fval = model.ConvergenceInfo.Objective;

end

