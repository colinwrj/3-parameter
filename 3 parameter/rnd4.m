function [r] = rnd4(n,p)
    %UNTITLED3 Summary of this function goes here
    %   Detailed explanation goes here
    x1 = floor(n*p(1));
    x2 = floor(n*(p(1)+p(2)));
    x3 = floor(n*(p(1)+p(2)+p(3)));
    r1 = 0;
    r2 = 0;
    r3 = 0;
    r4 = 0;
    for i = 1:n
        x0 = rand*n;
        if x0<x1
            r1=r1+1;
        elseif x0<x2
            r2=r2+1;
        elseif x0<x3
            r3=r3+1;
        else
            r4=r4+1;
        end
    end
    r = [r1 r2 r3 r4];
    
end

