% March 5, 2021% Code heavily based off of sample file provided on iLearn% Mark Kim (primary coder), Amber Hartigan, Nyan Tun, Alyssa Reyes,% and Adrian Lopezfunction c = bisect(a, b, delta)%%%% bisect.m%% %% Implements the bisection method%%%% Input: 	a 	the left endpoint of the interval%% 		b 	the right endpoint of the interval%% 		delta	the tolerance/accuracy we desire%%                      (Routine will iterate until interval%%                      has width at most 2*delta so that%%                      midpoint is within delta of root.)%%%% Output:	c 	the approxmiation to the root of f%% %% Syntax:	bisect(a, b, delta)%%fa = f(a); 			%% compute initial values of f(a) and f(b)fb = f(b); if  sign(fa) == sign(fb)	%% sanity check: f(a) and f(b) must have different				%% signs				%% 				%% the error function prints an error message and				%% exits	error('f must have different signs at the endpoints a and b.  Aborting.')endfprintf('initial interval:  a=%d, b=%d, fa=%d, fb=%d\n',a,b,fa,fb)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                       %%%% main routine                                                          %%%%                                                                       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%p_vector = zeros(2, 2);labels = zeros(2,1);p_x = linspace(-4, 4, 100);p_y = f(p_x);fig1 = figure('position',[ 0 0 700 1000 ]); % Size figuremovegui(fig1, 'center');                    % Position figure in center of screenhold on;plot(p_x, p_y, 'b-');counter = 1;while ( abs(b - a) > 2*delta )	%% While the size of the interval is				%% larger than the tolerance	c = (b + a)/2;		%% Set c to be the midpoint of the interval	fc = f(c);		%% Calculate the value of f at c    p_vector(counter, 1) = c;    p_vector(counter, 2) = fc;    labels(counter) = counter;	if sign(fc) ~= sign(fb)	%% If f(c) and f(b) are of different sign, then				%% f must have a zero between c and b (by the 				%% Intermediate Value Theorem).		a = c; 	fa = fc;	else 			%% This is the case where f(a) and f(c) are of 				%% different sign.			        %%			b = c;	fb = fc;    end    counter = counter + 1;    				%% Repeat the algorithm on the new interval        fprintf('   a=%d, b=%d, fa=%d, fb=%d\n',a,b,fa,fb)endlabels = cellstr( num2str(labels));plot(p_vector(:,1),p_vector(:,2), 'rx');text(p_vector(:,1),p_vector(:,2), labels, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');%%%% put subroutines here%%%%function fx = f(x)%	%% Enter your function here.       fx = tanh(x); 	return;