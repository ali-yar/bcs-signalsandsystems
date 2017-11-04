N = 25;
t = -5:0.01:6;
T = 2;
wo = 2*pi/T; 
ao = 1/2;
Co = ao;

x_trigo = ao*ones(size(t));     % Representing the trigonometric FS
x_exp = Co*ones(size(t));       % Representing the exponential FS

% Finding coefficients an and bn, and trigonometric FS
for n = 1:N
	a = 2/(n*pi)^2 * (1+(-1)^(n+1));
	b = 2/(n*pi);
	x_trigo = x_trigo + a*cos(n*wo*t) + b*sin(n*wo*t);
end

% Finding complex coefficient Cn, and exponential FS
% Cn is obtained by matlab for 1/T * int((-2*t+2)*exp(-i*n*wo*t),t,0,1)
for n = -N:N
  if n==0
      continue
  end
  Cn = -(2*cos(n*wo) - sin(n*wo)*2*i + n*wo*2*i - 2)/(2*n^2*wo^2)             
  x_exp = x_exp + Cn*exp(i*n*wo*t);    	% Fourier Series computation
end

figure(1) 

subplot(3,1,1)  % Original function x(t)
plot([-5 -4 -4 -3 -2 -2 -1  0  0  1  2  2  3  4  4  5  6],...  
    [  0  0  2  0  0  2  0  0  2  0  0  2  0  0  2  0  0]);
xlim([-5 6]);
ylim([-1 3]);
title('Original Function');
hold;

subplot(3,1,2)  % Trigonometric Fourier Series of x(t)
plot(t,x_trigo);
grid;
ttle = ['Truncated Trigonometric Fourier Series with N = ', num2str(N)];
xlabel('t (seconds)');
ylabel('x(t)');
xlim([-5 6]);
ylim([-1 3]);
title(ttle);

subplot(3,1,3)  % Exponential Fourier Series of x(t)
plot(t,x_exp);
grid;
ttle = ['Truncated Exponential Fourier Series with N = ', num2str(N)];
xlabel('t (seconds)');
ylabel('x(t)');
xlim([-5 6]);
ylim([-1 3]);
title(ttle);

figure(2)                         

subplot(2,1,1) % Amplitude Spectrum
stem(0,Co); 
hold
for n = -N:N
    Cn = -(2*cos(n*wo) - sin(n*wo)*2*i + n*wo*2*i - 2)/(2*n^2*wo^2);
    stem(n*wo,abs(Cn));
end
xlabel('w (rad/s)'); ylabel('|cn|')
ttle = ['Amplitude Spectrum with N = ',num2str(N)];
title(ttle);
hold

subplot(2,1,2) % Phase Spectrum
stem(0,angle(Co)*180/pi);              
hold
for n = -N:N
    Cn = -(2*cos(n*wo) - sin(n*wo)*2*i + n*wo*2*i - 2)/(2*n^2*wo^2);
    stem(n*wo,angle(Cn)*180/pi);
end
xlabel('w (rad/s)')
ylabel('angle(cn) (degrees)')
ttle = ['Phase Spectrum with N = ',num2str(N)];
title(ttle);
hold




