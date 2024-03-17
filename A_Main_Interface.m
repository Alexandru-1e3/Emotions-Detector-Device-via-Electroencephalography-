clc;
clear all;
close all;

% Main interface
Menu = figure('Name','Main Menu', ...
    'Units', 'normalized', ...
    'Position',[0.04 0.058 0.75 0.835], ...
    'NumberTitle','off', ...
    'Color', [0.78 0.78 0.78]);


% Saves the workspace in the working directory
h = uimenu('Label','Save','Callback','savefig');
% Opens the documentation
d = uimenu('Label','Documentation', 'Callback', @Documentation_CallBack);


% Menu for introducing the data
In_Data = uicontrol( 'Style','pushbutton', ...
    'Units','normalized', ...
    'String', 'Introduce the eeg data', ...
    'Position', [0.02 0.90 0.15 0.05], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Callback', @In_Data_CallBack);

% Menu to check if there is any data loaded
Data_Check = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'No Data!', ...
    'Position', [0.02 0.85 0.15 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Callback', '');
assignin('base', 'Data_Check', Data_Check);

% Button GUI element
Button_Check = uicontrol('Style', 'Text', ...
        'Units', 'normalized', ...
        'String', '', ...
        'Position', [0.02 0.75 0.15 0.08], ...
        'BackgroundColor', [0.74 0.74 0.74], ...
        'ForegroundColor', [0 0 0.1], ...
        'FontName', 'Yu Gothic UI Semilight',...
        'FontSize', 15, ...
        'Visible', 'off', ...
        'Callback','');
assignin('base', 'Button_Check', Button_Check);


% Menu to show the raw data from the headset
max_boxes = 12; % Total number of checkboxes
data_boxes = cell(max_boxes, 1);
assignin('base', 'data_boxes', data_boxes);
assignin('base', 'max_boxes', max_boxes);

data_Names = {'Attention', 'Meditation', 'Derived', 'Total Power', ...
    'Alpha1', 'Alpha2', 'Beta1', 'Beta2', 'Delta', 'Gamma1', ...
    'Gamma2', 'Theta'};

for i = 1 : max_boxes
    % Use a function handle to pass the correct arguments to the callback
    data_boxes {i} = uicontrol('Style','checkbox', ...
        'Units', 'normalized', ...
        'String', data_Names{i}, ...
        'Position', [0.2 0.95 - i * 0.02 0.09 0.02], ...
        'BackgroundColor', [0.74 0.74 0.74], ...
        'ForegroundColor', [0 0 0.1], ...
        'FontName', 'Yu Gothic UI Semilight',...
        'FontSize', 10, ...
        'Callback', {@display_initial_value, i});
end

%Empty plot
plotPosition = [0.33 0.2 0.64 0.75];    
axes_plot = axes('Position', plotPosition);
getframe;
grid on;
xlabel('time_{sec}');
assignin('base', 'axes_plot', axes_plot);


% Menu to do some analysis operations on the collected data
Signal_Analysis_Label = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'Raw Signal Analysis', ...
    'Position', [0.02 0.52 0.2 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Callback', '');

Signal_Analysis = uicontrol('Style', 'popupmenu', ...
    'Units', 'normalized', ...
    'String', ' Initial Values | Derivative | Intergal | Fourier Transform ', ...
    'Position', [0.02 0.5 0.2 0.02], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Callback', @Signal_Analysis_CallBack);


%Choose the signal gui
Choose_Label = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'Choose the signal to differentiate:', ...
    'Position', [0.02 0.4 0.2 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Choose_Label', Choose_Label);

Choose = uicontrol('Style', 'popupmenu', ...
    'Units', 'normalized', ...
    'String', data_Names, ...
    'Position', [0.02 0.38 0.2 0.02], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', @Choose_CallBack);
assignin('base', 'Choose', Choose);


%Derivative gui

% Plot the first order derivative
Dev1_Label = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'The first order derivative:', ...
    'Position', [0.02 0.3 0.2 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Dev1_Label', Dev1_Label);


Plot1 = uicontrol( 'Style','pushbutton', ...
    'Units','normalized', ...
    'String', 'Plot', ...
    'Position', [0.09 0.24 0.05 0.05], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', @Plot_dev1_CallBack);
assignin('base', 'Plot1', Plot1);

% Plot the second order derivative
Dev2_Label = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'The second order derivative:', ...
    'Position', [0.02 0.19 0.2 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Dev2_Label', Dev2_Label);


Plot2 = uicontrol( 'Style','pushbutton', ...
    'Units','normalized', ...
    'String', 'Plot', ...
    'Position', [0.09 0.13 0.05 0.05], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', @Plot_dev2_CallBack);
assignin('base', 'Plot2', Plot2);


% Integral gui

% The upper limit of the integral
Int_Label = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'Choose the upper integration limit:', ...
    'Position', [0.02 0.3 0.2 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Int_Label', Int_Label);

Integral_up_limit = uicontrol('Style','slide',... 
    'Units','normalized',...
    'Position',[0.04 0.27 0.15 .03],... 
    'Min',1 ,'Max',100,'Value',1 ,...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', @int_of_data) ;
assignin('base', 'Integral_up_limit', Integral_up_limit);

min_lim = uicontrol('Style','text',... 
    'Units','normalized',...
    'String',num2str(get(Integral_up_limit,'Min')), ...
    'Position',[0.02 0.27 0.02 .03],...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback','');
assignin('base', 'min_lim', min_lim);

max_lim = uicontrol('Style','text',... 
    'Units','normalized',...
    'String',num2str(get(Integral_up_limit,'Max')), ...
    'Position',[0.19 0.27 0.03 0.03],...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback','');
assignin('base', 'max_lim', max_lim);

% Definite integral value
Int_val = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'The value of the definite integral: 0 ', ...
    'Position', [0.02 0.18 0.2 0.06], ... 
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 12, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Int_val', Int_val);

% Average value
Avr_val = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'The average value: 0 ', ...
    'Position', [0.02 0.11 0.2 0.06], ... 
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 12, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Avr_val', Avr_val);


% Fourier gui

% The fundamental freq.
Fun_Freq = uicontrol('Style', 'Text', ...
    'Units', 'normalized', ...
    'String', 'The predominant harmonic at:   Hz', ...
    'Position', [0.02 0.28 0.2 0.06], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 12, ...
    'Visible', 'off', ...
    'Callback', '');
assignin('base', 'Fun_Freq', Fun_Freq);

% The plot in frequency domain
Plot_freq = uicontrol( 'Style','pushbutton', ...
    'Units','normalized', ...
    'String', 'Plot', ...
    'Position', [0.09 0.21 0.05 0.05], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 10, ...
    'Visible', 'off', ...
    'Callback', @four_of_data);
assignin('base', 'Plot_freq', Plot_freq);


% Menu to enter the other part of the app
Emotion_Enter = uicontrol( 'Style','pushbutton', ...
    'Units','normalized', ...
    'String', 'Emotions handling', ...
    'Position', [0.55 0.04 0.2 0.08], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 15, ...
    'Callback', @emotion);  


% Close pushbutton
uicontrol('Style','pushbutton', ...
    'Units','normalized', ...
    'String','CLOSE', ...
    'Position', [0.85 0.04 0.1 0.08], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 15, ...
    'Callback','close; clc; clear all; close all;'); 