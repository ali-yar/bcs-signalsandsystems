w = i * .15;
n = -10:40
y = exp(w*n);
N = length(n);

% 2D
subplot(2,1,1);
stem(n,real(y),'.');
box off;
grid on;
ylim([-1.1 1.1]);
ylabel('Real Part');

subplot(2,1,2);
stem(n,imag(y),'.');
box off;
grid on;
ylim([-1.1 1.1]);
xlabel('Time(n)');
ylabel('Imaginary Part');

% 3D
figure
plot3(n,zeros(1,N),zeros(1,N),'k'); % straight line 
hold on;

% real
plot3(n,real(y),-1.1*ones(size(n)),'.g');
plot3(ones(2,1)*n,[zeros(1,N);real(y)],-1.1*ones(2,N),'g');

% imaginary
plot3(n,-1.1*ones(size(n)),imag(y),'.r');
plot3(ones(2,1)*n,-1.1*ones(2,N),[zeros(1,N);imag(y)],'r');

% complex
plot3(n,real(y),imag(y),'.b'),              
plot3(ones(2,1)*n,[zeros(1,N);real(y)],[zeros(1,N);imag(y)],'b');

% complex plane
plot3(ones(1,N)*-10,real(y),imag(y),'.y'); 

hold off;
grid on;
set(gca,'XDir','reverse') % reversing the values on the x-axis
set(gca,'YDir','reverse') % reversing the values on the y-axis
xlabel('Time(Samples)');
ylabel('Real Part ');
zlabel('Imaginary part');
title('Complex:Blue Real:Green Imaginary:Red Complex Plane:Yellow');
axis([min(n) max(n) -1.1 1.1 -1.1 1.1]);
view(-45,15);
