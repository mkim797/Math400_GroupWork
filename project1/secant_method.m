function [y,itc] = secant_method(x0, x1, TOL, Nmax )

%SECANT_METHOD     approximate the root of an arbitrary function using 
%                  secant method
%
%     calling sequences:
%             y = secant_method( f, x0, x1, TOL, Nmax )
%              secant_method( f, x0, x1, TOL, Nmax )
%
%     inputs:
%             f       the function whose root is to determine
%             x0,x1   left and right endpoints, respectively, of initial interval
%             TOL     absolute error convergence tolerance
%             NMax    maximum number of iterations to be performed
%
%     output:
%             y       approximate value of root
%             itc     number of iterations needed for convergence
%

f_x0 = f(x0); 
f_x1 = f(x1);
itc = 0;
h_x = linspace (-4, 4, 100); 
h_y = f(h_x);
t_x = linspace (-4, 4, 10);
fig1 = figure('position',[ 0 0 700 1000 ]);
movegui(fig1, 'center');

while abs(f_x1) > TOL && itc < Nmax
    try
        dx = (f_x1 - f_x0)/(x1-x0);
        x = x1 - f_x1/dx;
    catch
        fprintf('Error! - derivative zero for x = %.8f\n', x0)
    end
    subplot(4,2,itc+1)
    t_y = ((f_x1 - f_x0)/(x1 - x0))*(t_x - x1) + f_x1;
    plot(h_x, h_y, 'b-', t_x, t_y, 'r-');
    title("Plot of f(x) with secant at x" + (itc) + ".")
    grid('on');
    xlabel('x'); 
    ylabel('f(x)');
    disp('...press enter to continue')
    pause on; pause;
    x0   = x1;     x1 = x;
    f_x0 = f_x1; f_x1 = f(x1); 
    itc = itc + 1;
    [x f_x1]
end

y = x1;
if abs(f_x1) > TOL
    
    itc = -1;
end

function fx = f(x)
%	%% Enter your function here.
       fx = tanh(x); 
	return;