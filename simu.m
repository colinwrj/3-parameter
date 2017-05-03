function [x,delta,Js] = simu(m,iter,x0,xt,t,n_p)

    %x0 represent the parameters` true value
    %xt represent the parameters` estimated value
    %n_p represent the total number of photons we use
    %x10 = 1;
    %x20 = pi/3;
    %x30 = pi/6;
    %t0 = 1;  %t represent total time
    %m = 5;  %m represent the number of control
    %t = 1;
    %x0 = [x10 x20 x30];
    %x1 = 0.01;
    %x2 = 0.01;
    %x3 = 0.01;
    %xt = [x1 x2 x3];
    dx1 = [0.001 0 0];
    dx2 = [0 0.001 0];
    dx3 = [0 0 0.001];
    %H0 = H(xt);
    %iter = 10;
    n0 = n_p / iter;
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
    s_xt = [s_xt;xt];


    for i = 1:iter


        %final state
        p_out = p(m,p_in,x0,xt,t);

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
        options = optimoptions('fminunc','Display','off');
        x = fminunc(fun,s_xt(i,:),options);
        %x = fminunc(fun,s_xt(i,:));
        s_xt = [s_xt;x];
        xt = x;
    
    end
        


        J1 = J(m,x,x,dx1,t);
        J2 = J(m,x,x,dx2,t);
        J3 = J(m,x,x,dx3,t);
        Js = [J1 J2 J3];
        %Jmax = J1+J2+J3;
        %cov = 1/n_p/Jmax;
        delta = 1/J1+1/J2*x(1)^2+1/J3*x(1)^2*sin(x(2))^2;
    
end






