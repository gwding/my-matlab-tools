srcDir = '/ensc/IMAGEBORG/STUDENTS/WDING/Zebrafish/PROCESSED_DATA/NEW/May_22/BinSize4x4/EhancedData';

fileList = [{fullfile(srcDir, 'Temp_18.i0.c0.mat.avi')},...
    {fullfile(srcDir, 'Temp_28.i0.c0.mat.avi')};...
    {fullfile(srcDir, 'Temp_18.i0.c0.mat.avi')}, ...
    {fullfile(srcDir, 'Temp_28.i0.c0.mat.avi')}];

aviCat(fileList, 'a.avi');