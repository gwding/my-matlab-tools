function dirList = getdir(rootDir)
% outputs all the list of all the folders in given directory
%   SYNTAX:
%   dirList = getdir(rootDir) finds all the dirs inside rootDir and return 
%   the cell array dirList, which contains the strings representing folder
%   names.
%
% See also: getfilelist

% by Weiguang (Gavin) Ding, Apr 2012

folderArray = dir(rootDir);
% remove non-folder, and current and parent folder
folderArray([folderArray.isdir] == 0) = []; 
folderArray(strcmp('.', {folderArray.name})) = []; 
folderArray(strcmp('..', {folderArray.name})) = []; 

dirList = {folderArray.name};
end

