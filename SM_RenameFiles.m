function SM_RenameFiles()
% Set the source path
source_path = fullfile('D:\Studies\01_DREEM3\02_RawData\');
cd(source_path)

% Define the BIDS IDs, subject IDs, age, sex, and education arrays
bids_id = ['sub001'; 'sub002'; 'sub003'; 'sub004'; 'sub005'; 'sub006'; ...
           'sub007'; 'sub008'; 'sub009'; 'sub010'; 'sub011'; 'sub012'; ...
           'sub013'; 'sub014'; 'sub015'; 'sub016'; 'sub017'; 'sub018'; ...
           'sub019'; 'sub020'; 'sub021'];

id = [{'AA_3R205_L'}; {'AA_3R455_L'}; {'AA_4R086_L'}; {'AA_5R174_L'}; ...
      {'AA_R152_L'}; {'AA_R385_L'}; {'COV039'}; {'COV046'}; {'COV053'}; ...
      {'COV076'}; {'COV099'}; {'COV106'}; {'COV111'}; {'COV114'}; {'COV121'}; ...
      {'COV132'}; {'COV178'}; {'COV179'}; {'COV182'}; {'COV191'}; {'COV207'}];

age = [80; 82; 77; 81; 60; 76; 76; 62; 72; 62; 66; 75; 60; 68; 77; 63; 76; 74; 75; 70; 73];
sex = [1; 1; 1; 1; 1; 0; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 0; 1; 0; 1];
edu = [12; 12; 12; 14; 14; 16; 11; 10; 16;12; 16; 18; 14; 13; 14; 14; 12; 14; 12; 70; 13];

% Get list of folders in source path
Folders = dir(source_path);

% Loop through each folder and rename files
for ii = 1:numel(id)
    % Get subject's old ID and BIDS ID
    sub_OldId = char(id(ii));
    sub_BidsId = bids_id(ii, :); 

    % Get the list of files that match the old ID
    OldIdFiles = dir(fullfile(source_path, '**', [sub_OldId '*'])); 

    % Rename the files to use the BIDS ID
    renameFiles(OldIdFiles, sub_BidsId, sub_OldId);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to rename files
function renameFiles(OldIdFiles, newId, oldId)
    for jj = 1:numel(OldIdFiles)
        oldFileName = fullfile(OldIdFiles(jj).folder, OldIdFiles(jj).name);
        [pathstr, name, ext] = fileparts(oldFileName);
        newFileName = fullfile(pathstr, strrep(name, oldId, newId));
        movefile(oldFileName, [newFileName, ext]);
    end
end