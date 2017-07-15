% Test script for addTextToIm

% gray image
img = zeros(120, 320);
img = addTextToIm(img, '18 degree');
figure; imagesc(img);

% color image / image sequence with scale and location
img = zeros(120, 320, 3);
img = addTextToIm(img, '18 degree', 'scale', 1.1, 'location', [10, 10]);
figure; imagesc(img);