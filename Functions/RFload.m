function data = RFload

    experiment = 'RF_1';
    raw_data_path = 'C:\Users\BEC1\Dropbox (MIT)\BEC1\Image Data and Cicero Files\Data - Raw Images';
    processed_data_path = 'C:\Users\BEC1\Dropbox (MIT)\BEC1\Processed Data';
    [source,tempfolder,destination] = foldermanagement(raw_data_path,processed_data_path,experiment);

    finds2img = questdlg('Do you have a state 2 image?', ...
        'Yes', ...
        'Yes','Yes','No','No');
    % Handle response
    switch choice
        case 'Ice cream'
            disp([choice ' coming right up.'])
            dessert = 1;
        case 'Cake'
            disp([choice ' coming right up.'])
            dessert = 2;
        case 'No thank you'
            disp('I''ll bring you your check.')
            dessert = 0;
    end
    
    [filenames,PathName,~] = uigetfile('*.fits','Select the dataset',source,'MultiSelect','on');
    
    
    
    
    
end


function [source,tempfolder,destination] = foldermanagement(raw_data_path,processed_data_path,experiment)
% prepare the folders to get raw data from, copy to while working, and
% finally save to after finishing.
    c=clock;
    year = num2str(c(1));
    month = strcat(year,'-',num2str(c(2)));
    day = strcat(month,'-',num2str(c(3)-1,'%02d'));

    source = strcat(raw_data_path,'\',year,'\',month,'\',day);
    tempfolder = strcat('C:\',year,'\',month,'\',day);
    destination=strcat(processed_data_path,'\',year,'\',month,'\',day,'\',experiment); % Put the image files in here

    if not(isdir(source))
        source = pwd;
    end
    if not(isdir(tempfolder))
        mkdir(tempfolder);
    end
    if not(isdir(destination))
        mkdir(destination);
    end
end