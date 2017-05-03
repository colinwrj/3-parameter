function [p] = p(m,p0,x0,xt,t0)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    % x represent the unknown parameter
    % x0 represent the estimated parameter
    t = t0/m;
    p = UA(x0,t)*p0*UA(x0,t)';
    for i = 1:m
        p = UA(x0,t)*UA(xt,t)'*p*UA(xt,t)*UA(x0,t)';
    end
        
    
    
end

