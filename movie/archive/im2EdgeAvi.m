function varargout = im2EdgeAvi(ext, imDir, scale, frameRate, fileName, map)
% im2avi converts image sequenses to avi video
%
% SYNTAX
%
% Inputs: imDir: image sequence directory
% ext: the extension name of the image such as 'jpg', 'tif',
% scale: image resize, like [320 400] or 0.9
% frameRate: avi video frame rate
% fileName: save avi as, full name
% map: colormap want to use
%
% EXAMPLE: im2avi(ext, imDir, scale, frameRate, fileName)
%
% NOTES: based on im2avi (author Wenbin),  09-May-2007
% NOTES: the above version is based on im2avi (author: Zhe Wu @ Univ of 
% Rochester) 
% 
% This function is a modified version of im2avi downloaded from
% http://nw360.blogspot.com/2007/05/convert-images-to-avi-video.html
% modification of this version:
% 1. input filename is full path of the filename instead of filename without
% folder name as the original version.
% 2. there won't be figures show up for frame getting purposes.
% 3. the file names are sorted according to nature order using function
% sort_nat.
% 4. input playFlag was removed

%% extract the images names with certain ext
% filesep stands for / in linux
fileArray = dir([imDir filesep '*' ext]);
fileNameArray = sort_nat({fileArray.name});


%% extract images from images files and make them matlab movie file
numIms = size(fileArray, 1);
% mv =struct('cdata', {}, 'colormap', {});
I1 = imresize(imread([imDir filesep fileNameArray{1}]), scale);
D = zeros(size(I1, 1), size(I1, 2), 1, numIms);
for frameInd=1:numIms
    disp(sprintf('reading images... frameInd = %d', frameInd));
    imName = [imDir filesep fileNameArray{frameInd}];
    im = imread(imName) ;
    im = imresize(im, scale);
%     mv(frameInd) = struct('cdata', {ind2rgb(im, map)}, 'colormap', {[]});
    D(:, :, 1, frameInd) = im;
end


thresh = 0.3;
for i = 1 : size(D,4)
    disp(sprintf('edge processing, i = %d', i));
    D(:, :, :, i) = edge(D(:, :, :, i),'canny',thresh);
end

D = uint8(D * 255);
mv = immovie(D,map);
%% write movie, output
movie2avi(mv, fileName, 'fps', frameRate, 'compression', 'None', 'colormap',map);

if nargout >0
    varargout{1} =mv;
end


end
