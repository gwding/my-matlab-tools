function [ pOut ] = affRegLS(I0, I1, roi, pIn)
% registers images using least square method under affine transformation 
% model.
%   
%   SYNTAX:
%   pOut = affRegLS(I0, I1, roi, pIn)
%   
%   INPUT:
%   I0 is the input template image.
%   I1 is the input target image which should be deformed to match I0
%   roi is the region of interest on I0
%   pIn is the initial parameter of affine transformation
%
%   OUTPUT:
%   pOut is the output parameters. p(1) and p(2) are translation along row
%   and column respectively. p(3~6) are the parameters of matrix
%   respectively:
%   [1 + a00,     a01;
%        a10, 1 + a11]
%
%   reference of the algorithm:
%   Image Alignment and Stitching : A Tutorial, Richard Szeliski,
%   page 28~29

% by Weiguang (Gavin) Ding, August 2012

%% 

% cacluate INew based on previous parameter pIn
INew = imAffineTransform(I1, pIn);
% take gradient of INew
[gradImCol, gradImRow] = gradient(INew);

% initialize A and b
A = zeros(6, 6);
b = zeros(6, 1);

for nRow = 1:size(I0, 1)
    for nCol = 1:size(I0, 2)
        if roi(nRow, nCol) == true
            %calculate Jacobian Jx'
            Jx = [1, 0,    0, nCol,    0, nRow;
                0, 1, nCol,    0, nRow,    0];
            
            % calculate Jacobian J1(xi')
            J1 = [gradImRow(nRow, nCol), gradImCol(nRow, nCol)] * Jx;
            
            % A and b
            A = A + J1' * J1;
            b = b + J1' * (INew(nRow, nCol) - I0(nRow, nCol));
        end
    end
end

% update parameters
pOut = pIn + A \ b;
end

