
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **VFARqqPlot** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet : VFARqqPlot

Published in : Unpublished; VFAR

Description : 'Produces QQ plot for residuals using VFAR approach for AEZS with LOB data from
02Jan2015 till 06Mar2015'

Keywords : plot, time-series, autoregressive, estimation, qq-plot

See also : VFARcrossCorrPlot, VFARrandVfarPlot, VFARrandhStepForecastPlot VFARrandBidAskCurvePlot

Author : Ying Chen, Wee Song Chua, Wolfgang Karl Haerdle

Submitted : Wed, May 18 2016 by Wee Song Chua

Datafile : RES.mat

Example : QQ plot for VFAR residuals

```

![Picture1](VFARqqPlot_m.png)


### MATLAB Code:
```matlab
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

```
