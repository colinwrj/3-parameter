function [J] = J(m,x0,xt,dx,t0)
    %UNTITLED4 Summary of this function goes here
    %   Detailed explanation goes here
    %x0 represent the parameters` true value
    %xt represent the parameters` estimated value
    U0 = Uc(m,x0,xt,t0)'*Uc(m,x0+dx,xt,t0);
    [V,D] = eig(U0);
    e1 = 1/D(1,1);
    e2 = 1/D(2,2);
    theta1 = double(angle(e1));
    theta2 = double(angle(e2));
    C = (max(theta1, theta2) - min(theta1, theta2))/2;
    J = (4*C^2/sum(dx,2)^2);
    
    
end

