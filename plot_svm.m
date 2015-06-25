function [ spatial_label ] = plot_svm( X, label, cl)
% Plot the the result of SVM

% Plot the data and the decision boundary
    d = 0.2;
    [x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),min(X(:,2)):d:max(X(:,2)));
    xGrid = [x1Grid(:),x2Grid(:)];
    [~,scores] = predict(cl,xGrid);

    h(1:2) = gscatter(X(:,1),X(:,2),label,'cb','.');
    hold on
    contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)), [0, 0],'k');
    legend(h,{'Negative','Positive'});
    axis equal
    axis([0, max(X(:,1)), 0, max(X(:,2))])
    hold off
    
 % Compute the spatial label
    spatial_label = predict(cl,X);

end    