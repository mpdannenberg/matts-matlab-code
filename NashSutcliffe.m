function [ E ] = NashSutcliffe( yhat, y )
% Nash-Sutcliffe model efficiency coefficient: ranges from -inf to 1, with
% 1 being a perfect match between models and observations

%   yhat: modeled variable 
%   y: observed variable

sse = nansum( (yhat - y).^2 );
ssd = nansum( (y - nanmean(y)).^2 );
E = 1 - sse/ssd;

end

