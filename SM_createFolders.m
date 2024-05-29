function SM_createFolders(num_Folders, fold_path, base_name)
% this script creates folders based on given names in a given path
% INPUTS:
% num_Folders = number of folders you need to create
% fold_path = path to where the folders must be created in
% base_name = the base name for the folders
%
%
% Soodeh Moallemian, Ph.D. Rutgers-Newark 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Check if the path exists
    if ~isfolder(fold_path)
        error('The specified path does not exist.');
    end
    
    % Create the folders
    for i = 1:num_Folders
        folderName = fullfile(fold_path, [base_name,'_' sprintf('%03d', i)]);
        if ~isfolder(folderName)
            mkdir(folderName);
            fprintf('Folder created: %s\n', folderName);
        else
            fprintf('Folder already exists: %s\n', folderName);
        end
    end
end