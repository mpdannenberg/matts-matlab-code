# matts-matlab-code
MATLAB code developed by Matt Dannenberg

## cps.m
### Composite-plus-scale climate reconstruction, plus basic skill metrics
#### Inputs:
  * y: Climate time-series, filled with NaNs for years to reconstruct
  * X: Proxy array (same number of rows as y), with each column representing a proxy series
#### Outputs:
  * yhat: proxy-reconstructed climate time-series
  * r2: R<sup>2</sup> of proxy composite vs. climate during instrumental period
  * stats: structure with Pearson correlation, *p*-value, variance-scaled R<sup>2</sup> (McCarroll et al. 2015), and RMSE

## evc.m
### Calculate Extreme Value Capture statistic of scaled reconstruction (McCarroll et al. 2015)
#### Inputs (all vectors of the same length):
  * obs: observed climate time-series
  * est: estimated climate time-series during instrumental period
  * years: years corresponding to obs and est vectors
#### Outputs:
  * p_tot: *p*-value of TOTAL EVC (i.e., both low and high extremes)
  * p_low: *p*-value of low EVC
  * p_high: *p*-value of high EVC
  * pct_tot: percentage of extremes (both high and low) captured by reconstruction
  * pct_low: percentage of low extremes captured by reconstruction
  * pct_high: percentage of high extremes captured by reconstruction

## extremeResponse.m
### Calculate percentage of extreme low/high precipitation years that were also extreme low/high growth years
#### Inputs:
  * trw: tree-ring series
  * clim: climate time-series
  * extremeThresh: threshold for defining extreme values (default: upper & lower 10th percentiles)
#### Outputs:
  * extremePct: two-element vector with percentage of low and high climate extremes that were also low and high growth extremes
  * p: two-element vector with *p*-value (from binomial distribution) for two-tailed hypothesis test that observed extreme response was from chance agreement

## fao_pm.m
### Calculate potential evapotranspiration of reference crop using FAO Penman-Monteith method (Allen et al. 1998)
#### Inputs:
  * tmax: average daily maximum temperature (deg C) [12 x number of years]
  * tmin: average daily minimum temperature (deg C) [12 x number of years]
  * tdmean: average daily dewpoint temperature (deg C) [12 x number of years]
  * lat: latitude (decimal degrees)
  * alt: elevation above sea level (m)
  * coast: 0 (not coast) or 1 (coast)
#### Outputs:
  * pet: monthly potential evapotranspiration (mm) [12 x number of years]
  * Rn: monthly net radiation (W m<sup>-2</sup> ???) [12 x number of years]
  * vpd: monthly mean vapor pressure deficit (kPa) [12 x number of years]
  * G: monthly ground heat flux (W m<sup>-2</sup> ???) [12 x number of years]
  * Rs: monthly incident solar radiation (W m<sup>-2</sup> ???) [12 x number of years]

## fdr.m
### Control the false discovery rate in multiple hypothesis testing and conduct field significance test (Wilks 2006, 2016)
#### Inputs:
  * ps: vector of _p_-values from multiple hypothesis tests
  * q: global significance level (default: *q*=0.05)
#### Outputs:
  * test: significance of "field" at alpha=*q* (0: not significant; 1: significant)
  * pfdr: *p*-value for local significance tests controlling false discovery rate at alpha=*q*

## lmInteractionCV.m
### Compare predictions from additive vs. interaction multiple regression models using cross-validation
#### Inputs:
  * y: response variable
  * x1: predictor variable #1
  * x2: predictor variable #2
#### Outputs:
  * h: test of interaction importance (0: not important interaction, 1: important interaction)
  * S: structure of additive & interaction models + statistics (RMSE, Nash-Sutcliffe model efficiency, R<sup>2</sup>, *p*-value, effect sizes)

## make_cmap.m
### Linearly interpolate MATLAB rgb colormap to *n* levels
#### Inputs:
  * c: [n x 3] array of RGB "endmember" values to interpolate between
  * n: number of desired levels in the colormap
#### Outputs:
  * cn: updated colormap with *n* levels

## NashSutcliffe.m
### Calculate Nash-Sutcliffe model efficiency (Nash & Sutcliffe 1970), ranging from -INF to 1, with >0 indicating some model skill (relative to predictions based on observed mean value) and 1 indicating perfect predictions.
#### Inputs:
  * yhat: predicted response variable
  * y: observed response variable
#### Outputs:
  * E: Nash-Sutcliffe efficiency

## NLCDsubset.m
### Extract a spatial subset from the National Land Cover Database (NLCD) - should also work for other raster data as well.
#### Inputs:
  * nlcd_in: 2D array of larger NLCD image
  * R: spatial reference for nlcd_in
  * mapUL: upper-left coordinate of desired subset
  * mapLR: lower-right coordinate of desired subset
#### Outputs:
  * nlcd_out: 2D array of NLCD subset

## reclassifyNLCD.m
### Convert standard NLCD numbering scheme (11, 21, 22, etc.) and convert to sequential numbers (1-14), excluding Developed, Open Space.
#### Inputs:
  * nlcd_in: initial NLCD image
#### Outputs:
  * nlcd_out: reclassified NLCD image

## rmse.m
### Calculate root mean squared error (RMSE) between predicted and observed response.
#### Inputs:
  * yhat: predicted response variable
  * y: observed response variable
#### Outputs:
  * RMSE: root mean squared error

## spi.m
### Calculate standardized precipitation index (SPI) (McKee 1993) from precipitation data from a given month using a gamma distribution.
#### Inputs:
  * precip: precipitation for given month (can be aggregated over previous *n* months for longer time-scale SPI)
  * (optional) dist: parameters of the gamma distribution
  * (optional) q: probability of observing zero precipitation during month
#### Outputs:
  * SPI: standardized precipitation index for the input month
  * dist: parameters of the gamma distribution
  * q: probabiliy of zero precipitation during input month

## TheilSen.m
### Estimates linear model using the nonparametric Theil-Sen regression method (Wilcox 2005), with significance estimated using Monte Carlo resampling of observed series.
#### Inputs:
  * x: predictor variable
  * y: response variable
  * showplot: display scatterplot of x vs. y, with Theil-Sen regression line, and histogram of Monte Carlo permuted slope vs. observed slope (0 [default] = don't show plots; 1 = show plots)
  * nsims: number of simulations in the Monte Carlo method (default = 10,000)
#### Outputs:
  * a: estimated slope
  * b: estimated intercept
  * p: probability of obtaining a slope as or more extreme than the observed slope in the Monte Carlo simulations
  * sims: distribution of slopes from all of the Monte Carlo simulations

## violin.m
### Violin plot (similar to boxplot, but showing distribution)
#### Inputs:
  * y: values to plot
  * g: groups that values belong to (i.e., for multiple violins)
  * rgbFace: Face colormap (can be either single color for all groups, or one row per group) - default: red
  * rgbLine: Line colormap (can be either single color for all groups, or one row per group) - default: gray
  * bxplt: Display boxplot on top of violin? (0 [default] = no, 1 = yes)
#### Outputs:
  * h: figure handle


## References


Allen, R. G., Pereira, L. S., Raes, D., & Smith, M. (1998). Crop evapotranspiration-Guidelines for computing crop water requirements-FAO Irrigation and drainage paper 56. FAO, Rome, 300(9), D05109.


McCarroll, D., Young, G. H., & Loader, N. J. (2015). Measuring the skill of variance-scaled climate reconstructions and a test for the capture of extremes. *The Holocene*, 25(4), 618–626. https://doi.org/10.1177/0959683614565956.


McKee, T. B., Doesken, N. J., & Kleist, J. (1993). The relationship of drought frequency and duration to time scales. In *Preprints from the Eighth Conference on Applied Climatology* (pp. 179–184). Anaheim, CA: American Meteorological Society.


Nash, J. E., & Sutcliffe, J. V. (1970). River flow forecasting through conceptual models Part I - A discussion of principles. *Journal of Hydrology*, 10, 282–290. https://doi.org/10.1016/0022-1694(70)90255-6


Wilcox, R. R. (2005). *Introduction to Robust Estimation and Hypothesis Testing* (2nd ed.). San Diego, CA: Academic Press.


Wilks, D. S. (2006). On “field significance” and the false discovery rate. *Journal of Applied Meteorology and Climatology*, 45, 1181–1189. https://doi.org/10.1175/JAM2404.1


Wilks, D. S. (2016). “The stippling shows statistically significant grid points”: How research results are routinely overstated and overinterpreted, and what to do about it. *Bulletin of the American Meteorological Society*, 97, 2263–2274.

