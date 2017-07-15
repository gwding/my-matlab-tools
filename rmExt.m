function fileName = rmExt(fileNameWithExt)
% removes the extension of a file name.
%   SYNTAX:
%   fileName = rmExt(fileNameWithExt)
%
%   NOTE:
%   Only chars after the last dot (including the last dot) is considered as
%   the extension. 
%
% See also: replaceExt

[~, fileName] = fileparts(fileNameWithExt);