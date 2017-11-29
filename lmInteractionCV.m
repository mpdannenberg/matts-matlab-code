function [ h, S ] = lmInteractionCV( y, x1, x2 )

% Test for significant interactions between two variables using
% leave-one-out cross-validation of lm models, tested w/ Nash-Sutcliffe 
% efficiency (E) and RMSE

% Following criteria must be met for interaction to be "significant":
%   E>0 for interaction model
%   RMSE(interaction) < RMSE(no interaction)

% Input arguments
%   y: response variable
%   x1: first predictor
%   x2: second predictor

% Output arguments
%   h: test of interaction significance (1=significant, 0=not signficant)
%   S: structure with variables & model statistics

yhat_mdl1 = NaN(size(y));
yhat_mdl2 = NaN(size(y));

B1_mdl1 = NaN(size(y));
B2_mdl1 = NaN(size(y));

B1_mdl2 = NaN(size(y));
B2_mdl2 = NaN(size(y));
B12_mdl2 = NaN(size(y));

n = length(y);

for i = 1:n
    
    T = table(y, x1, x2);
    T.y(i) = NaN;
    
    mdl1 = fitlm(T, 'y ~ x1 + x2');
    mdl2 = fitlm(T, 'y ~ x1 + x2 + x1:x2');
    
    yhat_mdl1(i) = mdl1.Fitted(i);
    yhat_mdl2(i) = mdl2.Fitted(i);
    
    B1_mdl1(i) = mdl1.Coefficients.Estimate(2);
    B2_mdl1(i) = mdl1.Coefficients.Estimate(3);
    
    B1_mdl2(i) = mdl2.Coefficients.Estimate(2);
    B2_mdl2(i) = mdl2.Coefficients.Estimate(3);
    B12_mdl2(i) = mdl2.Coefficients.Estimate(4);
    
    
end

% No interaction
S(1).Model = 'No Interaction';
S(1).y = y;
S(1).yhat = yhat_mdl1;
S(1).RMSE = rmse(yhat_mdl1, y);
S(1).NashSutcliffe = NashSutcliffe(yhat_mdl1, y);
[r, p] = corr(yhat_mdl1, y, 'rows','pairwise');
S(1).r2 = r^2;
S(1).p = p;
S(1).beta1 = B1_mdl1;
S(1).beta2 = B2_mdl1;
S(1).betaInteraction = NaN;

% Interaction
S(2).Model = 'Interaction';
S(2).y = y;
S(2).yhat = yhat_mdl2;
S(2).RMSE = rmse(yhat_mdl2, y);
S(2).NashSutcliffe = NashSutcliffe(yhat_mdl2, y);
[r, p] = corr(yhat_mdl2, y, 'rows','pairwise');
S(2).r2 = r^2;
S(2).p = p;
S(2).beta1 = B1_mdl2;
S(2).beta2 = B2_mdl2;
S(2).betaInteraction = B12_mdl2;

if S(2).NashSutcliffe > 0 & S(2).RMSE < S(1).RMSE
    h = 1;
else
    h = 0;
end


end

