# matts-matlab-code
MATLAB code developed by Matt Dannenberg

##cps.m
###Composite-plus-scale climate reconstruction, plus basic skill metrics
####Inputs:
-y: Climate time-series, filled with NaNs for years to reconstruct
-X: Proxy array (same number of rows as y), with each column representing a proxy series
####Outputs:
-yhat: proxy-reconstructed climate time-series
-r2: r-squared of proxy composite vs. climate during instrumental period
-stats: structure with Pearson correlation, p-value, variance scaled R^2 (McCarroll et al. 2015), and RMSE

##evc.m
###Calculate Extreme Value Capture statistic of scaled reconstruction (McCarroll et al. 2015)
####Inputs (all vectors of the same length):
-obs: observed climate time-series
-est: estimated climate time-series during instrumental period
-years: years corresponding to obs and est vectors
####Outputs:
-p_tot: p-value of TOTAL EVC (i.e., both low and high extremes)
-p_low: p-value of low EVC
-p_high: p-value of high EVC
-pct_tot: percentage of extremes (both high and low) captured by reconstruction
-pct_low: percentage of low extremes captured by reconstruction
-pct_high: percentage of high extremes captured by reconstruction

##extremeResponse.m
###Calculate percentage of extreme low/high precipitation years that were also extreme low/high growth years
####Inputs:
-trw: tree-ring series
-clim: climate time-series
-extremeThresh: threshold for defining extreme values (default: upper & lower 10th percentiles)
####Outputs:
-extremePct: two-element vector with percentage of low and high climate extremes that were also low and high growth extremes
-p: two-element vector with p-value (from binomial distribution) for two-tailed hypothesis test that observed extreme response was from chance agreement

##fao_pm.m
###Calculate potential evapotranspiration of reference crop using FAO Penman-Monteith method (Allen et al. 1998)
####Inputs:
-tmax: average daily maximum temperature (deg C) [12 x number of years]
-tmin: average daily minimum temperature (deg C) [12 x number of years]
-tdmean: average daily dewpoint temperature (deg C) [12 x number of years]
-lat: latitude (decimal degrees)
-alt: elevation above sea level (m)
-coast: 0 (not coast) or 1 (coast)
####Outputs:
-pet: monthly potential evapotranspiration (mm) [12 x number of years]
-Rn: monthly net radiation (W m-2 ???) [12 x number of years]
-vpd: monthly mean vapor pressure deficit (kPa) [12 x number of years]
-G: monthly ground heat flux (W m-2 ???) [12 x number of years]
-Rs: monthly incident solar radiation (W m-2 ???) [12 x number of years]