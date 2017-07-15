function Y = logReal(X)
% deals with log of real (both positive and negative) numbers. 
%   when input is in [-1, 1] it remains. when less than -1, 
%   it's -log(-x) - 1, when larger than 1, it's
%   log(x) + 1
%
%   NOTE:
%   This is a math function defined by Weiguang (Gavin) Ding. You can use
%   any code with similar functions to replace it.

% by Weiguang (Gavin) Ding

lessThanMinusOne = (X < -1);
moreThanOne = (X > 1);

Y = X;
Y(lessThanMinusOne) = - log(- X(lessThanMinusOne)) - 1;
Y(moreThanOne) = log(X(moreThanOne)) + 1;
