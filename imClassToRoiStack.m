function roiStack = imClassToRoiStack(imClass)
% turns image class into roi stack.
%   Here, image class stands for an image with different regions labeled
%   with dfferent integers. 
%   
%   SYNTAX:
%   roiStack = imClassToRoiStack(imClass)
%
%   INPUT:
%   imClass has the format of output of bwlabel 
%   
%
%   OUTPUT:
%   roiStack is a 3d matrix with roiStack(:, :, i) is the imClass == i

% by Weiguang (Gavin) Ding, September 2013

numClass = max(imClass(:));
B = repmat(reshape(1 : numClass, [1, 1, numClass]), size(imClass));
roiStack = bsxfun(@eq, imClass, B);
end