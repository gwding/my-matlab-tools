function imgOut = imRigidTransform( imgIn, p )
% transforms an image according to given rigid transformation.
%
%   SYNTAX:
%   imgOut = imRigidTransform( imgIn, p ), where imgIn and imgOut and
%   input and output image respectively. p is the rigid transformation
%   parameter: p(1) and p(2) are translation along row
%   and column respectively. p(3) is the rotation angle which has
%   anticlockwise as the plus direction.

% by Weiguang (Gavin) Ding, August 2012

theta = p(3);
R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
transRow = p(1);
transCol = p(2);
T = [[R, [0; 0]]; transCol transRow 1];
tform = maketform('affine', T);
imgOut = imtransform(imgIn, tform, 'bicubic', 'Xdata', [1, size(imgIn, 2)], 'Ydata', [1, size(imgIn, 1)]);

end

