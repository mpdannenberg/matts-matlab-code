function [ extremePct, p ] = extremeResponse( trw, clim, extremeThresh )
%Evaluate response of tree-ring widths to extreme climate
%   Calculate percentage of extreme climate years that are also extreme
%   ring width years

if exist('extremeThresh')~=1
    extremeThresh = 0.1;
end
if length(trw) ~= length(clim)
    disp('Lengths of ring-width series and climate series do not match');
end

n = length(trw);

Y1 = quantile(trw, [extremeThresh 1-extremeThresh]);
Y2 = quantile(clim, [extremeThresh 1-extremeThresh]);

lowYears = intersect(find(trw<=Y1(1)), find(clim<=Y2(1)));
highYears = intersect(find(trw>=Y1(2)), find(clim>=Y2(2)));

lowResponse = length(lowYears) / length(find(clim<=Y2(1)));
highResponse = length(highYears) / length(find(clim>=Y2(2)));

pLow = 2*binopdf(length(lowYears), length(find(clim<=Y2(1))), extremeThresh);
pHigh = 2*binopdf(length(highYears), length(find(clim>=Y2(2))), extremeThresh);

extremePct = [lowResponse highResponse];
p = [pLow pHigh];

end

