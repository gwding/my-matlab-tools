function [RGB, X] = gray2rgb(I, range, map)
% converts gray scale image to rgb image according to given intensity range and colormap
%   Please also refer to gray2indWithRange, ind2rgb
%   
%   SYNTAX:
%   [RGB, X] = gray2rgb(I, range, map)
%
%   INPUT:
%   "I", grayscale image
%   "range", dynamic range you want to convert.
%   "map", colormap would like to use
% 
%   OUTPUT:
%   "RGB", converted rgb image
%   "X", converted indxed image
%
%   See also: gray2indWithRange, gray2ind, ind2rgb

% by Weiguang (Gavin) Ding, November 2012

%%
if ~isvar('range')
    range = [min(I(:)), max(I(:))];
end

if ~isvar('map')
    map = gray(256);
end

n = size(map, 1);
X = gray2indWithRange(I, n, range);
RGB = ind2rgb(X, map);


