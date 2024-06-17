subTable = readtable('AA_3R205_L_ses01_electrode_F7-O1_EventDetection.txt');
num_spindles = numel(subTable.start_sample)
total_duration = sum(subTable.duration_sec)

subTable = readtable('AA_3R205_L_ses01_electrode_F7-O2_EventDetection.txt');
num_spindles = numel(subTable.start_sample)
total_duration = sum(subTable.duration_sec)

subTable = readtable('AA_3R205_L_ses01_electrode_F8-F7_EventDetection.txt');
num_spindles = numel(subTable.start_sample)
total_duration = sum(subTable.duration_sec)

subTable = readtable('AA_3R205_L_ses01_electrode_F8-O1_EventDetection.txt');
num_spindles = numel(subTable.start_sample)
total_duration = sum(subTable.duration_sec)

subTable = readtable('AA_3R205_L_ses01_electrode_F8-O2_EventDetection.txt');
num_spindles = numel(subTable.start_sample)
total_duration = sum(subTable.duration_sec)