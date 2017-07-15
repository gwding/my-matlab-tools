function addTextToAvi(srcName, tarName, strTxt, varargin)
% adds text to given avi video.
%   SYNTAX:
%   addTextToAvi(srcName, tarName, strTxt) outputs avi file with name
%   "tarName", by converting strTxt to image and adding it to the top left
%   corner of avi file srcName.
%   
%   addTextToAvi(srcName, tarName, strTxt, 'PropertyName', propertyValue, ...)
%   
%   INPUT:
%   "srcName" is the source avi file name.
%   "tarname"is the target avi file name.
%   "strTxt" is a string with text to be added.
%   
%   PropertyName: Scale, Location
%   "Scale" determines the scale of string image. It will be used in
%   imresize(img, scale),
%   "Location" determines the position of top left corner of the string
%   image.
%
%   NOTE:
%   This function does not consider the size change of the video. The user
%   should be aware of size change of the output video.
%   
%   BASED ON:
%   addTextToIm
%
% See also: text2im, addTextToIm

% by Weiguang (Gavin) Ding, September 2013
% TO EXTEND:
%       warning when adding text will change the size of video.

%% Parameter setting
Scale = 1;
Location = [1, 1];

% overwrite default parameters
for k = 1 : 2 : length(varargin)
    eval([varargin{k}, ' = varargin{', int2str(k + 1), '};']);
    eval([capitalize(varargin{k}), ' = varargin{', int2str(k + 1), '};']);
end

%% Read video
objAvi = VideoReader(srcName);
matAvi = read(objAvi);

%% Add text to video
matAvi = addTextToIm(matAvi, strTxt, 'Scale', Scale, 'Location', Location);

%% Write video
writerObj = VideoWriter(tarName);
mov = immovie(matAvi);
writerObj.FrameRate = objAvi.FrameRate;
open(writerObj);
writeVideo(writerObj,mov);
close(writerObj);