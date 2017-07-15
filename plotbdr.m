function plotbdr(BW, lineSpec, lineWidth)
% plots boundaries of each segments in binary image BW.
%   SYNTAX:
%   plotbdr(BW)
%   plotbdr(BW, lineSpec)
%   plotbdr(BW, lineSpec, lineWidth)
%   plots boundaries with certain lineSpec and lineWidth.
%   
%   INPUT:
%   "BW" is a binary image containing 1 or several segment(s). The
%   boundaries of these segments will be plotted.
%   "lineSpec" has the format format of LineSpec in plot(X,Y,LineSpec). It
%   has a default value 'k-'.
%   "lineWidth" determines the width of the boundaries. It has a default
%   value 1.
%
% See also: plot

% by Weiguang (Gavin) Ding, June 2012

if ~exist('lineWidth', 'var')
    lineWidth = 1;
end

B = bwboundaries(BW);

if exist('lineSpec', 'var') ~= 1
    lineSpec = 'k-';
end

for i = 1 : numel(B)
    plot(B{i}(:, 2), B{i}(:, 1), lineSpec, 'linewidth', lineWidth);
end