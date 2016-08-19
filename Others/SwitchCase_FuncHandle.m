% Switch case and function handle
% Function handles in MATLAB are just like function pointers in C.
x = 2;
y = 3;
z = 0;
choice = 2;
for n = 1:100
    switch choice
        case 1
            z = z + x + y;
        case 2
            z = z + x + y^2 + y;
        case 3
            z = z + x^2 + y; 
    end
end
z

x = 2;
y = 3;
z = 0;
choice = 2;
switch choice
    case 1
        func = @(x,y)(x + y);
    case 2
        func = @(x,y)(x + y^2 + y);
    case 3
        func = @(x,y)(x^2 + y);
end

for n = 1:100
    z = z + func(x,y);
end
z