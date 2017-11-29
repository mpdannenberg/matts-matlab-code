function [ yhat, r2, stats ] = cps( y, X, years )
% Composite-plus-scale: proxies weighted by r^2
%   y: Instrumental climate series (fill with NaNs for reconstruction)
%   X: Array of proxies (same number of rows as y, any number of columns)

[n, ~] = size(X);
ybar = nanmean(y);
ystd = nanstd(y);

% XBAR = mean(X(~isnan(y), :));
% XSTD = std(X(~isnan(y), :));
% 
% X = (X - repmat(XBAR, n, 1)) ./ repmat(XSTD, n, 1);

X = zscore(X); % All predictors must be on common scale prior to compositing

r = corr(X(~isnan(y), :), y(~isnan(y)))';
r2 = r.^2;
rsig = sign(r);

r2_array = repmat(r2, n, 1);
rsig_array = repmat(rsig, n, 1);

idx = sum(X .* r2_array .* rsig_array, 2);
xbar = mean(idx(~isnan(y)));
xstd = std(idx(~isnan(y)));
idx = (idx - xbar) / xstd;

yhat = idx*ystd + ybar;

% [ptot, plow, phigh, pcttot, pctlow, pcthigh] = evc(y, yhat, years);

idx = ~isnan(y);
[stats.r, stats.p] = corr(y(idx), yhat(idx));
stats.r2vs = 2*abs( stats.r ) - 1;
stats.rmse = sqrt( mean( (y(idx)-yhat(idx)).^2 ) );
% stats.evc = [pcttot pctlow pcthigh];
% stats.evc_p = [ptot plow phigh]; 

end

