function [RGB,g,b] = ind2rgb3d(X,map)
% converts indexed image stack to RGB image stack.
%   RGB = IND2RGB(X,MAP) converts the 3d matrix X and corresponding
%   colormap MAP to RGB (truecolor) format.
%   
%   Class Support
%   -------------
%   X can be of class uint8, uint16, or double. RGB is an 
%   M-by-N-by-3-by-K array of class double.
%   Each M-by-N-by-3 array is one slice of image.
%   
% See also: ind2rgb, rgb2ind
%   This function is modified from matlab inbuilt function ind2rgb.

%   ===================================================   
%   Clay M. Thompson 9-29-92
%   Copyright 1984-2010 The MathWorks, Inc. 
%   $Revision: 1.10.4.2 $  $Date: 2010/05/20 02:27:31 $
%   ===================================================
% Modified by Weiguang (Gavin) Ding, October 2012

if ~isfloat(X)
    X = double(X)+1;    % Switch to one based indexing
end

error(nargchk(2,2,nargin));

% Make sure A is in the range from 1 to size(cm,1)
X = max(1,min(X,size(map,1)));

% Extract r,g,b components
r = zeros(size(X)); r(:) = map(X,1);
g = zeros(size(X)); g(:) = map(X,2);
b = zeros(size(X)); b(:) = map(X,3);

if nargout==3,
  RGB = r;
else
  RGB = zeros([size(r, 1), size(r, 2), 3, size(r, 3)]);
  RGB(:,:,1,:) = r;
  RGB(:,:,2,:) = g;
  RGB(:,:,3,:) = b;
end
  
