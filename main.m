% the script file for testing the code
% the curve
X = @(t) 2*cos(2*pi*t); % function description for X, e.g., X = @(t) 2*cos(2*pi*t)
Y = @(t) 3*sin(2*pi*t); % function description for Y, e.g., Y = @(t) 3*sin(2*pi*t)
dXdt = @(t) -4*pi*sin(2*pi*t); % derivative for X(t), e.g., X = @(t) -4*pi*sin(2*pi*t)
dYdt = @(t) 6*pi*cos(2*pi*t); % derivative for Y(t), e.g., Y = @(t) 6*pi*cos(2*pi*t)
% point to be projected
x0 = 10; % the value for x0 goes here
y0 = 20; % the value for y0 goes here
% desired accuracy
eps = 0.0001; % an epsilon specifying desired absolute error
% in the solution
tic;
tc = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps);
toc;
[X(tc) Y(tc)]