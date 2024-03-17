function four_of_data(~,~)
    % Function that calculates and plots the Fourier Transform
    axes_plot = evalin('base', 'axes_plot');
    eeg_data = evalin('base', 'eeg_data');
    selected = evalin('base', 'selected');
    data_Names = evalin('base', 'data_Names');
    Fun_Freq = evalin('base', 'Fun_Freq');
    fprintf('Case %d selected\n', selected);

    % Function that calculates the fft
    fs = 1024; %The Nyquist frequency
    N = length(eeg_data{selected});
    eeg_pad{selected} = [eeg_data{selected}; zeros(2000,1)]; % Initialize for Zero-padding

   % Paramters after Zero-padding
   N2 = length(eeg_pad{selected});
   one_sided = eeg_pad{selected}(1:floor(N2/2));  % Use floor to ensure integer division
   f_eeg = fs * (0:floor(N2/2)-1) / N2;  % Adjust the limits accordingly
   eeg_ampl{selected} = abs(one_sided) / (N / 2);


    % Find the index of the maximum magnitude
    [~, maxIdx] = max(eeg_ampl{selected});
    % Calculate the corresponding frequency
    freq_max = f_eeg(maxIdx);

    % Display to the user the frequency
    set(Fun_Freq, 'String', ...
        sprintf('The predominant harmonic at: %.2f Hz', freq_max));

    % The plot of the Fourier Transform
    plot(axes_plot, f_eeg, eeg_ampl{selected});
    xlim([0, 50]); % EEG signals have low frequencies    
    title(['Magnitude Spectrum of ' data_Names{selected}]);
    xlabel('Frequency_{Hz}');
    grid on;
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