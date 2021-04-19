function res = mushroom_ss(x,par)

u = x(1);
v = x(2);

p0 = par(1);
p1 = par(2);
p2 = par(3);
p3 = par(4);

k = par(5);
R1 = par(6);
R2 = par(7);
du = par(8);
dv = par(9);

n1 = par(10);
n2 = par(11);
K1 = par(12);
K2 = par(13);
S = par(14);

Y_uu = par(15);
Y_vu = par(16);
Y_uv = par(17);
Y_vv = par(18);

q1 = S^n1/(K1^n1 + S^n1);
q2 = S^n2/(K2^n2 + S^n2);

if Y_uu == -1
    Y_uun = 0;
    Y_uud = 1;
else
    Y_uun = Y_uu;
    Y_uud = Y_uu;
end

if Y_vu == -1
    Y_vun = 0;
    Y_vud = 1;
else
    Y_vun = Y_vu;
    Y_vud = Y_vu;
end
    
if Y_uv == -1
    Y_uvn = 0;
    Y_uvd = 1;
else
    Y_uvn = Y_uv;
    Y_uvd = Y_uv;
end
    
if Y_vv == -1
    Y_vvn = 0;
    Y_vvd = 1;
else
    Y_vvn = Y_vv;
    Y_vvd = Y_vv;
end

res(1) = p0*(p1+R1*q1 + k*(Y_uun*u^2 + Y_vun*v^2))/(1+p1+R1*q1+k*(Y_uud*u^2 + Y_vud*v^2)) - du*u;
res(2) = p2*(p3+R2*q2 + k*(Y_uvn*u^2 + Y_vvn*v^2))/(1+p3+R2*q2+k*(Y_uvd*u^2 + Y_vvd*v^2)) - dv*v;


end

