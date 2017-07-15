function aviCrop(fileInput, fileOutput, paramCrop, varargin)
% crops and saves avi file.
%   SYNTAX:
%   aviCrop(fileInput, fileOutput, paramCrop)
%
%   INPUT:
%   "fileInput"
%   "fileOutput"
%   "paramCrop" should be in the format of [rowBgn, rowEnd, colBgn, colEnd]

% by Weiguang (Gavin) Ding, November 2013
%%

% overwrite default parameters
for k = 1 : 2 : length(varargin)
    eval([varargin{k}, ' = varargin{', int2str(k + 1), '};']);
end



objRead = VideoReader(fileInput);
matAvi = read(objRead);
matAvi = matAvi(paramCrop(1) : paramCrop(2), paramCrop(3) : paramCrop(4), :, :);

objWrite = VideoWriter(fileOutput, 'Uncompressed AVI');

if isvar('FrameRate')
    objWrite.FrameRate = FrameRate;
else
    objWrite.FrameRate = objRead.FrameRate;
end


open(objWrite);
writeVideo(objWrite, immovie(matAvi));
close(objWrite);
    