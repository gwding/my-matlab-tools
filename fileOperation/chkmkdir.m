function chkmkdir(tarDir)
% checks the existence of the input dir, if dir doesn't exist, make this dir.

% Weiguang (Gavin) Ding, May 2012

if exist(tarDir, 'dir') ~= 7
    mkdir(tarDir);
end
end
    