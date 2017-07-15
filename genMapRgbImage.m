function [imgOut, map] = genMapRgbImage(imgIn, imgMap, imgMask, dispRange, map)
% generates a single rgb image with both isochrome map and original background.
% 
%   maps here mean maps like activation maps or slope maps. This function 
%   is for display some value on a background image.
%
%   SYNTAX:
%   imgOut = genMapRgbImage(imgIn, imgMap, dispRange)
%   imgOut = genMapRgbImage(imgIn, imgMap, dispRange, map)
%
%   INPUT:
%   "imgIn", original input image. It can be rgb image or grayscale image.
%   "imgMap", an image with a measurement values at each pixel.
%   "imgMask", roi mask for imgMap
%   "dispRange", dispRange(1) is minimum range for display, dispRange(2) is the
%   maximum range for display.
%   "map", colormap, if no input, it will be jet(256).
%
%   OUTPUT:
%   "imgOut", output labelled rgb image.
%   "map", output the colormap used.
%
%   See also: genBdrRgbImage, genRoiRgbImage

% by Weiguang (Gavin) Ding, February 2013

%%
if ~isvar('map')
    map = jet(256);
end
if size(imgIn, 3) == 1
    imgIn = repmat(imgIn, [1, 1, 3]);
end

imgMask = repmat(imgMask, [1, 1, 3]);
imgMap = gray2rgb(imgMap, dispRange, map);
imgOut = imgMask .* imgMap + ~imgMask .* imgIn;