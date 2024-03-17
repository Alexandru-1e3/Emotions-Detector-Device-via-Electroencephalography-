function Plot_dev2_CallBack(~, ~)
   % Function that that calculates and plots the second order derivative
    data_Names = evalin('base', 'data_Names');
    axes_plot = evalin('base', 'axes_plot');
    eeg_data = evalin('base', 'eeg_data');
    selected = evalin('base', 'selected');
    derivative_1 = evalin('base', 'derivative_1');
   
    % The second order derivative calculation
    derivative_2{selected} = gradient(derivative_1{selected}) ./ gradient(eeg_data{13});
    assignin('base', 'derivative_2', derivative_2);
    
    %The plot
    cla;
    plot(axes_plot, eeg_data{13}, derivative_2{1,selected}, 'LineWidth', 1);
    xlabel('time_{sec}');
    grid on;
    title(['Second order derivative of ' data_Names{selected}]);
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