function [k, b] = linekbOrthBsct(x1, y1, x2, y2)
% calculates perpendicular bisector given coordinates of 2 ends of a line 
% segment. 
%   SYNTAX:
%   [k, b] = linekbOrthBsct(x1, y1, x2, y2)

% by Weiguang (Gavin) Ding, January 2013

k = - (x2 - x1) ./ (y2 - y1);
b = (y1 + y2) ./ 2 - k * (x1 + x2) ./ 2;

end