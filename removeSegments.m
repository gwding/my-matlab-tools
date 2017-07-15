function imOut = removeSegments( imIn, sizeThresh, varargin )
% removes small segments in binary image.
%   SYNTAX:   
%   imOut = removeSegments( imIn, sizeThresh )
%   imOut = removeSegments( imIn, sizeThresh, 'PropertyName', propertyValue, ...)
%
%   INPUT:
%   "imIn", is the input binary image.
%   "sizeThresh", is the threshold under which the segments will be removed.
%
%   PropertyName: connectivity
%   "connectivity", this parameter is the for function bwlabel. It determines
%   4 or 8 connectivity used to seperate segments.
%
%   OUTPUT:
%   imOut, is the output binary image after small segments are removed.

% by Weiguang (Gavin) Ding, October 2012

connectivity = 8;

% overwrite default parameters
for k = 1 : 2 : length(varargin)
    eval([varargin{k}, ' = varargin{', int2str(k + 1), '};']);
end


[L, num] = bwlabel(imIn, connectivity);

imOut = zeros(size(imIn));

for i = 1 : num
    if sum(sum(L == i)) >= sizeThresh
        imOut = imOut + double(L == i);
    end
end

imOut = logical(imOut);

end

