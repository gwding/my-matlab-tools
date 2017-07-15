function copySubfolderContent(dirIn, dirOut, ext)
% copies the content in all the subfolders of input directory to the output
% directory.
%
%   SYNTAX:
%   copySubfolderContent(dirIn, dirOut)
%   copySubfolderContent(dirIn, dirOut, ext)
%
%   INPUT:
%   dirIn, input directory that contains the subfolders.
%   dirOout, output directory that will contain all the files.
%   ext, extension of files want to copy. if want to copy all files, just use
%   '*' or don't input.

% by Weiguang (Gavin) Ding, January 2013

if ~isvar('ext')
    ext = '*';
end
subFolderList = getdir(dirIn);
chkmkdir(dirOut);
for indFolder = 1 : numel(subFolderList)
    if ~strcmp(fullfile(dirIn, subFolderList{indFolder}), dirOut)
        fileList = getfilelist(fullfile(dirIn, subFolderList{indFolder}), ext);
        for indFile = 1 : numel(fileList)
            copyfile(fullfile(dirIn, subFolderList{indFolder}, fileList{indFile}), ...
                fullfile(dirOut, fileList{indFile}));
        end
    end
end