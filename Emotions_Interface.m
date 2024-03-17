% Emotions interface

Sub_Menu = figure('Name','Emotions', ...
    'Units', 'normalized', ...
    'Position',[0.04 0.058 0.75 0.835], ...
    'NumberTitle','off', ...
    'Color', [0.78 0.78 0.78]);


%Empty plot
plotPosition = [0.33 0.2 0.64 0.75];    
plotaxes = axes('Position', plotPosition);
getframe;
grid on;
xlabel('time_{sec}');
ylabel(plotaxes, '\muV');
assignin('base', 'plotaxes', plotaxes);

%Empty image
imgPosition = [0.02 0.5 0.25 0.35];    
imgaxes = axes('Position', imgPosition);
Initial_Image = imread("No_Image_Start.png");
imshow(Initial_Image);


% Emotion Label + Emotion text box
Initial_Emotion_Label = uicontrol('Style', 'text', ...
    'Units', 'normalized', ...
    'String', 'Emotions:', ...
    'Position', [0.02 0.43 0.25 0.03], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 12, ...
    'Callback','');

max_emot = 5; % Total number of emotions
emot_boxes = zeros(max_emot, 1);
assignin('base', 'emot_boxes', max_emot);
assignin('base', 'max_emot', max_emot);

emotion_Names = {'Anger', 'Disgust', 'Fear', 'Joy', 'Sadness'};
assignin('base', 'emotion_Names', emotion_Names);


for i = 1 : max_emot
    % Use a function create the emotion interface
    emot_boxes (i) = uicontrol('Style','text', ...
        'Units', 'normalized', ...
        'String', emotion_Names{i}, ...
        'Position', [0.02 0.43 - i * 0.03 0.25 0.03], ...
        'BackgroundColor', [0.74 0.74 0.74], ...
        'ForegroundColor', [0 0 0.1], ...
        'FontName', 'Yu Gothic UI Semilight',...
        'FontSize', 10, ...
        'Callback', '');
end
assignin('base', 'emot_boxes', emot_boxes);


% Play button for the animation
Play_Button = uicontrol( 'Style','pushbutton', ...
    'Units','normalized', ...
    'String', 'Play', ...
    'Position', [0.1 0.2 0.1 0.065], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 15, ...
    'Callback', @Play_CallBack);


% Close pushbutton
uicontrol('Style','pushbutton', ...
    'Units','normalized', ...
    'String','CLOSE', ...
    'Position', [0.85 0.08 0.1 0.08], ...
    'BackgroundColor', [0.74 0.74 0.74], ...
    'ForegroundColor', [0 0 0.1], ...
    'FontName', 'Yu Gothic UI Semilight',...
    'FontSize', 15, ...
    'Callback','close');  