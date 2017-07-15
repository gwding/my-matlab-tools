function varargout = cutHalf(data, part)
% cuts half of the data matrix from the original data matrix.
%   SYNTAX:
%   dataHalf = cuthalf(data) cuts and outputs the left half of 2-d or 3-d
%   matrix.
%   dataHalf = cutHalf(data, part) allows specifying which half to output.
%   The options are: 'up', 'down', 'left', 'right', and 'front', 'back' for
%   3-d. If part is not specified, it is assigned as 'left'.
%   
%   NOTE:
%   If any dimension is odd number n, we take (n-1)/2 and (n+1)/2 as the
%   separator.
%   
%   If the input data is a cell, then call cutHalf to process every one of
%   them, and the number of output is the same as the number of elements in
%   the input data cell.

%   by Weiguang (Gavin) Ding, September 2013

if nargin == 1
    part = 'left';
end

if iscell(data)
    varargout = cell(size(data));
    for indData = 1 : numel(data) 
        varargout{indData} = cutHalf(data{indData}, part);
    end
    return;
end

varargout = {};

dimOrig = size(data);
dimHalfEnd = floor(dimOrig / 2);
dimHalfBgn = dimHalfEnd + 1;


if strcmpi(part, 'up')
    varargout{1} = data(1 : dimHalfEnd(1), :, :);
elseif strcmpi(part, 'down')
    varargout{1} = data(dimHalfBgn(1) : end, :, :);
elseif strcmpi(part, 'left')
    varargout{1} = data(:, 1 : dimHalfEnd(2), :);
elseif strcmpi(part, 'right')
    varargout{1} = data(:, dimHalfBgn(2) : end, :);
elseif strcmpi(part, 'front')
    varargout{1} = data(:, :, 1 : dimHalfEnd(3));
elseif strcmpi(part, 'back')
    varargout{1} = data(:, :, dimHalfBgn(3) : end);
end