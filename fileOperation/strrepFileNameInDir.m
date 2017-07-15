function strrepFileNameInDir(rootDir, oldSubstr, newSubstr, ext)
% renames files in a certain dir by replacing substrings.
%   SYNTAX:
%   strrepFileNameInDir(rootDir, oldSubstr, newSubstr), renames files in a 
%   certain dir (rootDir) by replace new substring (newSubstr) to specified 
%   substring (oldSubstr).
%
%   strrepFileNameInDir(rootDir, oldSubstr, newSubstr, ext), specifies the 
%   end of file name by inputting ext. For example, '.mat' will only rename
%   mat files.

% by Weiguang (Gavin) Ding, May 2012


if nargin < 4
    ext = '';
end
fileList = getfilelist(rootDir, ext);

for i = 1 : numel(fileList)
    if numel(strfind(fileList{i}, oldSubstr)) > 0
        newFileName = strrep(fileList{i}, oldSubstr, newSubstr);
        movefile(fullfile(rootDir, fileList{i}), fullfile(rootDir, newFileName));
    end
end

end