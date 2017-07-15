function flag = isRoiOnBound(BW)
% determines whether the given roi is on the boundary of image.
%   SYNTAX:
%   flag = isRoiOnBound(BW)
%
%   INPUT:
%   BW is a binary image with roi have value of 1 and other area have value
%   of 0
% 
%   OUTPUT:
%   flag whether the roi is on boundary

% by Weiguang (Gavin) Ding, January 2013

[rows, cols] = find(BW);
flag = any(rows == 1) || any(cols == 1) || any(rows == size(BW, 1)) || any(cols == size(BW, 2));