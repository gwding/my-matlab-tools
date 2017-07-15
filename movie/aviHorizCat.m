function aviHorizCat(inputList, outputFile)
% concatenates input videos horizontally. The property of the generated 
% video will be same as the first input video
%   SYNTAX:
%   aviHorizCat(inputList, outputFile)
% 
%   INPUT:
%   "inputList" is a cell array contains the filenames of videos you want to
%   concatenate
%   "outputFile": the filename of the output video
%
% See also: aviCat, aviCrop

% by Weiguang (Gavin) Ding, January 2013

%%

objCell = cell(size(inputList));

movMat = [];
for indVideo = 1 : numel(inputList)
    objCell{indVideo} = VideoReader(inputList{indVideo});
    currMat = read(objCell{indVideo});
    % here the 4th dimension is the frames, and 3rd dimension is color
    % the following lines of code delete all the frames after the last
    % frame of the shortest video.
    if size(currMat, 4) > size(movMat, 4) && indVideo > 1
        currMat(:, :, :, size(movMat, 4) + 1 : end) = [];
    elseif size(currMat, 4) < size(movMat, 4) && indVideo > 1
        movMat(:, :, :, size(currMat, 4) + 1 : end) = [];
    end
        
    size(movMat)
    movMat = cat(2, movMat, currMat);
end

writerObj = VideoWriter(outputFile);

mov = immovie(movMat);
writerObj.FrameRate = objCell{1}.FrameRate;

open(writerObj);
writeVideo(writerObj,mov);
close(writerObj);

