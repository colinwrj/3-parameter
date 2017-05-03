clear;
figure(1);
clf;shg;
warning('off');
m = 1;
iter = 1;
x0 = [1 pi/3 pi/6];
xt = [1 pi/3 pi/6];
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

xx = t_interval:t_interval:t_max;
y2 = [];
EB = [];
y3 = [];
J2 = [];
f1_s = [];
f1_EB_s = [];


for t = t_interval:t_interval:t_max
    t
    s_x = [];
    s_delta = [];
    s_Js = [];
    for i = 1:n
        [x_temp,delta,Js] = simu(m,iter,x0,xt,t,n_p);
        s_x = [s_x; x_temp];
        s_delta = [s_delta; delta];
        s_Js = [s_Js; Js];
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
        xt0 = [xt1 xt2 xt3];
        s_xt = [s_xt;xt0];
    end
    dx_origin = s_x - repmat(x0,size(s_x,1),1);
    dx = s_xt - repmat(x_ideal,size(s_xt,1),1);
    f1 = (dx_origin(:,1).^2);
    f1_mean = mean(f1);
    f1_std = std(f1);
    f1_EB = 1/std(f1)/sqrt(n);
    f1_s = [f1_s 1/f1_mean];
    f1_EB_s = [f1_EB_s f1_EB];
    dx2 = sum(dx.^2,2);
    dx0 = sqrt(mean(dx2));
    y2 = [y2 1/mean(dx2)];
    J_temp = mean(s_Js,1);
    J2 = [J2;J_temp];
    EB = [EB std(1/sqrt(dx2))/sqrt(n)];
end

errorbar(xx,y2,EB,'.');
        
    














    
    
    
    