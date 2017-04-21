function f = myfun(y,m,s_n,s_xt,phi0,t)
    
    %Bell state
    b1 = 1/sqrt(2)*(kron([0;1],[0;1])+kron([1;0],[1;0]));
    b2 = 1/sqrt(2)*(kron([0;1],[0;1])-kron([1;0],[1;0]));
    b3 = 1/sqrt(2)*(kron([1;0],[0;1])+kron([0;1],[1;0]));
    b4 = 1/sqrt(2)*(kron([1;0],[0;1])-kron([0;1],[1;0]));
    
    
    
    f = 0;
    for i = 1:size(s_n,1)
        Uf = Uc(m,y,s_xt(i,:),t);
        p1 = abs(b1'*Uf*phi0)^2;
        p2 = abs(b2'*Uf*phi0)^2;
        p3 = abs(b3'*Uf*phi0)^2;
        p4 = abs(b4'*Uf*phi0)^2;
        f = f-s_n(i,1)*log2(p1)-s_n(i,2)*log2(p2)-s_n(i,3)*log2(p3)-s_n(i,4)*log2(p4);
    end
end

