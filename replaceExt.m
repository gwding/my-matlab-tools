function newName = replaceExt(oldName, newExt)
% replaces the extension of the old name and output a new file name.
%   SYNTAX:
%   newName = replaceExt(oldName, newExt)
%   
%   EXAMPLE:
%   replaceExt('abc.def.gh', '.ik') will return 'abc.def.ik'
%   replaceExt('abc.def.gh', 'ik') will return 'abc.defik'
%
%   NOTE:
%   Only chars after the last dot (including the last dot) is considered as
%   the extension.
%   
% See also: rmExt

% by Weiguang (Gavin) Ding, January 2013

[pathstr, name, ~] = fileparts(oldName);
newName = fullfile(pathstr, [name, newExt]);
