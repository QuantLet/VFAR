%% Plot fitted bid and ask curves at random time point
% load relevant data
load('AEZS.mat')

% define number of step ahead forecast h = 1, 5, or 10
h = 1;

% load relevant data
load(strcat(num2str(h),'step.mat'))

% total #of 5-mins in our sample
TT   = ( (16*60 - 9.5*60)/5 + 1 - 4)*T;

% #of 5-min in each day
day5 = ( (16*60 - 9.5*60)/5 + 1 - 4); 

% randomly select a time point
initialTrainSize = 30*n; % initial training set size
endq             = n*T - 30*n - h + 1; % last time point
q                = randsample(endq,1);

% actual time and date
tpt   = initialTrainSize + q + h - 1; % actual time point

% Calculate actual date and time
time5 = rem(tpt,day5); % calculate which 5-min in the 75 5-min in a day
if time5==0
    tempmin = 40 + day5*5;
    actDay  = strcat(num2str(Date(floor(tpt/day5),1)),'-',...
              num2str(Date(floor(tpt/day5),2)),'-',...
              num2str(Date(floor(tpt/day5),3)));
else
    tempmin = 40 + time5*5;
    actDay  = strcat(num2str( Date( floor(tpt/day5) + 1, 1) ),'-',...
              num2str( Date( floor(tpt/day5) + 1, 2) ),'-',...
              num2str( Date( floor(tpt/day5) + 1, 3) ) );
end
actHr       = floor(tempmin/60) + 9;
actMin      = sprintf('%.2d', rem(tempmin,60) );
actDayTime  = char(strcat(actDay,' at',{' '}, num2str(actHr), ':' ,...
              num2str(actMin) ) );

% data for bid side
testxB      = matxb{tpt};
testyB      = matyb{tpt};
testyBhat   = bidVolhStep{q};

% data for ask side
testxA      = matxa{tpt};
testyA      = matya{tpt};
testyAhat   = askVolhStep{q};

% plots
sc1 = scatter(testxB, testyB, 3, 'filled', 'b')
hold on
sc2 = scatter(testxA, testyA, 3, 'filled', 'r')
pl1 = plot(testxB, volHatb{tpt}, 'color', [192 192 192]./255, ...
      'LineWidth', 1.5);
pl2 = plot(testxA, volHata{tpt}, 'color', [160 160 160]./255, ...
      'LineWidth', 1.5);
pl3 = plot(testxB, testyBhat, 'b', 'LineWidth', 1.5);
pl4 = plot(testxA, testyAhat, 'r', 'LineWidth', 1.5);
hold off
xlabel( 'Price' ) % x-axis label
ylabel( 'Log (Acummulated Volume)' ) % y-axis label
title( char( strcat( 'VFAR', {' '}, num2str(h), ...
    '-step forecast bid and ask curve at t=', num2str(tpt), {' '}, ...
    ', on', {' '}, actDayTime, {' '}, 'for', {' '}, ticker) ) );