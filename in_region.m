function [bool] = in_region(coordinate)
% Define an abnormal region to generated datasets
    dis1 = (coordinate(:, 1) - 0.5) .^ 2 + (coordinate(:, 2) + 0.5) .^ 2;
    dis2 = (coordinate(:, 1) + 0.5) .^ 2 + (coordinate(:, 2) + 0.5) .^ 2;
    dis3 = (coordinate(:, 1) + 0.5) .^ 2 + (coordinate(:, 2) - 0.5) .^ 2;
    bool = (dis1 > 0.12 & dis1 < 0.42 & coordinate(:, 2) > -0.5) | (dis2 > 0.12 & dis2 < 0.42 &coordinate(:, 2) < -0.5) | (dis3 > 0.16 & dis3 < 0.36);
end