function I = mat2grayLastDim(A, roi)
% scales vectors in a 2d/3d matrix along last dimension.
%   SYNTAX:
%   I = mat2grayLastDim(A)
%   Apply matlab in-built function mat2gray to every column of a 2d matrix or
%   every (x, y, :) of a 3d matrix
%
%   I = mat2grayLastDim(A, roi)
%   When A is 3d, roi is used to determine the area that should be scaled
%   over the 3rd dimension. size(roi) is the same to the first 2 elements
%   of size(A)
%

% by Weiguang (Gavin) Ding, October 2013


% if ~isvar('range')
%     range = [0, 1];
% end
sizeA = size(A);
dim = length(sizeA);
I = zeros(sizeA);
if dim == 2
    for rowSub = 1 : sizeA(1)
        I(rowSub, :) = mat2gray(A(rowSub, :));
    end
elseif dim == 3
    if nargin == 1
        roi = true(sizeA(1), sizeA(2));
    end
    for rowSub = 1 : sizeA(1)
        for colSub = 1 : sizeA(2)
            if roi(rowSub, colSub)
                I(rowSub, colSub, :) = mat2gray(A(rowSub, colSub, :));
            end
        end
    end
else
    error('This function cannot deal with matrix has more than 4 dimensions.');
end

