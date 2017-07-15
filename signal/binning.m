function dataOut = binning(dataIn, binSize)
% bins image sequence/video to get lower resolution but higher SNR data.
%
%   SYNTAX:
%   dataOut = binning(dataIn, binSize)
%   
%   INPUT:
%   "dataIn" is the high resolution data
%   "binSize" is a 2d vector, first element is the binning size of rows, second
%   is the binning size of columns. Size of the first 2 dimensions must equal 
%   to binSize * n (an integer).
% 
%   OUTPUT:
%   dataOut is the binned sequence/video.
% 
%   Example:
%   data0 = ones(20, 20, 20);
%   data1 = binning(data0, [3 3]);
%   % this will give you an error
%
%   data2 = binning(data0, [5 5]);
%   % this will give you a 4x4x20 matrix

% by Weiguang (Gavin) Ding, June 2012

%% check the binSize and size of dataIn

if binSize(1) ~= round(binSize(1)) || binSize(2) ~= round(binSize(2))
    error('Elements in binSize are not both integers.')
elseif binSize(1) == 1 && binSize(2) == 1
    dataOut = dataIn;
    return;
elseif size(dataIn, 1) / binSize(1) == round(size(dataIn, 1) / binSize(1)) ...
        && size(dataIn, 2) / binSize(2) == round(size(dataIn, 2) / binSize(2))
else
    warning('Size of dataIn is not equal to binSize times an integer, part of the original data is not used for binning.');
    
end


%% 
dataOut = zeros(round(size(dataIn, 1) / binSize(1)), ...
    round(size(dataIn, 2) / binSize(1)), size(dataIn, 3));

for rowSub = 1 : size(dataOut, 1)
    for colSub = 1 : size(dataOut, 2)
        dataOut(rowSub, colSub, :) = ...
            mean(mean(dataIn((rowSub - 1) * binSize(1) + 1 : rowSub* binSize(1),...
            (colSub - 1) * binSize(2) + 1 : colSub* binSize(2), :), 1), 2);
    end
end


end