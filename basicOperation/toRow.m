function V = toRow(V)
% converts vector V to row vector if V is column vector, otherwise
% don't do any change.

% by Weiguang (Gavin) Ding, October 2012

if iscolumn(V)
    V = V';
% else
%     warning('Input vector is not column vector');
end