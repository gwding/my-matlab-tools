function indDataMat = roiDataSub2Ind(dataCuboid, roi)
% transfers the data stored in dataCuboid into a matrix with
% each row as one pixel of the orginal data.
%   SYNTAX:
%   indDataMat = roiDataSub2Ind(dataCuboid, roi)
%
%   INPUT:
%   dataCuboid, stores data the related to each pixel of an image. has the
%   dimension of m x n x k
%   roi, region of interest m x n
%
%   OUTPUT:
%   indDataMat, 'stretched' data, (m x n) x k

% by Weiguang (Gavin) Ding, October 2012

indDataMat = zeros(nnz(roi), size(dataCuboid, 3));

index = 1;
for colSub = 1 : size(dataCuboid, 2)
    for rowSub = 1 : size(dataCuboid, 1)
        if roi(rowSub, colSub)
            indDataMat(index, :) = squeeze(dataCuboid(rowSub, colSub, :))';
            index = index + 1;
        end
    end
end

