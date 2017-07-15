function aviCat(inputCell, outputFile)
% concatenates input videos according to the input format. The property of 
% the generated video will be same as the first input video
%   SYNTAX:
%   aviHorizCat(inputCell, outputFile)
% 
%   INPUT:
%   "inputCell" is a cell array contains the filenames of videos you want to
%   concatenate. The input videos are ordered/placed in the output video in the same
%   way as their names ordered/placed in inputCell. Right now, this function only
%   supports that all the input videos should have the same dimensions and
%   number of frames. inputCell can be at most 2d array.
%
%   "outputFile": the filename of the output video
% 
% See also: aviHorizCat, aviCrop

% by Weiguang (Gavin) Ding, January 2013

objCell = cell(size(inputCell));

movMat = [];

for rowSub = 1 : size(inputCell, 1)
    currRowMat = [];
    for colSub =  1 : size(inputCell, 2)
        objCell{rowSub, colSub} = VideoReader(inputCell{rowSub, colSub});
        currColMat = read(objCell{rowSub, colSub});
        currRowMat = helperCatMovMat(currRowMat, currColMat, colSub, 2);
    end
    
    movMat = helperCatMovMat(movMat, currRowMat, rowSub, 1);
end

writerObj = VideoWriter(outputFile);

mov = immovie(movMat);
writerObj.FrameRate = objCell{1}.FrameRate;

open(writerObj);
writeVideo(writerObj,mov);
close(writerObj);

end

function mat12 = helperCatMovMat(mat1, mat2, ind, dim)
% helperCatMovMat is a helper function for concatenate the 2 movie matrix
% and keep the frame number to the number of the shortest video.

% here the 4th dimension is the frames, and 3rd dimension is color
% the following lines of code delete all the frames after the last
% frame of the shortest video.
if size(mat2, 4) > size(mat1, 4) && ind > 1
    mat2(:, :, :, size(mat1, 4) + 1 : end) = [];
elseif size(mat2, 4) < size(mat1, 4) && ind > 1
    mat1(:, :, :, size(mat2, 4) + 1 : end) = [];
end
mat12 = cat(dim, mat1, mat2);

end