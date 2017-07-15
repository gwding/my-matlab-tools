function [X, map] = gray2indWithRange(I, n, range)
% converts grayscale image to indexed image.
%   only the intensity values inside the "range" specified will be converted linearly.
%   Otherwise the value would be either the smallest or largest.
%   please refer to the inbuilt matlab function gray2ind 
%   
%   INPUT:
%   "I", gray image
%   "n", number of indices
%   "range", the effective range of conversion. range is [A, B]. 
%   If there is value in I less than A, all values in I that is less than or 
%   equal to A will be min(X(:)). If there is value in I larger than B all 
%   values in I that is larger than or equal to B will be max(X(:)).
%   Otherwise it max(I(:)) goes to max(X(:)) and/or min(I(:)) goes to 
%   min(X(:))
%
%   OUTPUT:
%   "X", converted indxed image
%   "map", is the gray colormap that will display X as in [0, 1]
%
%   See also: gray2ind, gray2rgb, ind2rgb

% by Weiguang (Gavin) Ding, November 2012

%%
I(I < range(1)) = range(1);
I(I > range(2)) = range(2);
I = mat2gray(I);
[X, map] = gray2ind(I, n);

end