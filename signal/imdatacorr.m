function sigCorr = imdatacorr( data, frames )
% calculates the correlations between template frame(s) and all frames in 
% the data variable
%   SYNTAX:
%   sigCorr = imdatacorr( data, frames )
%   
%   INPUT:
%   "data" is the input variable. data should be 3d matrix, which is stack of
%   images. The 3rd dimension represents the frames.
%   "frames" are the indices of images which will be used as template, the
%   middle element of frames is set to be the position reference. If
%   multiple frames is used, we will correlate several frame pairs at the
%   same time.
%
%   OUTPUT:
%   "sigCorr" is a 1d signal which represent the correlation between each
%   image to the template image.

% by Weiguang (Gavin) Ding, May 2012

%% check format of frames and output relative frames

if mod(numel(frames), 2) ~= 1
    error('numel(frames) should be odd number');
end

relativeFrames = frames - frames(ceil(numel(frames) / 2));


%% make template

imTemp = zeros(size(data, 1), size(data, 2), numel(frames));

for i = 1 : numel(frames)
    imTemp(:, :, i) = data(:, :, frames(i));
end

sigCorr = zeros(1, size(data, 3));

for i = 1 - min(relativeFrames) : size(data, 3) - max(relativeFrames)
    imCurr = zeros(size(data, 1), size(data, 2), numel(frames));
    imFrames = i + relativeFrames;

    for j = 1 : numel(imFrames)
%         imFrames
        imCurr(:, :, j) = data(:, :, imFrames(j));
    end

    sigCorr(i) = corr(double(imTemp(:)), double(imCurr(:)));
end

