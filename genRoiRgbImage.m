function imgOut = genRoiRgbImage(imgIn, imClass, colorOrder)
%   generates a single rgb image with different regions labeled with different colors.
%   
%   SYNTAX:
%   imgOut = genRoiRgbImage(imgIn, imClass, colorOrder)
%
%   INPUT:
%   "imgIn", original input image. It can be rgb image or grayscale image.
%   "imClass", an image with different classified area labeled as different
%   numbers. Regions labeled as 0 will be the background regions. The imClass
%   has the same format as in imClass = bwlabel(...).
%   "colorOrder", it can be char, cell array or colormap matrix containing the 
%   3d rgb values. The char or cell array should have size same as max(imClass(:)).
%
%   OUTPUT:
%   "imgOut", output labelled rgb image.
%
%   See also: genMapRgbImage, genBdrRgbImage

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
    colorCell = cell(size(colorOrder, 1), 1);
    for i = 1 : size(colorOrder, 1)
        colorCell{i} = colorOrder(i, :);
    end
    colorOrder = colorCell;
% else
%     error('Color order must be char, cell or colormap matrix.');
end

% use cell array to represent the 3 rgb channel
imgCell = cell(3, 1);
if size(imgIn, 3) == 1
    for indRgb = 1 : 3
        imgCell{indRgb} = imgIn;
    end
elseif size(imgIn, 3) == 3
    for indRgb = 1 : 3
        imgCell{indRgb} = imgIn(:, :, indRgb);
    end
else
    error('The 3rd dimension of input image must be 1 or 3.');
end

%% image generation

for indClass = 1 : max(imClass(:))
    
    % assign colors
    for indRgb = 1 : 3
        imgCell{indRgb}(imClass == indClass) = colorOrder{indClass}(indRgb);
    end
end

% concatenate to single rgb image.
imgOut = cat(3, imgCell{:});
