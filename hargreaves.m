% Calculate Hargreaves potential evapotranspiration
% Based on:
%   -Allen et al. 1998, "Crop Evapotranspiration: Guidelines for Computing Crop Water Requirements", Ch. 2-4.
%   -Hargreaves & Allen 2003, "History and evaluation of Hargreaves
%   evapotranspiration equation," J. Irrigation & Drainage Eng.

function [pet, Rs] = hargreaves(tmax, tmin, lat, years)

% INPUTS:
% tmax: average daily maximum temperature (deg C) [12 x number of years]
% tmin: average daily minimum temperature (deg C) [12 x number of years]
% lat: latitude (decimal degrees)

% OUTPUTS:
% pet (mm day-1)
% Rs (MJ m-2 day-1)

% For testing:
% load('C:\Users\Matthew\Documents\Publications\Dannenberg_et_al_TR-PNW-PPT\UpperColumbia_PRISM.mat');
% tmax = PRISM.Tmax';
% tmin = PRISM.Tmin';
% tdmean = tmin - randn(size(tmin));
% lat = 40;
% alt = 1000;
% years = 1895:2012;

% Number of years
nyrs = size(tmax, 2);

% Mean temperature
tmean = (tmax + tmin)/2;

% Extraterrestrial radiation
phi = lat * pi/180;
J = 1:365;
dr = 1 + 0.033 * cos(2*pi*J/365);
delta = 0.409 * sin(2*pi*J/365 - 1.39);
omega = acos(-tan(phi)*tan(delta));
Ra_daily = (1440/pi)*0.0820*dr.*(omega.*sin(phi).*sin(delta) + cos(phi)*cos(delta).*sin(omega));
days_in_month = [31 28 31 30 31 30 31 31 30 31 30 31];
Ra = NaN(12,1);
for month = 1:12
    last_day = sum(days_in_month(1:month));
    first_day = last_day - days_in_month(month) + 1;
    Ra(month) = mean(Ra_daily(first_day:last_day));
end
Ra = repmat(Ra, 1, nyrs);

% Now for leap year...
J = 1:366;
dr = 1 + 0.033 * cos(2*pi*J/365);
delta = 0.409 * sin(2*pi*J/365 - 1.39);
omega = acos(-tan(phi)*tan(delta));
Ra_daily = (1440/pi)*0.0820*dr.*(omega.*sin(phi).*sin(delta) + cos(phi)*cos(delta).*sin(omega));
days_in_month = [31 29 31 30 31 30 31 31 30 31 30 31];
Ra_leap = NaN(12,1);
for month = 1:12
    last_day = sum(days_in_month(1:month));
    first_day = last_day - days_in_month(month) + 1;
    Ra_leap(month) = mean(Ra_daily(first_day:last_day));
end
idx = find(rem(years, 4) == 0);
Ra(:, idx) = repmat(Ra_leap, 1, length(idx));

pet = 0.0023 .* 0.408 .* Ra .* (tmean+17.8) .* sqrt(tmax-tmin);

days_in_month = repmat([31 28 31 30 31 30 31 31 30 31 30 31]', 1, nyrs);
days_in_month(2, rem(years, 4) == 0) = 29;
pet = pet .* days_in_month;

end




