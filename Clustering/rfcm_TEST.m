
I = [0.3 * ones(200, 100), 0.7 * ones(200, 100)];
J = I;
J = imnoise(J, 'gaussian', 0, 0.01);
J = imnoise(J, 'salt & pepper', 0.05);

figure; 
subplot(2, 2, 1);
imshow(I); %colormap gray;
subplot(2, 2, 2);
imshow(J); %colormap gray;

% imMask = false(size(J));
% imMask(81 : 150, 31 : 170) = true;
imMask = true(size(J));

neighborsJ = roiNeighborsIndex(imMask, [3 3]);
% neighborsPre = generateNeighbors(size(J), [3 3]);
% save('neighborsJ.mat', 'neighborsJ');
% load neighborsJ.mat;
% load matlab.mat;
%% test neighborsJ
% indx = 9833;
% [r, c] = ind2sub(size(J), indx)
% [r, c] = ind2sub(size(J), neighborsJ(indx, :));


%%
Jvec = roiDataSub2Ind(J, imMask);
beta = 0.1;

disp('RFCM interation');
[center, U, objFcnRfcm] = rfcm(Jvec, neighborsJ, 2, beta);

U1 = U(1, :)';
imU1 = roiDataInd2Sub(U1, imMask);
% imU1 = reshape(U1, size(J));


subplot(2, 2, 4);
imshow(imU1 > 0.5);

disp('FCM interation');
[center, U, objFcnFcm] = fcm(Jvec, 2);
U1 = U(1, :)';
imU1 = roiDataInd2Sub(U1, imMask);
subplot(2, 2, 3);
imshow(imU1 > 0.5);

%%
vecIterRfcm = 1 : length(objFcnRfcm);
vecIterFcm = 1 : length(objFcnFcm);
figure;
plot(vecIterRfcm, [objFcnRfcm.fcm], vecIterRfcm, [objFcnRfcm.spatial], vecIterRfcm, [objFcnRfcm.total], vecIterFcm, objFcnFcm);

legend('fcm part', 'spatial part', 'total', 'fcm');
