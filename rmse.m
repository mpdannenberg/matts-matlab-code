function [ RMSE ] = rmse( yhat, y )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

SE = (yhat - y).^2;
MSE = nanmean(SE);
RMSE = sqrt(MSE);


end

