function display_initial_value(src, ~, checkboxIndex)
    eeg_data = evalin('base', 'eeg_data');
    axes_plot = evalin('base', 'axes_plot');
    data_Names = evalin('base', 'data_Names');
    data_boxes = evalin('base', 'data_boxes');

    % Initialize cell array to store line handles
    persistent data_boxes_handles
    if isempty(data_boxes_handles)
        data_boxes_handles = cell(1, numel(data_boxes));
    end

    persistent data_title_handles
    if isempty(data_title_handles)
        data_title_handles = cell(1, numel(data_boxes));
    end

     persistent data_yaxis_handles
    if isempty(data_yaxis_handles)
        data_yaxis_handles = cell(1, numel(data_boxes));
    end
    
    if get(src, 'Value') == 1  

        % When Checkbox is checked, plot the graph
        data_boxes_handles{checkboxIndex} = plot(axes_plot, eeg_data{13}, ...
            eeg_data{checkboxIndex}, 'LineWidth', 1);
        xlabel('time_{sec}');
        grid on;
        data_title_handles{checkboxIndex} = title([data_Names{checkboxIndex}]);
        data_yaxis_handles{checkboxIndex} = ylabel('');

        color{checkboxIndex} = get(data_boxes_handles{checkboxIndex}, ...
            'Color');
        
        if checkboxIndex <= 2 
            ylabel('%');
            hold off;
        elseif checkboxIndex == 3 
            ylabel('binary');
             hold off;
        elseif checkboxIndex == 4
            ylabel('\muW');
             hold off;
        else
            ylabel('\muV');
            hold on;
            set(data_boxes{checkboxIndex}, 'BackgroundColor', ...
                color{checkboxIndex});
        end
    else
        % Clear the Y-axis and the Title 
        delete(data_boxes_handles{checkboxIndex});
        delete(data_title_handles{checkboxIndex});
        delete(data_yaxis_handles{checkboxIndex});
        set(data_boxes{checkboxIndex}, 'BackgroundColor', [0.74 0.74 0.74]);
        xlabel('time_{sec}');
        grid on;
    end
end
