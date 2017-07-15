
width = 500;
height = 500;

rowCenter = 200;
colCenter = 300;
radius = 30;

thick = 5;
gapThick = 10;
I = false(height, width);

[C, R] = meshgrid(1 : width, 1 : height);

I((C - colCenter) .^ 2 + (R - rowCenter) .^ 2 < radius ^ 2) = true;


IR = ringOfSeg(I, thick, gapThick);


figure; imagesc(2 * IR - 2 * I); colormap gray; axis image;