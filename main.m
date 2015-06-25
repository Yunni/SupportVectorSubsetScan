function main(string)

    % Generate a dataset 
    rng(2)
    [X, count, truth] = string2data(string, 100, 20);%[X, count] = gen_data(n, 100, 20);
    n = size(X, 1);
    disp('Visualize the dataset. Press any key to continue...')
    pause

    % Run unpenalized LTSS and SVM for comparison
    disp('Running unpenalized LTSS and original SVM...')
    spatial_label = svm(X, count, 5, 1000);
    fprintf('Spatial Accuracy:%f\n', sum(spatial_label==truth) ./ n)
    disp('Press any key to continue...')
    pause
    
    % Run Support Vector Subset Scan
    disp('Running Support Vector Subset Scan')
    label = svss(X, count, 3, 600, 50);
    fprintf('Last LTSS Step Accuracy:%f\n', sum(label==truth) ./ n)

    % Use SVM to learn the decision boundry
    cl = fitcsvm(X,label,'KernelFunction','rbf', 'KernelScale', 5,'BoxConstraint',1000,'ClassNames',[-1,1]);
    spatial_label = plot_svm( X, label, cl);
    fprintf('Spatial Accuracy:%f\n', sum(spatial_label==truth) ./ n)

end