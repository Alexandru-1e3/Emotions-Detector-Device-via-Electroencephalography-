function In_Data_CallBack(~, ~) 
    
    Data_Check = evalin('base', 'Data_Check');  
    Button_Check = evalin('base', 'Button_Check'); 
   
    % Increment a counter to keep track of button presses
    persistent buttonPressCount;
    if isempty(buttonPressCount)
        buttonPressCount = 0;
    end
    
    buttonPressCount = buttonPressCount + 1;
    
    if buttonPressCount == 1
      get_eeg_data;
      % Ensures the user about the data
      set(Data_Check,'String', 'The Data was introduced!');
      disp('The Data was introduced!');
    end

    % Check the number of button presses and shows a message to the user
    if buttonPressCount >= 10 && buttonPressCount < 20
       set(Button_Check, 'String', 'STOP PRESSING THE BUTTON!', ...
            'Visible', 'on');
    elseif buttonPressCount >= 20
        set(Button_Check, 'String', 'SERIOUSLY STOP!', ...
            'Visible', 'on');
    end

    % Save buttonPressCount in the MATLAB workspace
    assignin('base', 'buttonPressCount', buttonPressCount);

end