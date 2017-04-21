function [UA] = UA(x,t)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    UA = kron(U(x,t),eye(2));
    
end

