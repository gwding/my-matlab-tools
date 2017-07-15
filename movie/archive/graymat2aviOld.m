function varargout = graymat2avi(data, scale, frameRate, fileName, map)
% graymat2avi converts grayscale data matrix to avi video and matlab mov
% file

% graymat2avi(data, scale, frameRate, fileName, map)
% mv = graymat2avi(data, scale, frameRate, fileName, map)
% scale is used by image resize, like [320 400] or 0.9
% frameRate is the avi video frame rate
% fileName is the full name of avi file, if don't want to save as .avi
% file, just input it as [] or ''.
% map is the colormap want to use
% mv is the output matlab movie variable. if not used, then there's no
% output movie variable, only the avi file will be saved.

% by Weiguang (Gavin) Ding, May 2012

%% 

im1 = imresize(data(:, :, 1), scale);

D = zeros(size(im1, 1), size(im1, 2), 1, size(data, 3));


%% extract images from images files and make them matlab movie file

for frameInd = 1 : size(D, 4)
    D(:, :, 1, frameInd) = imresize(data(:, :, frameInd), scale);
end

D = mat2gray(D) * 255;
D = uint8(D);
mv = immovie(D,map);
%% write movie, output

if numel(fileName) > 0
    movie2avi(mv, fileName, 'fps', frameRate, 'colormap',map);
end

if nargout >0
    varargout{1} = mv;
end

end