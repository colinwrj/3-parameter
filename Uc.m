function [Uc] = Uc(m,x0,xt,t0)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    %x0 represent the parameters` true value
    %xt represent the parameters` estimated value
    t = t0/m;
    Uc = UA(x0,t);
    for i = 1:m-1
        Uc = UA(x0,t)*UA(xt,t)'*Uc;
    end
    
    
    
end

