function peaks = getpeaks(signal, thresh, range, isPos)
% finds peaks in a signal
%   
%   SYNTAX:
%   peaks = findpeaks(signal, thresh, range)
%   peaks = findpeaks(signal, thresh, range, isPos)
%   This function find peaks which is above certain threshold value and is
%   maximum with in certain range.
%
%   INPUT:
%   thresh is the threshold of minimum peak value
%   range is a interval [a b], x need to be maximum in [x - a, x + b] to be a
%   peak.
%   isPos represent whether you want positive peaks or negative peaks, by
%   default, isPos = 1 representing positive peaks, when isPos = 0, it
%   means looking for negative peaks. If no input, isPos = 1
%
%   OUTPUT:
%   peaks is the vector contains peak locations.

% by Weiguang (Gavin) Ding, Apr 2012

if nargin < 4
    isPos = 1;
end
peaks = [];

if isPos
    for i = range(1) + 1 : numel(signal) - range(2)
        if signal(i) > thresh
            if signal(i) == max(signal(i - range(1) : i + range(2)))
                peaks = [peaks, i];
            end
        end
    end    
else
    for i = range(1) + 1 : numel(signal) - range(2)
        if signal(i) < thresh
            if signal(i) == min(signal(i - range(1) : i + range(2)))
                peaks = [peaks, i];
            end
        end
    end
end

end

