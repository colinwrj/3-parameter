clear;
figure(1);
clf;shg;
warning('off');
m = 1;
iter = 1;
x0 = [1 pi/3 pi/6];
xt = [0.01 0.01 0.01];
t = 1;
n_p = 10000;
n = 100;
t_max = 2*pi;
t_interval = 0.1;

% s_x = [];
% s_cov = [];
% 
% for i = 1:n
%     [x,cov] = simu(m,iter,x0,xt,t,n_p);
%     s_x = [s_x; x];
%     s_cov = [s_cov; cov];
%     
% end
% 
% x1 = x0(1)*sin(x0(2))*cos(x0(3));
% x2 = x0(1)*sin(x0(2))*sin(x0(3));
% x3 = x0(1)*cos(x0(2));
% x_ideal = [x1 x2 x3];
% 
% s_xt = [];
% 
% for i = 1:n
%     xt1 = s_x(i,1)*sin(s_x(i,2))*cos(s_x(i,3));
%     xt2 = s_x(i,1)*sin(s_x(i,2))*sin(s_x(i,3));
%     xt3 = s_x(i,1)*cos(s_x(i,2));
%     xt = [xt1 xt2 xt3];
%     s_xt = [s_xt;xt];
% end

% dx = s_xt - repmat(x_ideal,size(s_xt,1),1);
% dx2 = sum(dx.^2,2);
% mean(dx2)

xx = t_interval:t_interval:t_max
y2 = [];
EB = [];

for i = t_interval:t_interval:t_max
    i
    s_x = [];
    s_delta = [];
    for i = 1:n
        [x,delta] = simu(m,iter,x0,xt,t,n_p);
        s_x = [s_x; x];
        s_delta = [s_delta; delta];
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
    dx = sqrt(mean(dx2));
    y2 = [y2 1/dx];
    EB = [EB std(1/sqrt(dx2))/sqrt(n)];
end

errorbar(xx,y2,EB,'.');
        
    














    
    
    
    