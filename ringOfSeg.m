function [ringMask, ringHoriz] = ringOfSeg( imSeg, thick, gapThick )
% gives the sorrounding ring of a segment.
%   SYNTAX
%   [ringMask, ringHoriz] = ringOfSeg( imSeg, thick, gapThick )
%   [ringMask, ringHoriz] = ringOfSeg( imSeg, thick )
%   [ringMask] = ringOfSeg( imSeg, thick, gapThick )
%   [ringMask] = ringOfSeg( imSeg, thick )
%
%   INPUT:
%   imSeg, the segment whose ring you want to get
%   thick, thickness of the ring
%   gapThick, if gapThick is one of the inputs, it means that the ring is not
%   tight on the segment. and gapThick represents the distance from the
%   segment to the ring
%
%   OUTPUT:
%   ringMask, the surrounding ring
%   ringHoriz, the part of ring that is only on left or right (designed for
%   cyst project)

% by Weiguang (Gavin) Ding, Sep 2012

if ~isvar('gapThick')
    gapThick = 0;
end


if gapThick ~= 0
    SE0 = strel('disk', gapThick);
    SE1 = strel('disk', thick + gapThick);
    ringMask = logical(imdilate(imSeg, SE1) - imdilate(imSeg, SE0));
    
    if nargout == 2
        SEH0 = strel('rectangle', [1, 2 * gapThick + 1]);
        SEH1 = strel('rectangle', [1, 2 * (thick + gapThick) + 1]);
        ringHoriz = logical(imdilate(imSeg, SEH1) - imdilate(imSeg, SEH0));
    end
    
else
    SE = strel('diamond', thick);
    
    ringMask = logical(imdilate(imSeg, SE) - imSeg);
    
    if nargout == 2
        SEH = strel('rectangle', [1, 2 * thick + 1]);
        ringHoriz = logical(imdilate(imSeg, SEH) - imSeg);
    end
end
end
