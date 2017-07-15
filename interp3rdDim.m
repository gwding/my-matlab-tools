function VI = interp3rdDim(x, V, xi, varargin)
% uses built-in interp1 to do interpolation of the 3rd dimension of volume 
% data.
%
%   For help other than input V and output VI, please refer to interp1.
%   
%   V and VI are both R x C x K matrices, where V(r, c, :) and VI(r, c, :)
%   are 1d signals that can be viewed as input and output of function 
%   interp1.
%
% See also: interp1

% by Weiguang (Gavin) Ding, October 2013

VI = zeros(size(V, 1), size(V, 2), length(xi));

for rowSub = 1 : size(V, 1)
    for colSub = 1 : size(V, 2)
        VI(rowSub, colSub, :) = interp1(x, squeeze(V(rowSub, colSub, :)), xi, varargin{:});
    end
end
end