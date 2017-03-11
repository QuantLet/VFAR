%% Plot MAPE of VFAR versus Random Walk for multiple step forecast

% load relevant data
load('AEZSmultiforecast.mat')

% MAPE plot
plot(1:endh,MAPEhorizonVFAR,'b','LineWidth',1.5)
hold on
plot(1:endh,MAPEhorizonNAIVE,'--k','LineWidth',1.5)
hold off
xlim([0 endh])
ylim([lowYlim upYlim])
title(ticker)
ylabel('MAPE')
xlabel('Step')