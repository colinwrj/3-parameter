B = 1;
theta = pi/3;
T = 1;
m = 1;
x0 = [1 pi/3 pi/6];
dx1 = [0.0001 0 0];
dx2 = [0 0.0001 0];
dx3 = [0 0 0.0001];
J0 = 4*[T^2 0 0; 0 sin(B*T)^2 0; 0 0 sin(B*T)^2*sin(theta)^2];
%Bell state
b1 = 1/sqrt(2)*(kron([0;1],[0;1])+kron([1;0],[1;0]));
b2 = 1/sqrt(2)*(kron([0;1],[0;1])-kron([1;0],[1;0]));
b3 = 1/sqrt(2)*(kron([1;0],[0;1])+kron([0;1],[1;0]));
b4 = 1/sqrt(2)*(kron([1;0],[0;1])-kron([0;1],[1;0]));
J1 = J(m,x0,x0,dx1,T);
J2 = J(m,x0,x0,dx2,T);
J3 = J(m,x0,x0,dx3,T);
J1 = [J1 0 0; 0 J2 0; 0 0 J3];