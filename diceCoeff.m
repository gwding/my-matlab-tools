function y = diceCoeff(a, b)
% calculates dice coefficient of input logical images.
%
%   SYNTAX:
%   y = diceCoeff(a, b) outputs dice coefficient y by calculating the
%   'overlapping ratio between area defined by a and b.
%
%   INPUT:
%   "a" and "b" are logical arrays with same size. Areas with value 1/true
%   are filled. Those with 0/false are empty.
%
%   OUTPUT:
%   "y" is the dice coefficient.

% by Weiguang (Gavin) Ding, September 2013


y = 2 * nnz(a & b) / (nnz(a) + nnz(b));

