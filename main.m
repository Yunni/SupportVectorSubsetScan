function main(string)

    % Generate a dataset 
    rng(2)
    [X, count, truth] = string2data(string, 100, 20);%[X, count] = gen_data(n, 100, 20);
    disp('Visualize the dataset. Press any key to continue...')

    % Run unpenalized LTSS and SVM for comparison
    disp('Running unpenalized LTSS and original SVM...')
    svm(X, count, 5, 1000)
    disp('Press any key to continue...')

    % Run Support Vector Subset Scan
    disp('Running Support Vector Subset Scan')
    label = svss(X, count, 3, 600, 50);

    % Use SVM to learn the decision boundry
    cl = fitcsvm(X,label,'KernelFunction','rbf', 'KernelScale', 5,'BoxConstraint',1000,'ClassNames',[-1,1]);
    plot_svm( X, label, cl)
    disp('Press any key to continue...')

    % Compute the accuracy
    n = size(X, 1);
    fprintf('Accuracy:%f\n', sum(label==truth) ./ n)

end