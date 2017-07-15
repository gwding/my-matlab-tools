function imgOut = genBdrRgbImage(imgIn, bdrCell, colorOrder, lineWidth)
% generates a single rgb image with differently color labeled boundaries.
%   SYNTAX:
%   imgOut = genBdrRgbImage(imgIn, bdrCell, colorOrder, lineWidth)
%
%   INPUT:
%   "imgIn", original input image. It can be rgb image or grayscale image.
%   "bdrCell", a cell array containing the boundaries generated by bwboundaries
%   function. Each cell contains one type of boundary (with same color) 
%   but each boundary might contain multiple pieces.
%   "colorOrder", it can be char/string or cell array containing the 3d rgb values.
%   The char or cell array should have same size as bdrCell
%   "lineWidth", boundary width shown on the output image. If input is even
%   number, the actual width would be n+1. (e.g. if input 2, the actual width
%   would be 3).
%
%   OUTPUT:
%   "imgOut", output labelled rgb image.
%
%   See also: genMapRgbImage, genRoiRgbImage

% by Weiguang (Gavin) Ding, February 2013

%% Dealing with input parameters

% change the color order to cell of rgb values if the input is char
if ischar(colorOrder)
    colorCell = cell(size(colorOrder));
    for indColor = 1 : numel(colorOrder)
        colorCell{indColor} = convert_color(colorOrder(indColor));
    end
    colorOrder = colorCell;
elseif ~iscell(colorOrder)
    error('Color order must be char or cell');
end

% use cell array to represent the 3 rgb channel
imgCell = cell(3, 1);
if size(imgIn, 3) == 1
    imgSize = size(imgIn);
    for indRgb = 1 : 3
        imgCell{indRgb} = imgIn;
    end
elseif size(imgIn, 3) == 3
    imgSize = [size(imgIn, 1), size(imgIn, 2)];
    for indRgb = 1 : 3
        imgCell{indRgb} = imgIn(:, :, indRgb);
    end
else
    error('The 3rd dimension of input image must be 1 or 3.');
end

%% boundary and image generation

for indCell = 1 : numel(bdrCell)
    
    % generate boundary mask according to the input boundary coordinates
    imgBdrMask = false(imgSize);
    for indBdr = 1 : numel(bdrCell{indCell})
        imgBdrMask(sub2ind(imgSize, bdrCell{indCell}{indBdr}(:, 1), bdrCell{indCell}{indBdr}(:, 2))) = true;
    end
    
    % dilation if boundary width is larger than one.
    if lineWidth > 1
        se = strel('diamond', round((lineWidth - 1) / 2));
        imgBdrMask = imdilate(imgBdrMask, se);
    end
    
    % assign colors
    for indRgb = 1 : 3
        imgCell{indRgb}(imgBdrMask) = colorOrder{indCell}(indRgb);
    end
end

% concatenate to single r, g and b image.
imgOut = cat(3, imgCell{:});
