function [ test, pfdr ] = fdr( ps, q )
% Perform FDR test using local p-values (ps)
%   See Johnson 2013 (J. Clim.), pp. 4819-4820
%   See Wilks 2006 (J. Appl. Meteorol. Clim.)

if ~exist('q','var'), q = 0.05; end;
M = length(ps);
ps = sort(ps);

pm = NaN(1,M);
for m = 1:M
    qtest = q * (m/M);
    pm(m) = ps(m) <= qtest;
end

pfdr = max(ps(pm == 1));
test = max(pm);
% test=1: Distinguishable
% test=0: Indistinguishable