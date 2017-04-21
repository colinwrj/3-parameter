function [U] = U(x,t)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    U = expm(-i*H(x)*t);
    
    
end

