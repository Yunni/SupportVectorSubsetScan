function [best_subset] = ltss(count, bonus)
% Penalized Linear Subset Scan Step
    q = find_q(count, bonus);
    numq = size(q, 1);

    % Find the most abnormal subset
    best_score = 0; 
    for i = 1:1:numq -1
        interval = [q(i), q(i + 1)];
        f1 = count(:, 2) .* log(interval(1)) + count(:, 1) .* (1 - interval(1)) + bonus;
        f2 = count(:, 2) .* log(interval(2)) + count(:, 1) .* (1 - interval(2)) + bonus;
        subset = f1 + f2 > 0;
        if max(subset) < 1
            continue
        end
        score = f(count(subset, :), bonus(subset, :));
        if score > best_score
            best_score = score;
            best_subset = subset * 2 - 1;
        end
    end
end