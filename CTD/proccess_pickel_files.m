% Process data to get sss_ccc_start_end

function proccess_pickel_files(folderPath,labels)
% labels = {'DAT_015','DAT_016','DAT_017','DAT_018','DAT_019'};%

for i = 1:length(labels)
    disp(labels{i})
    compute_AFP07_dissipation(labels{i},1)
    disp('Done n=1')


    % Specify the folder path
    % folderPath = '/Users/isabelaconde/Documents/microstructure/data/yoyo1';
    
    % Construct the search pattern for the current label
    searchPattern = strcat(labels{i}, '*.P');
    disp(searchPattern)
    
    % List all files matching the pattern in the folder
    files = dir(fullfile(folderPath, searchPattern));
    
    % Iterate through each matching file
    for k = 1:length(files)
        filename = files(k).name; % Get the file name
        disp(filename)
        pause
        
        % Extract the suffix
        prefixLength = length(labels{i});
        suffix = extractAfter(filename, prefixLength);
        disp(suffix)
        pause;
        
        % Remove the '.p' extension
        [~, name, ~] = fileparts(suffix);
        disp(name)
        pause;
        
    end


    compute_AFP07_dissipation(strcat(labels{i}, name),2)
    disp('Done n=2')
    compute_AFP07_dissipation(strcat(labels{i}, name),3)
    disp('Done n=3')
    compute_AFP07_dissipation(strcat(labels{i}, name, '_spectra'),11,'C512_2pole30msecW0')
    disp('Done n=11')
    % compute_AFP07_dissipation(strcat(labels{i}, '_500_2700_spectra'),12,'C512_2pole30msecW0')
    disp('Done n=12')

end 
end