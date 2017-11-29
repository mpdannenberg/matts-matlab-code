function [ a, b, p, sims ] = TheilSen( x, y , showplot, nsims)
%Theil-Sen estimate of slope, intercept, and CI of slope
%   x: independent variable
%   y: dependent variable
%   alpha: significance-level of CI
%   a: slope
%   b: intercept
%   ci: confidence interval of slope

if exist('nsims')~=1
    nsims = 10000;
end

n = length(x);

idx = combnk(1:n, 2); % get all possible pairs

x2 = NaN(size(idx));
y2 = NaN(size(idx));

for i = 1:n
    
    x2(idx==i) = x(i);
    y2(idx==i) = y(i);
    
end

dx = x2(:, 1) - x2(:, 2);
dy = y2(:, 1) - y2(:, 2);

a = nanmedian(dy ./ dx);

b = median(y) - a*median(x);

if nsims>0
    % Significance
    sims = NaN(1,nsims);
    for sim = 1:nsims
        if size(idx, 1) > 10000
            idx2 = idx(randperm(size(idx, 1), 10000), :);
        else
            idx2 = idx;
        end
        yperm = y(randperm(n));
        x2 = NaN(size(idx2));
        y2 = NaN(size(idx2));
        for i = 1:n

            x2(idx2==i) = x(i);
            y2(idx2==i) = yperm(i);

        end

        dx = x2(:, 1) - x2(:, 2);
        dy = y2(:, 1) - y2(:, 2);

        sims(sim) = nanmedian(dy ./ dx);

    end
    p = sum(abs(sims)>abs(a)) / nsims;
end


if showplot==1
    
    figure('Color','w')
    set(gcf, 'Position',[174   551   560   420]);
    plot(x, y, 'ko');
    hold on;
    plot([min(x) max(x)], [b+min(x)*a b+max(x)*a], 'r-');
    hold off;
    
    figure('Color','w')
    set(gcf, 'Position',[174   43   560   420]);
    histogram(sims);
    hold on;
    ylim = get(gca, 'YLim');
    plot([a a], ylim, 'r-');
    hold off;
end


end

