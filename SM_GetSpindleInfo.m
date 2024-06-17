function SM_GetSpindleInfo(source_path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT: source_path = fullfile('D:\Studies\01_DREEM3\02_RawData\');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add subjects' info to the table
bids_id = ['sub001';'sub002';'sub003';'sub004';'sub005';'sub006';...
    'sub007';'sub008';'sub009';'sub010';'sub011';'sub012';'sub013'; ...
    'sub014';'sub015';'sub016';'sub017';'sub018';'sub019';'sub020'; ...
    'sub021'];
% id = ['AA_3R205_L';'AA_3R455_L';'AA_4R086_L';'AA_5R174_L';'AA_R152_L_d';...
% 'AA_R385_L';'COV039';'COV046';'COV053';'COV076';'COV099';'COV106';...
% 'COV111';'COV114';'COV121';'COV132';'COV178';'COV179';'COV182';'COV191';...
% 'COV207'];
age = [80;82;77;81;60;76;76;62;72;62;66;75;60;68;77;63;76;74;75;70;73];
sex = [1;1;1;1;1;0;1;1;1;1;1;1;0;0;1;1;1;1;1;1;0;1;0;1];
edu = [12;12;12;14;14;16;11;10;1612;16;18;14;13;14;14;12;14;12;70;13];
absSigPow_Th = [];
relSigPow_Th = [];
sigCov_Th = [];
sigCorr_Th = [];
minDurSpindleSec = [];

% Change to the source directory
cd(source_path)

for sub_i =1 : size(bids_id,1)
    if isfolder(fullfile(source_path,bids_id(sub_i,:),'ses-01','Spindles'))
        SpindleFold = fullfile(source_path,bids_id(sub_i,:),'ses-01','Spindles');
        load(fullfile(SpindleFold,'DEF_a7.mat'));
        absSigPow_Th = [absSigPow_Th; DEF_a7.absSigPow_Th];
        relSigPow_Th = [relSigPow_Th; DEF_a7.relSigPow_Th];
        sigCov_Th = [sigCov_Th; DEF_a7.sigCov_Th];
        sigCorr_Th = [sigCorr_Th; DEF_a7.sigCorr_Th];
        minDurSpindleSec = [minDurSpindleSec; DEF_a7.minDurSpindleSec];
        minDurSpindleSec(end) = DEF_a7.minDurSpindleSec;
    elseif isfolder(fullfile(source_path,bids_id(sub_i,:),'ses-02','Spindles'))
        SpindleFold = fullfile(source_path,bids_id(sub_i,:),'ses-02','Spindles');
        fprintf('for subejct %s we are taking session 2 as the first night.\n', bids_id(sub_i,:))
        load(fullfile(SpindleFold,'DEF_a7.mat'));
        absSigPow_Th = [absSigPow_Th; DEF_a7.absSigPow_Th];
        relSigPow_Th = [relSigPow_Th; DEF_a7.relSigPow_Th];
        sigCov_Th = [sigCov_Th; DEF_a7.sigCov_Th];
        sigCorr_Th = [sigCorr_Th; DEF_a7.sigCorr_Th];
        minDurSpindleSec = [minDurSpindleSec; DEF_a7.minDurSpindleSec];
    else
        Warning(fprintf('this subject has no spindles detected: %s \n',bids_id(sub_i,:)))
        absSigPow_Th = [absSigPow_Th; 'NAN'];
        relSigPow_Th = [relSigPow_Th; 'NAN'];
        sigCov_Th = [sigCov_Th; 'NAN'];
        sigCorr_Th = [sigCorr_Th; 'NAN'];
        minDurSpindleSec = [minDurSpindleSec; 'NAN'];
    end
end
sub_table = table(bids_id,age,sex,edu,absSigPow_Th,relSigPow_Th,sigCov_Th,...
    sigCorr_Th,minDurSpindleSec);
writetable(sub_table,'SubjectsSpindleInfo.csv')
end