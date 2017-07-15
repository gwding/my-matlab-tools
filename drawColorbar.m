function drawColorbar(varargin)
% draws vertical or horizontal colorbar.
%   SYNTAX:
%   drawColorbar()
%   drawColorbar('PropertyName', propertyValue, ...)
%
%   PropertyName:
%   "ImageDisp" is the image used to display the colorbar.
%   "YTick" is the ticks where you want to display the label. It can be the
%   actual row indices, or values ranging from 0 to 1. In the latter case,
%   it will be transfered to actual frame indices automatically.
%   "YTickLabel" is the label to be displayed. This can be a cell array
%   with strings, or numeric array. In both case, the size should be the
%   same as "YTick". For the numeric case, if the ascending/descending
%   order is wrong, it'll be automatically corrected.
%   "FontSize"
%   "AspectRatio" is used to adjust the x-y axis ratio of the colorbar.
%   "ColorMap" is the colormap used for colorbar.
%   "IsHorizontal" determines whether the colorbar is horizontal.
%
%   NOTE:
%   This function is able to be used for plotting horizontal colorbar. When
%   you set IsHorizontal to 1, use XTick and XTicklabel instead, and set
%   YTick and YTickLabel to [].

% by Weiguang (Gavin) Ding, October 2013
% TO EXTEND:
%       options for moving the tick labels to the right of the image.
%       easier options for horizontal toolbars.


%% Parameter settings
% default parameters
YTick = [1, 50, 100];
YTickLabel = {'1', '0.5', '0'};
XTick = [];
XTickLabel = [];
FontSize = 30;
AspectRatio = [1, 6, 1];
ImageDisp = [1 : -0.01 : 0]';
ColorMap = jet(256);
ColorMap = ColorMap(1 : 216, :);
IsHorizontal = 0;

% overwrite default parameters
for k = 1 : 2 : length(varargin)
    eval([varargin{k}, ' = varargin{', int2str(k + 1), '};']);
    eval([capitalize(varargin{k}), ' = varargin{', int2str(k + 1), '};']);
end

if IsHorizontal
    ImageDisp = ImageDisp';
end
    
%% processing the inputs

% if the YTick is less or equal than 1, convert it to pixel index
if max(YTick) <= 1
    YTick = YTick * length(ImageDisp);
end
YTick(YTick == 0) = 1;

% reverse the label order if it is numeric and reversed
if isnumeric(YTickLabel)
    if YTickLabel(end) > YTickLabel(1)
        YTickLabel = YTickLabel(end : -1 : 1);
    end
end

%% generate the colorbar image
imagesc(ImageDisp);
colormap(ColorMap);
pbaspect(AspectRatio);
set(gca, 'YTick', YTick, 'YTickLabel', YTickLabel,...
    'XTick', XTick, 'XTickLabel', XTickLabel,...
    'FontSize', FontSize);