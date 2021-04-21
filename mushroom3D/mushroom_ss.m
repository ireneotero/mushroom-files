function res = mushroom_ss(x,par)

u = x(1);
v = x(2);
w = x(3);

p0 = par(1);
p1 = par(2);
p2 = par(3);
p3 = par(4);
p4 = par(5);
p5 = par(6);

k = par(7);
R1 = par(8);
R2 = par(9);
du = par(10);
dv = par(11);
dw = par(12);

n1 = par(13);
n2 = par(14);
K1 = par(15);
K2 = par(16);
S = par(17);

Y_uu = par(18);
Y_vu = par(19);
Y_wu = par(20);

Y_uv = par(21);
Y_vv = par(22);
Y_wv = par(23);

Y_uw = par(24);
Y_vw = par(25);
Y_ww = par(26);


q1 = S^n1/(K1^n1 + S^n1);
q2 = S^n2/(K2^n2 + S^n2);

% uu
if Y_uu == -1
    Y_uun = 0;
    Y_uud = 1;
else
    Y_uun = Y_uu;
    Y_uud = Y_uu;
end

% vu
if Y_vu == -1
    Y_vun = 0;
    Y_vud = 1;
else
    Y_vun = Y_vu;
    Y_vud = Y_vu;
end    

% wu
if Y_wu == -1
    Y_wun = 0;
    Y_wud = 1;
else
    Y_wun = Y_wu;
    Y_wud = Y_wu;
end
    
% uv
if Y_uv == -1
    Y_uvn = 0;
    Y_uvd = 1;
else
    Y_uvn = Y_uv;
    Y_uvd = Y_uv;
end

% vv
if Y_vv == -1
    Y_vvn = 0;
    Y_vvd = 1;
else
    Y_vvn = Y_vv;
    Y_vvd = Y_vv;
end

% wv
if Y_wv == -1
    Y_wvn = 0;
    Y_wvd = 1;
else
    Y_wvn = Y_wv;
    Y_wvd = Y_wv;
end


% uw
if Y_uw == -1
    Y_uwn = 0;
    Y_uwd = 1;
else
    Y_uwn = Y_uw;
    Y_uwd = Y_uw;
end


% vw
if Y_vw == -1
    Y_vwn = 0;
    Y_vwd = 1;
else
    Y_vwn = Y_vw;
    Y_vwd = Y_vw;
end


% ww
if Y_ww == -1
    Y_wwn = 0;
    Y_wwd = 1;
else
    Y_wwn = Y_ww;
    Y_wwd = Y_ww;
end
res = [p0*(p1+R1*q1 + k*(Y_uun*u^2 + Y_vun*v^2 + Y_wun*w^2))/(1+p1+R1*q1+k*(Y_uud*u^2 + Y_vud*v^2 + Y_wud*w^2)) - du*u;
        p2*(p3+R2*q2 + k*(Y_uvn*u^2 + Y_vvn*v^2 + Y_wvn*w^2))/(1+p3+R2*q2+k*(Y_uvd*u^2 + Y_vvd*v^2 + Y_wvd*w^2)) - dv*v;
        p4*(p5 + k*(Y_uwn*u^2 +Y_vwn*v^2 + Y_wwn*w^2))/(1+p5+k*(Y_uwd*u^2 +Y_vwd*v^2 + Y_wwd*w^2)) - dw*w];
          



end

