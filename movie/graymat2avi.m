function varargout = graymat2avi(data, scale, frameRate, fileName, map)
% converts grayscale data matrix to avi video and matlab mov variable
%   SYNTAX:
%   graymat2avi(data, scale, frameRate, fileName, map)
%   mv = graymat2avi(data, scale, frameRate, fileName, map)
%
%   INPUT:
%   "data" can be 3d m * n * k matrix, where m and n are the dimension of
%   images and k is number of frames.
%   "scale" is used by image resize, like [320 400] or 0.9
%   "frameRate" is the avi video frame rate
%   "fileName" is the full name of avi file, if don't want to save as .avi
%   file, just input it as [] or ''.
%   "map" is the colormap want to use
%
%   OUTPUT:
%   "mov" is the output matlab movie variable. if not used, then there's no
%   output movie variable, only the avi file will be saved.

% by Weiguang (Gavin) Ding, May 2012

%%
% resize data
if scale ~= 1
    data = imresize(data, scale);
end
% convert data matrix to movie variable
mov = imgray2movie(data, map);

% write movie, output
chkmkdir(fileparts(fileName));
if numel(fileName) > 0
    movie2avi(mov, fileName, 'fps', frameRate, 'colormap',map);
end

if nargout >0
    varargout{1} = mov;
end
