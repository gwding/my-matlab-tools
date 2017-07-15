x = [1, 2, 3, 4, 4; 1, 3, 3, 4, 4];
n = 5;
y = modefilt1_OLD(x,n)
y = medfilt1(x, n, [], 2)
y = modefilt1(x, n, [], 2)