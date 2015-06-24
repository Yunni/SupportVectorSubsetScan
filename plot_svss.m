function [ ] = plot_svss( X, label, model)
% Plot the the result of Support Vector Subset Scan

    % Plot the detected and undetected data points
    plot(X(label==1, 1), X(label==1, 2), 'b.', X(label<=0, 1), X(label<=0, 2), 'c.')
    hold on
    plot(X([model.fsv_ind], 1), X([model.fsv_ind], 2), 'ro')

    % Plot the contour of the detected region
    [x1Grid,x2Grid] = meshgrid(0:0.2:max(X(:,1)),0:0.2:max(X(:,2)));
    xGrid = [x1Grid(:),x2Grid(:)];
    scores = model.r2 - dist_from_center(xGrid,model);
    contour(x1Grid,x2Grid,-reshape(scores,size(x1Grid)), [0 0],'k');
    axis equal
    axis([0, max(X(:,1)), 0, max(X(:,2))])
    legend('Positive', 'Negative', 'Free Support Vector')
    hold off

end