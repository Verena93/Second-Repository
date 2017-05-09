function simulated_data

data = xlsread('SimulatedData')
% reads excel table

%% basic statistics

% arthemtic mean
aritmean = mean(data)
overallmean = mean(aritmean)

% variance
variance = var(data)

%standard deviation
standarddeviation = sqrt(variance) %alternative: std()

% median
datamedian = median(data)

end