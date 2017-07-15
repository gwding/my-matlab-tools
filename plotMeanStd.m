function plotMeanStd(x, y, y_std, lineWidth)
% plots the signal with std
%   SYNTAX:
%   plotMeanStd(x, y, y_std, lineWidth) plots signal and its standard
%   deviation signal with shading effects.
%   
%   INPUT:
%   "x", horizontal coordinates of signal
%   "y", signal itself
%   "y_std", standard deviation signal
%   "lineWidth", width of signal in graph
%
% See also: boundedline, plot

% by Weiguang (Gavin) Ding, October 2013

boundedline(x, y, y_std);
plot(x, y, 'b-', 'linewidth', lineWidth); hold on;
plot(x, y+y_std, 'r--', 'linewidth', lineWidth / 2);
plot(x, y-y_std, 'g--', 'linewidth', lineWidth / 2);
end

