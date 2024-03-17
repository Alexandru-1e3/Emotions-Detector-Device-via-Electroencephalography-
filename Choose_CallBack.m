function Choose_CallBack(source, ~)
    % Makes the couter of the data variables
    cla;
    selected = get(source, 'Value');
    assignin('base', 'selected', selected);
end