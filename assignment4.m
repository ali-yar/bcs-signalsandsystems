fprintf('.:. N-Point DFT Program .:.');

n = input('\n\nEnter the sequence length: ');
x = (zeros(1,n));

fprintf('\nEnter the sequence values..\r\n');
for i = 0:(n-1)
    fprintf('x(%d) = ', i);
    x(i+1) = input('');
end


N = input('\nEnter the number N of point DFT: ');

while N < n
    fprintf('\nWrong input! N should be greater than or equal to %d..', n);
    N = input('\nRe-enter value of N: ');
end

X = fft(x,N);

fprintf('\nDFT values..\r\n');

for i = 0:(n-1)
    fprintf('\nX(%d) = ', i);
    disp(X(i+1));
end

amp = abs(X);
ang = angle(X);

fprintf('Amplitude values..\r\n');
disp(amp);
fprintf('Angle values..\r\n');
disp(ang);