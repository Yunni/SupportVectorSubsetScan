function [spatial_label] = svm( X, count, gamma, C )
% Run Linear Time Subset Scan and than SVM algorithm

    num_points = size(X, 1);

    % Run LTSS and fit a SVM model
    label = ltss(count, zeros(num_points, 1));
    cl = fitcsvm(X,label,'KernelFunction','rbf', 'KernelScale', gamma,'BoxConstraint',C,'ClassNames',[-1,1]);
    spatial_label = plot_svm( X, label, cl);

end

