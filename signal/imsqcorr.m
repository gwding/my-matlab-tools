function sigCorr = imsqcorr( imDir, ext, frame)
% calculates the correlations between template and all images in the given 
% folder.
%   SYNTAX:
%   sigCorr = imsqcorr( imDir, ext, frame)
% 
%   INPUT:
%   "imDir" is directory of images to be processed.
%   "ext" is the extension of images, for example '.tif'
%   "frame" represents the image to be used as template, frame can be string
%   (char array) or number. If frame is string, it's the name of the template
%   frame. If frame is number n, its the nth images in the sorted file name
%   array.
%
%   OUTPUT:
%   "sigCorr" is the calculated correlation signal.

% by Weiguang (Gavin) Ding, Apr 2012

fileArray = dir([imDir, filesep, '*', ext]);
fileNameArray = sort_nat({fileArray.name});

if isa(frame, 'char')
    imTemp = imread(fullfile(imDir, frame));
else
    imTemp = imread(fullfile(imDir, fileNameArray{frame}));
end

sigCorr = zeros(size(fileNameArray));

for i = 1 : numel(fileNameArray)
    imCurr = imread(fullfile(imDir, fileNameArray{i}));
    sigCorr(i) = corr(double(imTemp(:)), double(imCurr(:)));
end

