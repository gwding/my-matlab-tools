function varargout = matfile2vars(fileName, varargin)
% reads data in .mat file into the variable you want.
%
%   SYNTAX:
%   [a, b, c, ...] = matfile2vars(fileName)
%   fileName is the name (char array) of the target .mat file.
%   a, b, c are the variables to be assigned a value from the .mat file 
%   according to their order in the square brackets [...]. The
%   corresponding variables in the .mat file would be determined in 
%   alphabetical order.
%   The number of output variables should be less than or equal to the 
%   number of variables stored in the .mat files.
%
%   [a, b, c, ...] = matfile2vars(fileName, A, B, C, ...)
%   You can assign a, b, c, ... to specific variables in the .mat file. A,
%   B, C, ... represent the variables in the .mat file. A, B, C, ... can be 
%   numbers, which represent the index of wanted variable, or char array,
%   which represent the name of the wanted variables.
%   
%   Example:
%   if matlab.mat file has 5 variables stored: v1, v2, v3, v4, v5
%   Then 
%   a = matfile2vars('matlab.mat') will read v1 into a.
%   [a, b] = matfile2vars('matlab.mat') will read v1 into a, v2 into b.
%   [a, b] = matfile2vars('matlab.mat', 'v1', 'v5') will read v1 into a, v5
%   into b

% by Weiguang (Gavin) Ding, May 2012



dataStruct = load(fileName);

dataName = fieldnames(dataStruct);

nIn = nargin - 1;
nOut = nargout;

if nOut > numel(dataName)
    error('Output variables are more than variables in the .mat file');
end


% parse varargin into index for loading files
if nIn == 0
    indVec = 1 : nOut;
elseif nIn == nOut
    indVec = zeros(1, nIn);
    for i = 1 : nIn
        if isa(varargin{i}, 'char')
            indVec(i) = find(strcmp(varargin{i},dataName));
        elseif isa(varargin{i}, 'numeric')
            indVec(i) = varargin{i};
        else
            error('The input variable names should be either a number representing the index or a string representing name of variable in the .mat file.');
        end
    end
else
    error('The number of output variables is not equal to number of specified variables');
end



for i = 1 : nOut
    varargout{i} = getfield(dataStruct, dataName{indVec(i)});
end
end


