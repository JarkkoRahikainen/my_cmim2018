% A driver to test function integral_trapezoid().

clc
close all
clear variables
% Using a sine function to test the integral:
% \int_0^pi sin(x) dx = 2

disp('Testing integral_trapezoid() with sin(x) in interval from 0 to pi (Ans = 2).')
for ii = [1e1, 1e2, 1e3, 1e4, 1e5]
    res = integral_trapezoid(@sin, 0, pi, ii);
    fprintf('Number of splits: %d, answer = %5.10f\n', ii, res)
end

disp('Comparison to built-in function (trapz)')
for ii = [1e1, 1e2, 1e3, 1e4, 1e5]
    sinvec = sin(0:pi/ii:pi);
    res = trapz(0:pi/ii:pi, sinvec);
    fprintf('Number of splits: %d, answer = %5.10f\n', ii, res)
end

disp('Testing integral_trapezoid_faster() with sin(x) in interval from 0 to pi (Ans = 2).')
for ii = [1e1, 1e2, 1e3, 1e4, 1e5]
    res = integral_trapezoid(@sin, 0, pi, ii);
    fprintf('Number of splits: %d, answer = %5.10f\n', ii, res)
end


% Efficiency test:
disp('Time for old version:')
for ii=1:20
    tic;
    integral_trapezoid(@sin, 0, pi, 1e6);
    tOld(ii) = toc;
end
fprintf('Total time %5.5f, average %5.5f\n', sum(tOld), mean(tOld))
disp('After optimisation:')
for ii=1:20
    tic;
    integral_trapezoid_faster(@sin, 0, pi, 1e6);
    tNew(ii) = toc;
end
fprintf('Total time %5.5f, average %5.5f\n', sum(tNew), mean(tNew))
fprintf('Total speedup: %5.2f\n', sum(tOld)/sum(tNew))
