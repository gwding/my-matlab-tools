function graymat2avi_batch(srcDir, tarDir, params)
% converts .mat files in certain directory to avi videos in the target 
% directory by calling function graymat2avi.

% by Weiguang (Gavin) Ding, November 2013

fileList = getfilelist(srcDir, '.mat');
for indFile = 1 : numel(fileList)
    disp(fileList{indFile});
    dataName = fullfile(srcDir, fileList{indFile});
    videoName = fullfile(tarDir, sprintf('%s_fr%d.avi', fileList{indFile}(1 : end - 4), params.frameRate));
    data = matfile2vars(dataName, 'data');
    graymat2avi(data, params.scale, params.frameRate, videoName, params.map);
end