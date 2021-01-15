function [ yhat, stats ] = cps( y, X )
% Composite-plus-scale: proxies weighted by r^2
%   y: Instrumental climate series (fill with NaNs for reconstruction)
%   X: Array of proxies (same number of rows as y, any number of columns)

[n, ~] = size(X);

r = corr(X, y, 'rows','pairwise')';
r2 = r.^2;
rsig = sign(r);

r2_array = repmat(r2, n, 1);
rsig_array = repmat(rsig, n, 1);

idx = nansum(X .* r2_array .* rsig_array, 2);
ind = ~isnan(idx) & ~isnan(y);

xbar = mean(idx(ind));
xstd = std(idx(ind));
idx = (idx - xbar) / xstd;

ybar = mean(y(ind));
ystd = std(y(ind));
yhat = idx*ystd + ybar;

[stats.r, stats.p] = corr(y, yhat, 'rows','pairwise');
stats.r2vs = 2*abs( stats.r ) - 1;
stats.rmse = sqrt( nanmean( (y-yhat).^2 ) );
stats.mae = nanmean( abs(y-yhat) );

end

