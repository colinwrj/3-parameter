function [Uc] = Uc(m,x,x0,t0)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    t = t0/m;
    Uc = UA(x,t);
    for i = 1:m-1
        Uc = UA(x,t)*UA(x0,t)'*Uc;
    end
    
    
    
end

