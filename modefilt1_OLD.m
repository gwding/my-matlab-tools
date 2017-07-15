function y = modefilt1(x,n)
% is a one dimensional mode filter.
%   SYNTAX:
%   y = modefilt1_OLD(x,n)
%   It only deals with column signals, or matrix composed by column
%   signals.
%   
%   NOTE:
%   Should use the new modefilt1 function instead.

% by Weiguang (Gavin) Ding, October 2013

[num, len] = size(x);
y = zeros([num, len]);
for indNum = 1 : num
    for indLen = 1 : len

        if indLen <= (n - 1) / 2
            xx = [x(indNum, len - (n - 1) / 2 + indLen : len), x(indNum, 1 : indLen + (n - 1) / 2)];
        elseif indLen >= len - (n - 1) / 2
            xx = [x(indNum, indLen - (n - 1) / 2 : len), x(indNum, 1 : (n - 1) / 2 - (len - indLen))];
        else
            xx = x(indNum, indLen - (n - 1) / 2 : indLen + (n - 1) / 2);
        end

        y(indNum, indLen) = mode(xx);
    end
end