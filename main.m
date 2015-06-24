% Generate a dataset 
rng(1)
[X, count, truth] = string2data( 'Hello', 100, 20);%[X, count] = gen_data(n, 100, 20);
disp('Visualize the dataset. Press any key to continue...')

disp('Running LTSS and SVM...')
svm(X, count, 5, 1000)
disp('Press any key to continue...')

disp('Running Support Vector Subset Scan')
label = svss(X, count, 3, 600, 50);
disp('Press any key to continue...')

fprintf('Accuracy:%f\n', sum(label==truth) ./ n)
