function B = padmatnan(A, padsize)
% pads the matrix with NaNs.
%   SYNTAX:
%   B = padmatnan(A, padsize) pads array A with NaN's (not number). 
%   
%   padsize is a vector of nonnegative integers that specifies both the 
%   amount of padding to add and the dimension along which to add it. The 
%   value of an element in the vector specifies the amount of padding to 
%   add. The order of the element in the vector specifies the dimension 
%   along which to add the padding.
%
% See also: padarray

% by Weiguang (Gavin) Ding, May 2012

C = ones(size(A));
B0 = padarray(C, padsize);
B0(B0 == 0) = NaN;
B1 = padarray(A, padsize);
B = B0 .* B1;

end