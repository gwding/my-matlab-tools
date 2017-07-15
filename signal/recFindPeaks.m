function peaks = recFindPeaks(x0, x1, data, thresh)
% finds the peaks in curve recursively for piecewise linear fitting.
%   SYNTAX:
%   peaks = recFindPeaks(x0, x1, data, thresh)
%   
%   INPUT:
%   x0, starting point in data.
%   x1, ending point in data.
%   data, 1d signal
%   thresh, threshold used for breaking segments.
%
%   OUTPUT:
%   peaks, a vector containing the location of picks.
%
%   METHOD:
%   recFindPeaks operates in a recursive way. Given the starting and ending
%   points of a signal, x0 and x1, it first find the line l connecting
%   them. Then, it finds the point y on the signal such that y has the
%   largest distance to the line l. Then y is assigned as a peak. The how
%   signal is divided in to 2 segments. The same procedure will be done for
%   both of these segments.
%   The stopping condition is that when the largest distance from y to the
%   line l is below a predefined threshold.

% by Weiguang (Gavin) Ding, November 2013


%% find the furthest peak at current level
y0 = data(x0);
y1 = data(x1);
A = y1 - y0;
B = x0 - x1;
C = (x1 - x0) * y0 - (y1 - y0) * x0;

% distToLine = abs(A * [x0 : x1]' + B * data(x0 : x1) +C) / sqrt(A ^ 2 + B ^ 2);
distToLine = abs(data(x0 : x1) + A / B * [x0 : x1]' + C / B);

[distMax, xNew] = max(distToLine);
xNew = xNew + x0 - 1; % to compensate for the offset

if distMax < thresh
    peaks = [];
else
    peaks = [recFindPeaks(x0, xNew, data, thresh), xNew, recFindPeaks(xNew, x1, data, thresh)];
end



