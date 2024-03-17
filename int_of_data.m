function int_of_data(source, ~)
    % Function that calculates and plots the definite and indefinte interals 
    eeg_data = evalin('base', 'eeg_data');
    axes_plot = evalin('base', 'axes_plot');
    selected = evalin('base', 'selected');
    data_Names = evalin('base', 'data_Names');
    Int_val = evalin('base', 'Int_val');
    Avr_val = evalin('base', 'Avr_val');
    fprintf('Case %d selected\n', selected);

    cla;
    % Modifies the sizes of vectors in order to be the same
    max_value = get(source, 'Value');
    eeg_max = zeros(size(eeg_data{13}));
    eeg_var_max = zeros(size(eeg_data{selected}));

    for i = 1:length(eeg_data{13})
        if eeg_data{13}(i) <= max_value
        eeg_max(i) = eeg_data{13}(i);
        eeg_var_max(i) = eeg_data{selected}(i);
        end
    end

    last_nonzero_index = find(eeg_max, 1, 'last');
    last_nonzero = find(eeg_var_max, 1, 'last');
    eeg_max = eeg_max(1:last_nonzero_index); % Time x axis
    eeg_var_max = eeg_var_max(1:last_nonzero); % Variable y axis

    % The area under the curve using the trapezoidal method
    def_int{selected} = trapz(eeg_max, eeg_var_max) / 1000000; % unit measure in V/W not uV/uW

    %The average value
    avr{selected} = def_int{selected} / length(eeg_max);


    % Display to the user the value of the integral and the mean value 
    if selected <= 2
        unit_measure = '%';
    elseif selected == 3
        unit_measure = 'logical';
    elseif selected == 4
        unit_measure = 'W';
    else
        unit_measure = 'V';
    end

    set(Int_val, 'String', ...
        sprintf('The value of the definite integral: %.4f %s', ...
        def_int{selected}, unit_measure));
    set(Avr_val, 'String', ...
        sprintf('The average value: %f %s', ...
        avr{selected}, unit_measure));

    % The function that describes the indefinite integral
    indef_int{selected} = cumtrapz(eeg_max, eeg_var_max);
    cla;

    % The plot of the indefinite integral
    plot(axes_plot, eeg_max, indef_int{selected}, 'LineWidth', 1);
    xlabel('time_{sec}');
    grid on;
    title(['Indefinite integral of ' data_Names{selected}]);
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
