function n = getNeighborsGivenSubsOffsetsSizes(rowSub, colSub, rowOff, colOff, imSize, winSize)
[localCol, localRow] = meshgrid(colSub - colOff : colSub + colOff, rowSub - rowOff : rowSub + rowOff);
localCol(localCol < 1) = 1;
localCol(localCol > imSize(2)) = imSize(2);
localRow(localRow < 1) = 1;
localRow(localRow > imSize(1)) = imSize(1);
n = reshape(sub2ind(imSize, localRow, localCol), 1, prod(winSize));
n(n == n((prod(winSize) + 1) / 2)) = []; % remove all the index equal to itself
n = unique(n);
end


