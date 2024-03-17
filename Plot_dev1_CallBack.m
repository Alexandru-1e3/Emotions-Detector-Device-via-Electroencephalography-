function Plot_dev1_CallBack(~, ~)
    % Function that that calculates and plots the first order derivative
    data_Names = evalin('base', 'data_Names');
    eeg_data = evalin('base', 'eeg_data');
    axes_plot = evalin('base', 'axes_plot');
    selected = evalin('base', 'selected');

    % The first order derivative calculation
    fprintf('Case %d selected\n', selected);
    derivative_1{selected} = gradient(eeg_data{selected}) ./ gradient(eeg_data{13});
    assignin('base', 'derivative_1', derivative_1);

    %The plot
    cla;
    plot(axes_plot, eeg_data{13}, derivative_1{selected}, 'LineWidth', 1);
    xlabel('time_{sec}');
    grid on;
    title(['First order derivative of ' data_Names{selected}]);
    if selected <= 2 
        ylabel('%');
    elseif selected == 3 
        ylabel('binary');
    elseif selected == 4
        ylabel('\muW');
    else
        ylabel('\muV');
    end
end