%% QQ plot of the residuals using VFAR approach
% load relevant data
load('RES.mat')

% standardize the residual
stdres = zeros( size(RES) );
for i=1:size(RES,1)
    stdres(i,:) = ( RES(i,:) - mean( RES(i,:) ) ) / sqrt( var( RES(i,:) ) );
end
stdres = stdres(:);

% plot
qqplot(stdres)
title( 'QQ Plot of Residuals versus Standard Normal for AEZS' );
ylabel( 'Quantiles of Residuals' )
