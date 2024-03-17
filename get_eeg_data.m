function eeg_data = get_eeg_data(~, ~)
    data = readtable("EEG_Device_Data.csv");

    eeg_data_time = data.time;
    eeg_data_Att = data.Attention;
    eeg_data_Med = data.Meditation;
    eeg_data_Der = data.Derived;
    eeg_data_Pwr = data.totPwr;
    eeg_data_Al1 = data.Alpha1;
    eeg_data_Al2 = data.Alpha2;
    eeg_data_Bt1 = data.Beta1;
    eeg_data_Bt2 = data.Beta2;
    eeg_data_Del = data.Delta;
    eeg_data_Gm1 = data.Gamma1;
    eeg_data_Gm2 = data.Gamma2;
    eeg_data_Tht = data.Theta;

    eeg_data = {eeg_data_Att, eeg_data_Med, eeg_data_Der, eeg_data_Pwr, ...
        eeg_data_Al1, eeg_data_Al2, eeg_data_Bt1, eeg_data_Bt2, eeg_data_Del, ...
        eeg_data_Gm1, eeg_data_Gm2, eeg_data_Tht, eeg_data_time};
    
    % To save the data in the workspace
    assignin('base', 'eeg_data', eeg_data);
end