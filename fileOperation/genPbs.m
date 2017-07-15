function genPbs(pbsFileName, workingDir, params, pathList, cmdList)
% generates pbs file according given parameters.
%   SYNTAX:
%   genPbs(pbsFileName, workingDir, params, pathList, cmdList)
%
%   INPUT:
%   "pbsFileName" is the name of wanted .pbs file.
%   "workingDir" is the directory that running script is located in.
%   "params" specifies the time and memory requirement needed.
%       .time specifies number of hours.
%       .nMem specifies number of gb memory needed.
%   "pathList" is a cell array specifies which paths need to be added
%   before running the matlab code.
%   "cmdList" is a cell array that contains matlab commands that you want to run.

% by Weiguang (Gavin) Ding, November 2013

fileID = fopen(pbsFileName,'w');

fprintf(fileID,'#!/bin/bash\n');
fprintf(fileID,'#PBS -l nodes=1\n');
fprintf(fileID,'#PBS -m a\n');
fprintf(fileID,'#PBS -l walltime=%d:00:00,mem=%dgb\n', params.time, params.nMem);
fprintf(fileID,'echo "working on `hostname`"\n');
fprintf(fileID,'cd %s\n', workingDir);
fprintf(fileID,'matlab -nodisplay -nodesktop -r ');
fprintf(fileID,'"');

%% add pathList
for indPath = 1 : numel(pathList)
    fprintf(fileID, 'addpath(genpath(''%s''));', pathList{indPath});
end

%% add cmdList
for indCmd = 1 : numel(cmdList)
    fprintf(fileID, '%s', cmdList{indCmd});
end

fprintf(fileID, 'exit;"');