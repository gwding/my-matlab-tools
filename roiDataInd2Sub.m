function dataCuboid = roiDataInd2Sub(indDataMat, roi)
% transfers the data stored in matrix intodataCuboid a with each pixel as 
% one row of the orginal data.
%   SYNTAX:
%   dataCuboid = roiDataInd2Sub(indDataMat, roi)
%
%   INPUT:
%   indDataMat, 'stretched' data, (m x n) x k
%   roi, region of interest m x n
%
%   OUTPUT:
%   dataCuboid, stores data the related to each pixel of an image. has the
%   dimension of m x n x k

% by Weiguang (Gavin) Ding, October 2012

if nnz(roi) ~= size(indDataMat, 1)
    error('Number of valid pixels in ROI is not equal to provided data');
end

dataCuboid = zeros(size(roi, 1), size(roi, 2), size(indDataMat, 2));

index = 1;
for colSub = 1 : size(dataCuboid, 2)
    for rowSub = 1 : size(dataCuboid, 1)
        if roi(rowSub, colSub)
            dataCuboid(rowSub, colSub, :) = indDataMat(index, :);
            index = index + 1;
        end
    end
end

end
