function [p] = p(m,p0,x,x0,t0)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    % x represent the unknown parameter
    % x0 represent the estimated parameter
    t = t0/m;
    p = p0;
    for i = 1:m
        p = UA(x0,t)'*UA(x,t)*p*UA(x,t)'*UA(x0,t);
    end
        
    
    
end

