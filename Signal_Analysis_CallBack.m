function Signal_Analysis_CallBack(source, ~)
    % Signal anlysis menu function
    buttonPressCount = evalin('base', 'buttonPressCount'); 
   
    selected = 1;
    assignin('base', 'selected', selected);
    
    if buttonPressCount >= 1

        %Derivative gui
        Choose = evalin('base', 'Choose'); 
        Choose_Label = evalin('base', 'Choose_Label');
        Dev1_Label = evalin('base', 'Dev1_Label');
        Plot1 = evalin('base', 'Plot1');
        Dev2_Label = evalin('base', 'Dev2_Label');
        Plot2 = evalin('base', 'Plot2');

        set(Choose, 'Visible', 'off');
        set(Choose_Label, 'Visible', 'off', 'FontSize', 10, ...
            'String', 'Choose the signal to differentiate:');
        set(Dev1_Label, 'Visible', 'off');
        set(Plot1, 'Visible', 'off');
        set(Dev2_Label, 'Visible', 'off');
        set(Plot2, 'Visible', 'off');

        %Integral gui
        Int_Label = evalin('base', 'Int_Label'); 
        Integral_up_limit = evalin('base', 'Integral_up_limit'); 
        max_lim = evalin('base', 'max_lim'); 
        min_lim = evalin('base', 'min_lim'); 
        Int_val = evalin('base', 'Int_val'); 
        Avr_val = evalin('base', 'Avr_val');

        set(Int_Label, 'Visible', 'off');
        set(Integral_up_limit, 'Visible', 'off','Max', 100);
        set(max_lim, 'Visible', 'off', ...
                'String',num2str(get(Integral_up_limit,'Max')));
        set(min_lim, 'Visible', 'off');
        set(Int_val, 'Visible', 'off');
        set(Avr_val, 'Visible', 'off');

        eeg_data = evalin('base', 'eeg_data'); 
        lastValue = eeg_data{13}(end);

        %Fourier gui
        Fun_Freq = evalin('base', 'Fun_Freq'); 
        Plot_freq = evalin('base', 'Plot_freq'); 

        set(Fun_Freq, 'Visible', 'off');
        set(Plot_freq, 'Visible', 'off');

    
        % The cases handling
        selected_opt = get(source, 'Value');
        
        if selected_opt == 1
            % Initial Values
           disp('Selected Initial Values');
           cla;
           delete(title(''));
           ylabel('');
           xlabel('time_{sec}');
  
        elseif selected_opt == 2
            % Derivative
            disp('Selected Derivative');
              
            %Make the gui components visible
            set(Choose, 'Visible', 'on');
            set(Choose_Label, 'Visible', 'on');
            set(Dev1_Label, 'Visible', 'on');
            set(Plot1, 'Visible', 'on');
            set(Dev2_Label, 'Visible', 'on');
            set(Plot2, 'Visible', 'on');

            % Call the differentiation functions
            Plot_dev1_CallBack;
            Plot_dev2_CallBack;
            delete(title(''));
            ylabel('');
            cla;
                
        elseif selected_opt == 3
            % Integral
            disp('Selected Integral');

            %Make the gui components visible
            
            set(Choose, 'Visible', 'on');
            set(Choose_Label, 'Visible', 'on', ...
                'String', 'Choose the signal to integrate:');
            set(Int_Label, 'Visible', 'on');
            set(Integral_up_limit, 'Visible', 'on','Max', lastValue);
            set(max_lim, 'Visible', 'on', ...
                'String',num2str(get(Integral_up_limit,'Max')));
            set(min_lim, 'Visible', 'on');
            set(Int_val, 'Visible', 'on');
            set(Avr_val, 'Visible', 'on');


            % Call the integration function
            int_of_data([]);
            cla;
            delete(title(''));
            ylabel('');

        elseif selected_opt == 4
            % Fourier Transform
            disp('Selected Fourier Transform');

            %Make the gui components visible
            set(Choose, 'Visible', 'on');
            set(Choose_Label, 'Visible', 'on', ...
                'String', ...
                'Choose the signal to apply the Fourier Transform:', ...
                'FontSize', 8);
            set(Fun_Freq, 'Visible', 'on');
            set(Plot_freq, 'Visible', 'on');

            % Call the integration function
            four_of_data([]);
            delete(title(''));
            ylabel('');
            cla;
        end
    end
end
