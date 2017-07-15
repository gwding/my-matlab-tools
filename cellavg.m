function avgArray = cellavg(cellArray)
% averages over the cell elements if appicable.
%   SYNTAX:
%   avgArray = cellavg(cellArray) calculates the average of cell elements
%   in the given cellArray, that is the avgArray
%   
%   INPUT:
%   "cellArray" is cell array of elements that are of the same data type and
%   can be averaged.
%   
%   OUTPUT:
%   "avgArray" is the averaged array.
%
%   NOTE:
%   The cell elements might not be averagable. Users should be aware of
%   this.

% by Weiguang (Gavin) Ding, September 2013
% TO EXTEND:
%       dealing with unaveragable cell elements.

%% sum and the divided by the number
sumArray = cellArray{1};
for indCell = 2 : numel(cellArray)
    sumArray = sumArray + cellArray{indCell};
end
avgArray = sumArray / numel(cellArray);
