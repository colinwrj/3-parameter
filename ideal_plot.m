figure(1);
hold on;

x0 = [1 pi/3 pi/6];
m = 1;

t = 1;
dx2 = 1/4/m^2*(1/t^2+2*x0(1)^2/sin(x0(1)*t)^2);
x_2 = [];
y_2 = []

% for t = 0.01:0.01:2*pi
%     x_2 = [x_2 t];
%     dx2 = 1/4/m^2*(1/t^2+2*x0(1)^2/sin(x0(1)*t)^2);
%     y_2 = [y_2 1/dx2];
% end


for t = 0.01:0.01:2*pi
    x_2 = [x_2 t];
    dx2 = 4*m^2*t^2;
    y_2 = [y_2 dx2];
end

y_2 = y_2*10000;
plot(x_2,y_2);


















