function [SPI, dist, q] = spi(precip, dist, q)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if isempty(dist) | isempty(q)
    ind0 = find(precip == 0);
    PPT_noZeros = precip;
    PPT_noZeros(precip == 0 | isnan(precip)) = [];
    q = length(ind0) / length(precip(~isnan(precip)));
    
    dist = gamfit(PPT_noZeros);
    gs = gamcdf(precip, dist(1), dist(2));
    fs = q + (1-q)*gs;
    SPI = norminv(fs);
else
    gs = gamcdf(precip, dist(1), dist(2));
    fs = q + (1-q)*gs;
    SPI = norminv(fs);
    
end


end

