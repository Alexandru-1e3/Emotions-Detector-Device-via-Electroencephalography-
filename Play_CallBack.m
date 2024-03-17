function Play_CallBack(~, ~)
    % Function that diplay the emotions
    compare_to_data_set;
    emotion_values_percentage = evalin('base', 'emotion_values_percentage');
    emot_boxes = evalin('base', 'emot_boxes');
    eeg_data = evalin('base', 'eeg_data');
    emotion_Names = evalin('base', 'emotion_Names');
    max_emot = evalin('base', 'max_emot');
    plotaxes = evalin('base', 'plotaxes');

    % Calculates the sum of all eeg signals
    eeg = zeros(1,8);
    for i = 4 : 12
        eeg = eeg + (eeg_data{i});
    end

    % Variable that stores the max value emotion in each iteration
    [~, emt_img_1] = max(transpose(emotion_values_percentage));

    % Function that plots and shows the results
    for i = 1 : length(eeg_data{2}) % loop for the sesion length
        for j = 1 : max_emot % loop for fi
            set(emot_boxes(j), 'String', ...
                strcat(emotion_Names{j}, sprintf(':     %.2f%%', emotion_values_percentage(i, j))));
        end
        plot(plotaxes, 1 : i, eeg(1 : i), 'LineWidth', 1); % Plots the sum of the signals
        grid(plotaxes, 'on');
        xlabel(plotaxes, 'time_{sec}');
        ylabel(plotaxes, '\muV');
        drawnow; % Makes an animation
        pause(0.09);

        switch emt_img_1(i)
            case 1
                Anger_Image = imread("Angry_emj.png");
                imshow(Anger_Image);
            case 2
                Discust_Image = imread("Discust_emj.png");
                imshow(Discust_Image);
            case 3
                Fear_Image = imread("Fear_emj.png");
                imshow(Fear_Image);
            case 4
                Joi_Image = imread("Joi_emj.png");
                imshow(Joi_Image);
            case 5
                Sadness_Image = imread("Sadness_emj.png");
                imshow(Sadness_Image);
            otherwise
                break
        end
     end   
end

