function compare_to_data_set(~, ~)
    % Function that assigns the emotions

    % Read the data
    eeg_threshold = readmatrix("EEG_THRESHOLD.csv");
    eeg_data = evalin('base', 'eeg_data');
    
    % Convert the cell data to matrix data
    eeg_data_mat = cell2mat(eeg_data);
    out_emotion = zeros(length(eeg_data{2}), 5); % The initializaton of out_emotion outside the loop

    for i = 1 : length(eeg_data{2}) % loop for the rows of eeg_data_mat
        sum_mat = zeros(5, 1); % sum_mat resets inside the loop for each iteration   
        for j = 1 : 5 % loop for the emotion threshold
            for k = 3 : 10 % loop for the eeg signals
                % Calculates the difference between the data and the threshold
                sum_mat(j) = sum_mat(j) + (eeg_data_mat(i, k + 1) - eeg_threshold(j, k));
            end
        end
        out_emotion(i, :) = sum_mat; % Store the results for each iteration in the corresponding row of the emotion
    end
    
   emotion_values_percentage = zeros(length(eeg_data{2}), 5);

    for i = 1:length(eeg_data{2})
        emotion_values = out_emotion(i, :);
    
        % Function that transforms all values into percentages
        row_values_percentage = (abs(emotion_values) / sum(abs(emotion_values))) * 100;
    
        % Store the percentage values for the current iteration in the matrix
        emotion_values_percentage(i, :) = row_values_percentage;
    end

    % Writes the data in the Workspace
    assignin('base', 'emotion_values_percentage', emotion_values_percentage);

end




