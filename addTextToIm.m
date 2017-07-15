function img = addTextToIm(img, strTxt, varargin)
% adds texts into given image or image sequence.
%   SYNTAX:
%   img1 = addTextToIm(img0, strTxt) outputs img1, by converting strTxt to
%   image and adding it to the top left corner of image img0.
%
%   img1 = addTextToIm(img0, strTxt, 'PropertyName', propertyValue, ...)
%
%   INPUT:
%   "img0" can be a M * N 2D image (2D array), or a M * N * K 3D image
%   sequence, or a M * N * 3 * K 4D color image sequence. Here, M is the
%   number of rows, N is number of columns and K is number frames.
%   "strTxt" is a string with text to be added.
%
%   PropertyName: Scale, Location
%   "Scale" determines the scale of string image. It will be used in
%   imresize(img, scale),
%   "Location" determines the position of top left corner of the string
%   image.
%
%   OUTPUT:
%   "img1" has the same format as img0
%
%   NOTE:
%   This function does not consider the size change of the image. The user
%   should be aware of size change of the output image.
%
% See also: text2im, addTextToAvi

% by Weiguang (Gavin) Ding, September 2013
% TO EXTEND:
%       warning when adding text will change the size of image.

%% Parameter setting
Scale = 1;
Location = [1, 1];

% overwrite default parameters
for k = 1 : 2 : length(varargin)
    eval([varargin{k}, ' = varargin{', int2str(k + 1), '};']);
    eval([upper1stLetter(varargin{k}), ' = varargin{', int2str(k + 1), '};']);
end
%% String image generation
maxVal = max(img(:));
minVal = min(img(:));
imTxt = mat2gray(-text2im(strTxt)) * double(maxVal - minVal) + double(minVal);

if Scale ~= 1
    imTxt = imresize(imTxt, Scale, 'nearest');
end

if ndims(img) <= 3
    imTxt = repmat(imTxt, [1, 1, size(img, 3)]);
elseif ndims(img) == 4
    imTxt = repmat(imTxt, [1, 1, size(img, 3), size(img, 4)]);
else
    error('The input image should have less than 4 dimensions.');
end

%% Put text image into the original image


if ndims(img) <= 3
    img(Location(1) : Location(1) - 1 + size(imTxt, 1),...
    Location(2) : Location(2) - 1 + size(imTxt, 2), :) = imTxt;
elseif ndims(img) == 4
    img(Location(1) : Location(1) - 1 + size(imTxt, 1),...
    Location(2) : Location(2) - 1 + size(imTxt, 2), :, :) = imTxt;
end