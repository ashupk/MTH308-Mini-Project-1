% This code is submitted by ASHU PRAKASH, Roll No. 14146
% Written for Mini Project 1 of the course MTH308A
% Submitted on 09 April 2017

function [tc] = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps)

    f = @(t) (((X(t)-x0)^2)+((Y(t)-y0)^2)); % square of distance function
    dfdt = @(t) ((X(t)-x0)*dXdt(t))+((Y(t)-y0)*dYdt(t)); % first derivative of f
    % Finding the double derivative of f
    syms t
    d2fdt2 = diff(((X(t)-x0)*dXdt(t))+((Y(t)-y0)*dYdt(t)),1);
    d2fdt2 = matlabFunction(d2fdt2); % second derivative of f
    
    % I am running the code for 1000 times to ensure that no minima is
    % missed and no maxima point is resulted. 
    for i=1:1000
        
        ta(1) = rand; %Randomizing the initial point for the Newton's method
        m = 1;
        while(abs(dfdt(ta(m))) > eps) %Iterating for Newton's method.
            % abs(dfdt(ta(m))) > eps so that the first derivative of f is 
            % as close to zero as possible. That is by making it as small
            % as eps (error)
            % Applying Newton's Method on the first derivative of f
            ta(m+1) = ta(m) - (dfdt(ta(m))/d2fdt2(ta(m))); % Newton's method
            m = m + 1;
        end
        tcf(i) = ta(m-1); % Set of points where f is optimum
        D(i) = (f(tcf(i))); % Set of points where square of f is optimum
    end
    [minD,I] = min(D); % Taking the minimum square of distance D
    tc = tcf(I) % The required t at which f is minimum
 end