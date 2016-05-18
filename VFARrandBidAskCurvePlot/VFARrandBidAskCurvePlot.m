%% Function to plot bid and ask supply curves at random time point
% load relevant data
load('AEZS.mat')

%% Plot random bid and ask supply curve
%total #of 5-mins in sample
TT  = ((16*60-9.5*60)/5+1-4)*T; 

%randomly select one time point
tpt = randsample(TT,1); 

% Function to calculate actual date and time
day5  = ((16*60-9.5*60)/5+1-4); %#of 5-min in each day
time5 = rem(tpt,day5); %calculate which 5-min in the 75 5-min in a day
if time5==0
    tempmin = 40+day5*5;
    actDay  = strcat(num2str(Date(floor(tpt/day5),1)),'-', ... 
              num2str(Date(floor(tpt/day5),2)),'-', ...
              num2str(Date(floor(tpt/day5),3)));
else
    tempmin = 40+time5*5;
    actDay  = strcat(num2str(Date(floor(tpt/day5)+1,1)),'-', ... 
              num2str(Date(floor(tpt/day5)+1,2)),'-', ...
              num2str(Date(floor(tpt/day5)+1,3)));
end
actHr      = floor(tempmin/60)+9;
actMin     = sprintf('%.2d',rem(tempmin,60));
actDayTime = char(strcat(actDay,' at',{' '},num2str(actHr),':', ...
             num2str(actMin)));

% plot bid side
plot(bidPrice_CWS{tpt},bidVol_CWS{tpt},'b','LineWidth',2);

% plot ask side
hold on
plot(askPrice_CWS{tpt},askVol_CWS{tpt},'r','LineWidth',2);
hold off
xlabel('Price') % x-axis label
ylabel('Log (Acummulated Volume)') % y-axis label
title(char(strcat('bid and ask supply curve on',{' '},actDayTime,{' '}, ...
    'for',{' '},ticker)));
