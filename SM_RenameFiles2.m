
files = spm_select('FPListRec', pwd, '.*_eeg.edf')

% Convert char array to cell array of strings for easier handling
files = cellstr(files);

% Loop through each file and rename it
for i = 1:length(files)
    % Get the full file path
    oldFileName = files{i};
    
    % Extract the file parts
    [filePath, name, ext] = fileparts(oldFileName);
    
    % Remove 'eeg' from the end of the name
    newName = regexprep(name, '_eeg$', '');
    
    % Create the new file name
    newFileName = fullfile(filePath, [newName, ext]);
    
    % Rename the file
    movefile(oldFileName, newFileName);
end

disp('File renaming complete.');
