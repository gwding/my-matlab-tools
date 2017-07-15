function fileList = getfilelist( rootDir, ext, varargin )
% outputs all the files with certain extensions in a certain directory
%   SYNTAX:
%   fileList = getfilelist(rootDir, ext): "rootDir" is the folder which you 
%   want to search for files. "ext" is the extension of wanted files. The
%   output "fileList" is a cell array, each cell contains the file name
%   string.
%
%   fileList = getfilelist(rootDir, ext, PropertyName, PropertyValue, ...)
%   specifies some of the properties.
%   
%   INPUT:
%   "rootDir" is the folder which you want to search for files. 
%   "ext" is the extension of wanted files. The output "fileList" is a cell 
%   array, each cell contains the file name.
%
%   PropertyName: NeedSort, WithExt
%   "NeedSort", if specified as 1, the file names will be sorted in natural
%   order using function sort_nat. Default value 1.
%   "WithExt", if specified as 1, the file name will contain the extension,
%   otherwise the extension will be excluded. Default value 1.
%
%   OUTPUT:
%   "fileList" is a cell array, each cell contains the file name string.
%
% See also getdir, sort_nat

% by Weiguang (Gavin) Ding, May 2012

NeedSort = 1;
WithExt = 1;

% overwrite default
for k = 1 : 2 : length(varargin)
    eval([varargin{k}, ' = varargin{', int2str(k + 1), '};']);
    eval([upper1stLetter(varargin{k}), ' = varargin{', int2str(k + 1), '};']);
end

if ~isvar('ext')
    ext = '.mat';
end


fileArray = dir([rootDir, filesep, '*', ext]);
fileArray(strcmp('.', {fileArray.name})) = []; 
fileArray(strcmp('..', {fileArray.name})) = []; 
fileList = {fileArray.name}';


if ~WithExt
    for indFile = 1 : numel(fileList)
        fileList{indFile} = fileList{indFile}(1 : end - length(ext));
    end
end


if NeedSort
    fileList = sort_nat(fileList);
end

end

