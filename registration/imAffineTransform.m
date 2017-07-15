function imgOut = imAffineTransform( imgIn, p )
% transforms an image according to given affine transformation.
%
%   SYNTAX:
%   imgOut = imAffineTransform( imgIn, p ), where imgIn and imgOut and
%   input and output image respectively. p is the affine transformation
%   parameter: p(1) and p(2) are translation along row
%   and column respectively. p(3~6) are the parameters of matrix
%   respectively:
%   [1 + a00,     a01;
%        a10, 1 + a11]

% by Weiguang (Gavin) Ding, August 2012


transRow = p(1);
transCol = p(2);

A = [1 + p(3), p(4);...
     p(5), 1 + p(6)];
 
T = [[A, [0; 0]]; transCol transRow 1];
tform = maketform('affine', T);
imgOut = imtransform(imgIn, tform, 'bicubic', 'Xdata', [1, size(imgIn, 2)], 'Ydata', [1, size(imgIn, 1)]);

end

