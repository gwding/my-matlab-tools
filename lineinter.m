function [x, y] = lineinter(k1, b1, k2, b2)
% calculates the intersection of 2 lines given by y = k * x + b
%   SYNTAX:
%   [x, y] = lineinter(k1, b1, k2, b2)

% by Weiguang (Gavin) Ding, January 2013

x = - (b2 - b1) ./ (k2 - k1);
y = k1 .* x + b1;