%clear;
warning('off');
m = 1;
iter = 1;
x0 = [1 pi/3 pi/6];
xt = [1 pi/3 pi/6];
t = 1;
n_p = 10000;
n = 1000;

s_x = [];
s_cov = [];

for i = 1:n
    [x,cov] = simu(m,iter,x0,xt,t,n_p);
    s_x = [s_x; x];
    s_cov = [s_cov; cov];
    
end

x1 = x0(1)*sin(x0(2))*cos(x0(3));
x2 = x0(1)*sin(x0(2))*sin(x0(3));
x3 = x0(1)*cos(x0(2));
x_ideal = [x1 x2 x3];

s_xt = [];

for i = 1:n
    xt1 = s_x(i,1)*sin(s_x(i,2))*cos(s_x(i,3));
    xt2 = s_x(i,1)*sin(s_x(i,2))*sin(s_x(i,3));
    xt3 = s_x(i,1)*cos(s_x(i,2));
    xt = [xt1 xt2 xt3];
    s_xt = [s_xt;xt];
end

dx = s_xt - repmat(x_ideal,size(s_xt,1),1);
dx2 = sum(dx.^2,2);
mean(dx2)
dx_origin = s_x - repmat(x0,size(s_x,1),1);
dx = s_xt - repmat(x_ideal,size(s_xt,1),1);
f1 = 1./(dx_origin(:,1).^2);
f1_mean = mean(f1);
f1_std = std(f1);
f1_EB = f1_std / sqrt(n);

cov

ideal = 1/4/m^2*(1/t^2+2*x0(1)^2/sin(x0(1)*t)^2)
    
    
    
    
    
    
    
    