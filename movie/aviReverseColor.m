function aviReverseColor(inputFile, outputFile)
% reverses the color scheme of the avi video.
%   
%   !!NOTE!!
%   When doing the documentation, the actuall usage of this function was
%   not found. If you find the comments here is different from how it is
%   used. Please do corrections or/and contact Weiguang (Gavin) Ding at
%   gavin.w.ding@gmail.com
%   ALSO, this function might not be properly written. USE WITH CAUTION!
%
%   SYNTAX:
%   aviReverseColor(inputFile, outputFile) reverses the color scheme of the
%   avi video (inputFile) and output it as the outputFile. If any voxel is
%   gray which means it has 3 equal dimensions, it won't change anything.

% by Weiguang (Gavin) Ding, November 2013

inputObj = VideoReader(inputFile);

movMat = read(inputObj);
maxVal = max(movMat(:));
for indFrm = 1 : size(movMat, 4)
    for rowSub = 1 : size(movMat, 1)
        for colSub = 1 : size(movMat, 2)
            if movMat(rowSub, colSub, 1, indFrm) == movMat(rowSub, colSub, 2, indFrm)...
                    && movMat(rowSub, colSub, 3, indFrm) == movMat(rowSub, colSub, 2, indFrm)
            else
                movMat(rowSub, colSub, :, indFrm) = maxVal - movMat(rowSub, colSub, :, indFrm);
            end
        end
    end
end

outputObj = VideoWriter(outputFile);

mov = immovie(movMat);
outputObj.FrameRate = inputObj.FrameRate;

open(outputObj);
writeVideo(outputObj,mov);
close(outputObj);

end