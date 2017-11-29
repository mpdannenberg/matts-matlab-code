function [ nlcd_out ] = NLCDsubset( nlcd_in, R, mapUL, mapLR )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[ULpix(1), ULpix(2)] = map2pix(R, mapUL(1), mapUL(2));
ULpix = round(ULpix);
[LRpix(1), LRpix(2)] = map2pix(R, mapLR(1), mapLR(2));
LRpix = round(LRpix);
nlcd_out = nlcd_in(ULpix(1):LRpix(1), ULpix(2):LRpix(2));

end

