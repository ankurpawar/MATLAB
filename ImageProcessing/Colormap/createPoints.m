function points = createPoints(a,b,n)
% create linearly spaced n points from a to b 
% return b when n is 1
% return empty matrix when n is 0 
% similar to linspace
if n == 1
    points = b;
    return 
elseif n == 0
    points = [];
    return
end
d = b - a;
p = 0:1/(n-1):1;
points = a + p*d;
end