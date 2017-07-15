function [data, fileList] = imVolRead( imDir, ext, params)
% reads grayscale images in a folder to a 3d matrix
%   SYNTAX:
%   data = imVolRead( imDir, ext )
%   [data, fileList] = imVolRead( imDir, ext, params)
%
%   INPUT:
%   imDir is the folder name contains the images to be read in.
%   ext stands for the extension of the images files.
%   params contains the optional parameters
%       .scale specifies whether the images will be rescaled. The way to use
%       scale is same as it is used in function imresize
%       .nBgn specifies the starting image index to be read
%       .nEnd specifies the ending image index to be read
%
%   OUTPUT:
%   data is the returned 3d matrix contains the image stack.
%   fileList is the name of images read into the data.

% by Weiguang (Gavin) Ding, June 2012



fileList = getfilelist(imDir, ext);

if nargin < 3
    scale = 1;
    nBgn = 1;
    nEnd = numel(fileList);
else
    scale = params.scale;
    nBgn = params.nBgn;
    nEnd = params.nEnd;
end

% remove unwanted images
fileList([1 : nBgn - 1, nEnd + 1 : numel(fileList)]) = [];

im = imread([imDir filesep fileList{1}]);


% rescale if need to
needScale = false;
if numel(scale) == 2
    if scale(1) == size(im, 1) && scale(2) == size(im, 2)
    else
        im = imresize(im, scale);
        needScale = true;
    end
elseif scale ~= 1
    im = imresize(im, scale);
    needScale = true;
end

if needScale
    data = imVolReadWithScale(imDir, fileList, size(im, 1), size(im, 2), scale);
else
    data = imVolReadNoScale(imDir, fileList, size(im, 1), size(im, 2));
end

end

% helper function for read data with no rescaling need
function data = imVolReadNoScale(imDir, fileNameArray, rowSize, colSize)
numIms = numel(fileNameArray);
data = zeros([rowSize, colSize, numIms]);
for nIms = 1 : numIms
    imName = [imDir filesep fileNameArray{nIms}];
    data(:, :, nIms) = imread(imName);
end
end

% helper function for read data that needs rescaling
function data = imVolReadWithScale(imDir, fileNameArray, rowSize, colSize, scale)
numIms = numel(fileNameArray);
data = zeros([rowSize, colSize, numIms]);
for nIms = 1 : numIms
    imName = [imDir filesep fileNameArray{nIms}];
    data(:, :, nIms) = imresize(imread(imName), scale);
end
end
