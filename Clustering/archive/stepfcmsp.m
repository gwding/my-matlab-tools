function [U_new, center, obj_fcn] = stepfcmsp(data, neighbors, U, cluster_n, expo)
% ATTENTION:
% =========================================================================
% This is the legacy version of the robust fuzzy c-means
% function.
% Please use rfcm.m if you want to write new code.
% Problem of this code (together with fcmsp.m):
% This code cannot take beta as an input and the membership updateing
% function has some problem too.
% =========================================================================
%
%STEPFCM One step in fuzzy c-mean clustering.
%   [U_NEW, CENTER, ERR] = STEPFCM(DATA, U, CLUSTER_N, EXPO)
%   performs one iteration of fuzzy c-mean clustering, where
%
%   DATA: matrix of data to be clustered. (Each row is a data point.)
%   U: partition matrix. (U(i,j) is the MF value of data j in cluster j.)
%   CLUSTER_N: number of clusters.
%   EXPO: exponent (> 1) for the partition matrix.
%   U_NEW: new partition matrix.
%   CENTER: center of clusters. (Each row is a center.)
%   ERR: objective function for partition U.
%
%   Note that the situation of "singularity" (one of the data points is
%   exactly the same as one of the cluster centers) is not checked.
%   However, it hardly occurs in practice.
%
%       See also DISTFCM, INITFCM, IRISFCM, FCMDEMO, FCM.

%   Roger Jang, 11-22-94.
%   Copyright 1994-2002 The MathWorks, Inc. 
%   $Revision: 1.13 $  $Date: 2002/04/14 22:21:02 $

beta = 1;

mf = U.^expo;       % MF matrix after exponential modification
center = mf*data./((ones(size(data, 2), 1)*sum(mf'))'); % new center
dist = distfcm(center, data);       % fill the distance matrix

% compute the summation of neighbor-other membership, here called snom
snom = zeros(size(U));
% summation of other membership at each pixel, here called som
som = bsxfun(@minus, sum(mf, 1), mf);
data_n = size(data, 1);
for indCluster = 1 : cluster_n
    for indData = 1 : data_n
        snom(indCluster, indData) = sum(som(indCluster, neighbors{indData}));
    end
end


% objective function is modified for spatial constraints
% obj_fcn = sum(sum((dist.^2).*mf));
obj_fcn = sum(sum((dist.^2).*mf)) + beta / 2 * sum(sum(mf .* snom));

tmp = (dist.^2 + beta * snom).^(-2/(expo-1));      % calculate new U, suppose expo != 1

% U_new is modified for spatial constraints
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));
