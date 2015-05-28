function [f] = f(count, bonus)
% The objective function for the LTSS Step
% Return: a float value of the objective function
    f = sum(count(:, 2)) * log(sum(count(:, 2)) / sum(count(:, 1))) - sum(count(:, 2)) + sum(count(:, 1)) + sum(bonus);
end