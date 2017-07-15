function [k, b] = linekb(x1, y1, x2, y2)
% takes 2 points and calculate the k and b in y = k * x + b.
%   SYNTAX:
%   [k, b] = linekb(x1, y1, x2, y2)

% by Weiguang (Gavin) Ding, January 2013

k = (y2 - y1) ./ (x2 - x1);
b = -k .* x1 + y1;
