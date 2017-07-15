function imVolWrite(data, imDir, fileList)
% writes image stack variable into grayscale tiff images.
%   SYNTAX:
%   imVolWrite(data, imDir, fileList)
%   
%   INPUT:
%   "data" is the returned 3d matrix contains the image stack. Elements of 
%   data are assumed to have real value within [0, 1]. 
%   "fileList" is the name of images read into the data.
%   "imDir" is the folder name contains the images to be read in.

% by Weiguang (Gavin) Ding, June 2012

chkmkdir(imDir)

for t = 1 : size(data, 3)
    imwrite(uint8(data(:, :, t) * 255), gray(256), [imDir filesep fileList{t}], 'tif');
end