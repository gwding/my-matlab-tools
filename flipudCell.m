function cellX = flipudCell(cellX)
% does flipud for every element of in the cell.
%   SYNTAX:
%   cellOut = flipudCell(cellIn) 
%   
%   INPUT:
%   "cellIn" is cell array containing elements to be flipped
%   
%   OUTPUT:
%   "cellX" is the averaged array.

% by Weiguang (Gavin) Ding, September 2013

for i = 1 : numel(cellX)
    cellX{i} = flipud(cellX{i});
end