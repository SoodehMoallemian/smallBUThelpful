function SM_GetDEF_a7(source_path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT: source_path = fullfile('D:\Studies\01_DREEM3\02_RawData\');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding subjects' info to the table

id = ['sub001';'sub002';'sub003';'sub004';'sub005';'sub006';...
    'sub007';'sub008';'sub009';'sub010';'sub011';'sub012';'sub013'; ...
    'sub014';'sub015';'sub016';'sub017';'sub018';'sub019';'sub020'; ...
    'sub021'];
age = [80;82;77;81;60;76;76;62;72;62;66;75;60;68;77;63;76;74;75;70;73];
sex = [1;1;1;1;1;0;1;1;1;1;1;1;0;0;1;1;1;1;1;1;0;1;0;1];
edu = [12;12;12;14;14;16;11;10;1612;16;18;14;13;14;14;12;14;12;70;13];
absSigPow_Th = [];
relSigPow_Th = [];
cd(source_path)

for sub_i =3 : size(sub_id,1)
    if isfolder(fullfile(source_path,folders(sub_i).name,'ses-01','Spindles'))
        SpindleFold = fullfile(source_path,folders(sub_i).name,'ses-01','Spindles');
        load([SpindleFold,'DEFa7.mat']);
        absSigPow_Th(end) = DEF_a7.absSigPow_Th;
        relSigPow_Th(end) = DEF_a7.relSigPow_Th;
    elseif isfolder(fullfile(source_path,folders(sub_i).name,'ses-02','Spindles'))
        SpindleFold = fullfile(source_path,folders(sub_i).name,'ses-02','Spindles');
        fprintf('for subejct %s we are taking session 2 as the first night.', id(sub_i))
        load([SpindleFold,'DEFa7.mat']);
        absSigPow_Th(end) = DEF_a7.absSigPow_Th;
        relSigPow_Th(end) = DEF_a7.relSigPow_Th;
    else
        error('this subject has no spindles detected.')
    end
end
    sub_table = table(id,age,sex,edu,absSigPow_Th,relSigPow_Th)
    writetable(sub_table,'SubjectsSpindleInfo.csv')
end