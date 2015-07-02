function main(string)

    % Generate a dataset 
    rng(0)
    [X, count, truth] = string2data(string, 100, 15);
    n = size(X, 1);
    disp('Visualize the dataset. Press any key to continue...')
    pause

    % Run unpenalized LTSS and SVM for comparison
    disp('Running unpenalized LTSS and SVM...')
    spatial_label = svm(X, count, 5, 2000);
    fprintf('Spatial Accuracy:%f\n', sum(spatial_label==truth) ./ n)
    disp('Press any key to continue...')
    pause
    
    % Run Support Vector Subset Scan
    disp('Running Support Vector Subset Scan')
    [label, spatial_label] = svss(X, count, 5, 0.0005, 2);
    fprintf('Accuracy:%f\n', sum(label==truth) ./ n)
    fprintf('Spatial Accuracy:%f\n', sum(spatial_label==truth) ./ n)
end