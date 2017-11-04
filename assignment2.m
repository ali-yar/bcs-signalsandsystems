k = -5:50;
l = -(0:.1:5);

x = [zeros(1,5),ones(1,10),zeros(1,41)];
h = [zeros(1,5),exp(l)];
y=conv(x,h);

subplot(2,2,1); 
stem(k,x,'b');
xlabel('n');
ylabel('Amplitude');
axis([-5 50 0 2]);
set(gca,'YTick',[0:.2:2]);
set(gca,'XTick',[-5:5:50]);
title('x(n) Vs n');

subplot(2,2,2);
stem(k,h,'b');
xlabel('n');
ylabel('Amplitude');
axis([-5 50 0 2]);
set(gca,'YTick',[0:.2:2]);
set(gca,'XTick',[-5:5:50]);
title('h(n) Vs n');

subplot(2,2,3:4);
stem(y,'b');
xlabel('n');
ylabel('Amplitude');
axis([0 80 0 12]);
title('y(n) Vs n');


