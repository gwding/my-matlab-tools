function mov = imgray2movie(data, map)
% makes movie variable from multiframe gray image
%
% This function has the same usage as matlab inbuilt function immovie,
% except for that 'data' which imgray2movie accepts is m by n by k, k is
% the number of images.

% by Weiguang (Gavin) Ding, June 2012

D = zeros(size(data, 1), size(data, 2), 1, size(data, 3));
D(:, :, 1, :) = data;

% Don't remember why want to confirm that D is double

% propD = whos('D');
% 
% %% if is double do scaling
% if strcmp(propD.class, 'double')
%     if max(D(:)) <= 1
%     D = uint8(mat2gray(D) * 255);
%     else 
%         error('Data type is double, but maximum is larger than one. Please check for potential scaling problem');
%     end
% end


D = uint8(mat2gray(D) * 255);
mov = immovie(D, map);



