function h = figureFullScreen(ratio, varargin)
% is full screen version of figure.
%   SYNTAX:
%   h = figureFullScreen
%   h = figureFullScreen(ratio)
%   h = figureFullScreen(ratio, varargin)
%
%   INPUT:
%   "ratio" is the ratio between the size of figure and the size of the
%   screen. If not given, it is set to 1.
%   "varargin" is exactly the same as the input format for function figure.
%
%   See also: figure

% by Weiguang (Gavin) Ding, September 2013

%%
if nargin == 0
    ratio = 1;
end

screen_size = get(0, 'ScreenSize');
h0 = figure(varargin{:});
set(h0, 'Position', [0, 0, ratio * screen_size(3), ratio * screen_size(4)]);

if nargout > 0
    h = h0;
end
