%% QQ plot of the residuals using VFAR approach
% load relevant data
load('RES.mat')

% plot
qqplot(RES(:))
title( 'QQ Plot of Residuals versus Standard Normal' );
ylabel( 'Quantiles of Residuals' )