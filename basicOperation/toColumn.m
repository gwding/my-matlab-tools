function V = toColumn(V)
% converts vector V to column vector if V is row vector, otherwise
% don't do any change.

% by Weiguang (Gavin) Ding, October 2012

if isrow(V)
    V = V';
% else
%     warning('Input vector is not row vector');
end