function out = mushroom_ode_cont
out{1} = [];
out{2} = @fun_eval;
out{3} = [];
out{4} = [];
out{5} = [];
out{6} = [];
out{7} = [];
out{8} = [];
out{9} = [];

function dxdt = fun_eval(t,x,par1,par2,par3,par4,par5,par6,par7,par8,par9,par10,par11,par12,par13,par14,par15,par16,par17,par18,par19,par20,par21,par22,par23,par24,par25,par26)
    
u = x(1);
v = x(2);
w = x(3);


p0 = par1;
p1 = par2;
p2 = par3;
p3 = par4;
p4 = par5;
p5 = par6;

k = par7;
R1 = par8;
R2 = par9;
du = par10;
dv = par11;
dw = par12;

n1 = par13;
n2 = par14;
K1 = par15;
K2 = par16;
S = par17;

Y_uu = par18;
Y_vu = par19;
Y_wu = par20;
Y_uv = par21;
Y_vv = par22;
Y_wv = par23;
Y_uw = par24;
Y_vw = par25;
Y_ww = par26;


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

dxdt = [p0*(p1+R1*q1 + k*(Y_uun*u^2 + Y_vun*v^2 + Y_wun*w^2))/(1+p1+R1*q1+k*(Y_uud*u^2 + Y_vud*v^2 + Y_wud*w^2)) - du*u;
        p2*(p3+R2*q2 + k*(Y_uvn*u^2 + Y_vvn*v^2 + Y_wvn*w^2))/(1+p3+R2*q2+k*(Y_uvd*u^2 + Y_vvd*v^2 + Y_wvd*w^2)) - dv*v;
        p4*(p5 + k*(Y_uwn*u^2 +Y_vwn*v^2 + Y_wwn*w^2))/(1+p5+k*(Y_uwd*u^2 +Y_vwd*v^2 + Y_wwd*w^2)) - dw*w];
          
     

       



                                

 
