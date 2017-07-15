img = zeros(100, 100);
roi = roipoly(img);
close;
figure; imshow(roi);
isRoiOnBound(roi)