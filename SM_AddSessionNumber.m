function SM_AddSessionNumber (source_path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set the source path
% Example INPUT:
% source_path = fullfile('D:\Studies\01_DREEM3\02_RawData\');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd(source_path)

bids_id = ['sub-001'; 'sub-002'; 'sub-003'; 'sub-004'; 'sub-005'; 'sub-006'; ...
           'sub-007'; 'sub-008'; 'sub-009'; 'sub-010'; 'sub-011'; 'sub-012'; ...
           'sub-013'; 'sub-014'; 'sub-015'; 'sub-016'; 'sub-017'; 'sub-018'; ...
           'sub-019'; 'sub-020'; 'sub-021'];

sessions = ['ses-01'; 'ses-02'; 'ses-03'; 'ses-04'; 'ses-05'; 'ses-06'];

% Loop through each subject and session
for ii = 1:size(bids_id, 1)
    for jj = 1:size(sessions, 1)
        % Construct the folder path for each session
        session_folder = fullfile(source_path, bids_id(ii, :), sessions(jj, :));

        % Check if the session folder exists
        if isfolder(session_folder)
            % Get the list of files in the session folder
            files =  dir(fullfile(session_folder, '*')); 

            for kk = 4:numel(files)
                old_filename = files(kk).name;
                remaining_filename = strrep(old_filename,[bids_id(ii, :) '_'], '');
                new_filename = [bids_id(ii, :) '_' sessions(jj, :) '_' remaining_filename];

                % Get the full file paths
                old_filepath = fullfile(session_folder, old_filename);
                new_filepath = fullfile(session_folder, new_filename);

                % Rename the file
                movefile(old_filepath, new_filepath);

                fprintf('Renamed %s to %s\n', old_filename, new_filename);
            end
        end
    end
end
