clc;

x1 = 1;
x2= pi/3;
x3 = pi/6;
t0 = 1;  %t represent total time
m = 5;  %m represent the number of control
t = 1;
x = [x1 x2 x3];
x10 = 0.01;
x20 = 0.01;
x30 = 0.01;
x0 = [x10 x20 x30];
H0 = H(x);
iter = 10;
n0 = 10000;
sigma0 = [1 0;0 1];
sigma1 = [0 1;1 0];
sigma2 = [0 -1i;1i 0];
sigma3 = [1 0;0 -1];

%Bell state
b1 = 1/sqrt(2)*(kron([0;1],[0;1])+kron([1;0],[1;0]));
b2 = 1/sqrt(2)*(kron([0;1],[0;1])-kron([1;0],[1;0]));
b3 = 1/sqrt(2)*(kron([1;0],[0;1])+kron([0;1],[1;0]));
b4 = 1/sqrt(2)*(kron([1;0],[0;1])-kron([0;1],[1;0]));
E1 = b1*b1';
E2 = b2*b2';
E3 = b3*b3';
E4 = b4*b4';

%probe state
phi0 = 1/sqrt(2)*(kron([0;1],[0;1])+kron([1;0],[1;0]));
p_in = phi0*phi0';

s_n = [];
s_p = [];
s_xt = [];

xt = x0;

for i = 1:iter
    
    s_xt = [s_xt;xt];
    
    %final state
    p_out = p(m,p_in,x,x0,t0);

    %calculate the possiblity
    p1 = real(trace(E1*p_out));
    p2 = real(trace(E2*p_out));
    p3 = real(trace(E3*p_out));
    p4 = real(trace(E4*p_out));
    p_v = [p1 p2 p3 p4];
    [n] = rnd4(n0,p_v);
    s_n = [s_n;n];
    s_p = [s_p;p_v];
    
    fun = @(y)myfun(y,m,s_n,s_xt,phi0,t);
    x = fminunc(fun,s_xt(i,:))
    
end






