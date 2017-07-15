function tokenCell = strtok2cell(str, varargin)
% parses the string in to parts and stores these parts in a cell array.
%   this function is a 'parse to the end' version of the matlab inbuilt
%   function strtok.
%   SYNTAX:
%   tokenCell = strtok2cell(str)
%   tokenCell = strtok2cell(str, ...)
%   
%   INPUT:
%   Please refer to matlab inbuilt function strtok
%
%   OUTPUT:
%   "tokenCell" is a cell array with each element contains a single token
%
% See also: strtok

% by Weiguang (Gavin) Ding, October 2013


remain = str;
tokenCell = {};

while ~isempty(remain)
    if nargin > 1
        [token, remain] = strtok(remain, varargin);
    else
        [token, remain] = strtok(remain);
    end
    tokenCell = [tokenCell, token];
end