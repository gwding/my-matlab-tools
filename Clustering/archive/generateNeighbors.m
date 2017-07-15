function neighbors = generateNeighbors( imSize, winSize )
%GENERATENEIGHBORS Summary of this function goes here
%   Detailed explanation goes here

colOff = round((winSize(2) - 1) / 2);
rowOff = round((winSize(1) - 1) / 2);
% numNeighbors = prod(winSize) - 1;
neighbors = cell(prod(imSize), 1);
for rowSub = 1 : imSize(1)
    rowSub
    for colSub = 1 : imSize(2)
        
        neighbors{sub2ind(imSize, rowSub, colSub)} = ...
            getNeighborsGivenSubsOffsetsSizes(rowSub, colSub, rowOff, colOff, imSize, winSize);
    end
end

end


