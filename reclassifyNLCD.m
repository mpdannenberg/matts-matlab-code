function [ nlcd_out ] = reclassifyNLCD( nlcd_in )
%Take standard NLCD scheme and change to values of 1-n (AASG version)

nlcd_out = NaN(size(nlcd_in));
nlcd_out(nlcd_in == 11) = 1;
nlcd_out(nlcd_in == 21) = NaN; % Don't use Developed, Open Space
nlcd_out(nlcd_in == 22) = 2;
nlcd_out(nlcd_in == 23) = 3;
nlcd_out(nlcd_in == 24) = 4;
nlcd_out(nlcd_in == 31) = 5;
nlcd_out(nlcd_in == 41) = 6;
nlcd_out(nlcd_in == 42) = 7;
nlcd_out(nlcd_in == 43) = 8;
nlcd_out(nlcd_in == 52) = 9;
nlcd_out(nlcd_in == 71) = 10;
nlcd_out(nlcd_in == 81) = 11;
nlcd_out(nlcd_in == 82) = 12;
nlcd_out(nlcd_in == 90) = 13;
nlcd_out(nlcd_in == 95) = 14;



end

