% Reads the emotion data from the dataset


%Anger 1
anger1_data = readmatrix("EEG_ANGER_1.csv");
%Anger 2
anger2_data = readmatrix("EEG_ANGER_2.csv");

%Disgust 1
discust1_data = readmatrix("EEG_DISCUST_1.csv");
%Disgust 2
discust2_data = readmatrix("EEG_DISCUST_2.csv");

%Fear 1
fear1_data = readmatrix("EEG_FEAR_1.csv");
%Fear 2
fear2_data = readmatrix("EEG_FEAR_2.csv");

%Joy 1
joi1_data = readmatrix("EEG_JOI_1.csv");
%Joy 2
joi2_data = readmatrix("EEG_JOI_2.csv");

%Sadness 1
sadness1_data = readmatrix("EEG_SADNESS_1.csv");
%Sadness 2
sadness2_data = readmatrix("EEG_SADNESS_2.csv");


% Gets the average value of each emotion

%Average values for Anger

%Avera values for Anger 1
anger1_mean = zeros(1,8);
for i = 3 : 10
    anger1_mean(i) = mean(anger1_data(: ,i));
end

%Avera values for Anger 2
anger2_mean = zeros(1,8);
for i = 3 : 10
    anger2_mean(i) = mean(anger2_data(: ,i));
end

%Avera values for Anger
anger_mean = zeros(1,8);
for i = 3 : 10
    anger_mean(i) = (anger1_mean(i) + anger2_mean(i))./2;
end


%Average values for Disgust

%Avera values for Disgust 1
discust1_mean = zeros(1,8);
for i = 3 : 10
    discust1_mean(i) = mean(discust1_data(: ,i));
end

%Avera values for Disgust 2
discust2_mean = zeros(1,8);
for i = 3 : 10
    discust2_mean(i) = mean(discust2_data(: ,i));
end

%Avera values for Disgust
discust_mean = zeros(1,8);
for i = 3 : 10
    discust_mean(i) = (discust1_mean(i) + discust2_mean(i))./2;
end


%Average values for Fear

%Avera values for Fear 1
fear1_mean = zeros(1,8);
for i = 3 : 10
    fear1_mean(i) = mean(fear1_data(: ,i));
end

%Avera values for Fear 2
fear2_mean = zeros(1,8);
for i = 3 : 10
    fear2_mean(i) = mean(fear2_data(: ,i));
end

%Avera values for Fear
fear_mean = zeros(1,8);
for i = 3 : 10
    fear_mean(i) = (fear1_mean(i) + fear2_mean(i))./2;
end


%Average values for Joy

%Avera values for Joy 1
joi1_mean = zeros(1,8);
for i = 3 : 10
    joi1_mean(i) = mean(joi1_data(: ,i));
end

%Avera values for Joy 2
joi2_mean = zeros(1,8);
for i = 3 : 10
    joi2_mean(i) = mean(joi2_data(: ,i));
end

%Avera values for Joy
joi_mean = zeros(1,8);
for i = 3 : 10
    joi_mean(i) = (joi1_mean(i) + joi2_mean(i))./2;
end



%Average values for Sadness

%Avera values for Sadness 1
sadness1_mean = zeros(1,8);
for i = 3 : 10
    sadness1_mean(i) = mean(sadness1_data(: ,i));
end

%Avera values for Sadness 2
sadness2_mean = zeros(1,8);
for i = 3 : 10
    sadness2_mean(i) = mean(sadness2_data(: ,i));
end

%Avera values for Sadness
sadness_mean = zeros(1,8);
for i = 3 : 10
    sadness_mean(i) = (sadness1_mean(i) + sadness2_mean(i))./2;
end

% Writes the treshold values of emotions into a cvs file
writematrix(anger_mean,'EEG_TRESHOLD.csv');
writematrix(discust_mean,'EEG_TRESHOLD.csv','WriteMode','append');
writematrix(fear_mean,'EEG_TRESHOLD.csv','WriteMode','append');
writematrix(joi_mean,'EEG_TRESHOLD.csv','WriteMode','append');
writematrix(sadness_mean,'EEG_TRESHOLD.csv','WriteMode','append');

