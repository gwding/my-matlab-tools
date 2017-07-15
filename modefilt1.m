function y = modefilt1(x,n,blksz,DIM)
% is a one dimensional mode filter.
%   Y = MODEFILT1(X,N) returns the output of the order N, one dimensional
%   mode filtering of X.  Y is the same size as X; for the edge points,
%   zeros are assumed to the left and right of X.  If X is a matrix,
%   then MODEFILT1 operates along the columns of X.
%
%   If you do not specify N, MODEFILT1 uses a default of N = 3.
%   For N odd, Y(k) is the mode of X( k-(N-1)/2 : k+(N-1)/2 ).
%   For N even, Y(k) is the mode of X( k-N/2 : k+N/2-1 ).
%
%   Y = MODEFILT1(X,N,BLKSZ) uses a for-loop to compute BLKSZ ("block size") 
%   output samples at a time.  Use this option with BLKSZ << LENGTH(X) if 
%   you are low on memory (MODEFILT1 uses a working matrix of size
%   N x BLKSZ).  By default, BLKSZ == LENGTH(X); this is the fastest
%   execution if you have the memory for it.
%
%   For matrices and N-D arrays, Y = MODEFILT1(X,N,[],DIM) or 
%   Y = MODEFILT1(X,N,BLKSZ,DIM) operates along the dimension DIM.
%
%   See also MEDFILT1, modefilt1_OLD, mode

%   ===================================================
%   Author(s): L. Shure and T. Krauss, 8-3-93
%   Copyright 1988-2004 The MathWorks, Inc.
%   $Revision: 1.8.4.5 $  $Date: 2010/12/06 00:02:40 $
%   ===================================================
% Modified by Weiguang (Gavin) Ding, October 2013


% Validate number of input arguments
error(nargchk(1,4,nargin,'struct'));
if nargin < 2, n = []; end
if nargin < 3, blksz = []; end
if nargin < 4, DIM = []; end

% Check the input data type. Single precision is not supported.
try
    chkinputdatatype(x,n,blksz,DIM);
catch ME
    throwAsCaller(ME);
end

% Check if the input arguments are valid
if isempty(n)
  n = 3;
end

if ~isempty(DIM) && DIM > ndims(x)
	error(message('signal:medfilt1:InvalidDimensions'))
end

% Reshape x into the right dimension.
if isempty(DIM)
	% Work along the first non-singleton dimension
	[x, nshifts] = shiftdim(x);
else
	% Put DIM in the first (row) dimension (this matches the order 
	% that the built-in filter function uses)
	perm = [DIM,1:DIM-1,DIM+1:ndims(x)];
	x = permute(x,perm);
end

% Verify that the block size is valid.
siz = size(x);
if isempty(blksz),
	blksz = siz(1); % siz(1) is the number of rows of x (default)
else
	blksz = blksz(:);
end

% Initialize y with the correct dimension
y = zeros(siz); 

% Call modefilt1D (vector)
for i = 1:prod(siz(2:end)),
	y(:,i) = modefilt1D(x(:,i),n,blksz);
end

% Convert y to the original shape of x
if isempty(DIM)
	y = shiftdim(y, -nshifts);
else
	y = ipermute(y,perm);
end


%-------------------------------------------------------------------
%                       Local Function
%-------------------------------------------------------------------
function y = modefilt1D(x,n,blksz)
%MODEFILT1D  One dimensional mode filter.
%
% Inputs:
%   x     - vector
%   n     - order of the filter
%   blksz - block size

nx = length(x);
if rem(n,2)~=1    % n even
    m = n/2;
else
    m = (n-1)/2;
end
X = [ones(m,1) * x(1); x; ones(m,1) * x(end)]; % modified by wding
% The above line was X = [zeros(m,1); x; zeros(m,1)];
y = zeros(nx,1);

% Work in chunks to save memory
indr = (0:n-1)';
indc = 1:nx;
for i=1:blksz:nx
    ind = indc(ones(1,n),i:min(i+blksz-1,nx)) + ...
          indr(:,ones(1,min(i+blksz-1,nx)-i+1));
    xx = reshape(X(ind),n,min(i+blksz-1,nx)-i+1);
    y(i:min(i+blksz-1,nx)) = mode(xx,1); % modified by wding
    % changed the original median() to mode()
end

function chkinputdatatype(varargin)
%CHKINPUTDATATYPE Check that all inputs are double

%   Copyright 2009-2010 The MathWorks, Inc.
%   $Revision: 1.1.6.3 $  $Date: 2010/12/06 00:12:09 $


for n = 1:nargin
    if ~isa(varargin{n},'double')
        error(message('signal:chkinputdatatype:NotSupported'));
    end
end
% [EOF]

