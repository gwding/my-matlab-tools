function varargout = dirMexCompile( inputDir, ext)
% compiles c/c++ files with certain postfix in a certain folder and its
% subfolder using mex function recursively.
%
%   SYNTAX:  
%   dirMexCompile(inputDir, ext)
%   num = dirMexCompile(inputDir, ext)
%   
%   INPUT:
%   "inputDir" is the directory which you want to compile all the files.
%   "ext" is a cell with all the postfixes you want to compile. It usually
%   contains '.c' '.cpp'.
%
%   OUTPUT:
%   "num" records the number of files that are compiled.

% by Weiguang (Gavin) Ding, November 2013


numCompiled = 0;
fileArray = dir(inputDir);

% recursive traverse all the subfolders.
for i = 1 : size(fileArray, 1)
    if fileArray(i).isdir && ~strcmp(fileArray(i).name,'..') && ~strcmp(fileArray(i).name,'.')
        n = dirMexCompile([inputDir filesep fileArray(i).name], ext);
        numCompiled = numCompiled + n;
    end
end

% compile files with different extensions
for iExt = 1 : numel(ext)
    fileArray = dir([inputDir filesep '*.' ext{iExt}]);
    for iFile = 1 : numel(fileArray)
        eval(sprintf('mex %s -outdir %s', [inputDir filesep fileArray(iFile).name], inputDir));
        disp(sprintf('%s has been compiled', [inputDir filesep fileArray(iFile).name]));
        numCompiled = numCompiled + 1;
    end
end

if nargout > 0
    varargout{1} = numCompiled;
end

end