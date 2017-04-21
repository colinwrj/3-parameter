function [H] = H(x)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    sigma0 = [1 0;0 1];
    sigma1 = [0 1;1 0];
    sigma2 = [0 -1i;1i 0];
    sigma3 = [1 0;0 -1];
    H = x(1)*(sin(x(2))*cos(x(3))*sigma1+sin(x(2))*sin(x(3))*sigma2+cos(x(2))*sigma3);
    
    
    
end

