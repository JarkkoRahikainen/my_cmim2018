% A simple script that uses the integral_trapezoid_faster to compute a 2d
% integral

clc
close all
clear variables

% Using function f(x,y) = x^2 + y^2: 
% \int_-1^1 \int_-1^1 f(x,y) dx dy = 8/3 (approx. 2.667)
f = @(x,y)x.^2 + y.^2;
res = integral_trapezoid(@(x)integral_trapezoid(@(y)f(x,y), -1, 1, 100), -1, 1, 100);