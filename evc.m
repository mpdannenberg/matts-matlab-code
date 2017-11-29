function [p_tot, p_low, p_high, pct_tot, pct_low, pct_high] = evc(obs, est, years)
%Extreme value capture test of scaled climate reconstruction
%   Test (based on binomial distribution) of how well a scaled
%   reconstruction captures extreme values (defined as a 10% lower and
%   upper threshold). See McCarroll, Young & Loader (2015) for details.

n = length(years);
temp = sort(obs);
if rem(n, 10) == 0
    cutoff = n/10;
    upper = temp(n-cutoff+1);
    lower = temp(cutoff);
    
    high_years_obs = years(obs >= upper);
    low_years_obs = years(obs <= lower);
    
    high_years_est = years(est >= upper);
    low_years_est = years(est <= lower);
    
    n_high = sum(ismember(high_years_est, high_years_obs));
    pct_high = n_high / cutoff;
    p_high = binopdf(n_high, cutoff, 0.1);
    
    n_low = sum(ismember(low_years_est, low_years_obs));
    pct_low = n_low / cutoff;
    p_low = binopdf(n_low, cutoff, 0.1);
    
    n_tot = n_high + n_low;
    pct_tot = n_tot / (2*cutoff);
    p_tot = binopdf(n_tot, cutoff*2, 0.1);
    
else
    disp('n is not a multiple of 10')
end

end

