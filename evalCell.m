function evalCell(inputCell)
% excutes the string matlab commands stored in cell squentially.
%
%   SYNTAX:
%   evalCell(inputCell)
%
%   INPUT:
%   inputCell is a cell array whose elements are strings representing
%   matlab commands.

% by Weiguang (Gavin) Ding, September 2013

%%
for i = 1 : numel(inputCell)
    eval(inputCell{i});
end