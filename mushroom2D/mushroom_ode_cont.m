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

function dxdt = fun_eval(t,x,par1,par2,par3,par4,par5,par6,par7,par8,par9,par10,par11,par12,par13,par14,par15,par16,par17,par18)
    
u = x(1);
v = x(2);


p0 = par1;
p1 = par2;
p2 = par3;
p3 = par4;

k = par5;
R1 = par6;
R2 = par7;
du = par8;
dv = par9;

n1 = par10;
n2 = par11;
K1 = par12;
K2 = par13;
S = par14;

Y_uu = par15;
Y_vu = par16;
Y_uv = par17;
Y_vv = par18;

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

          
 dxdt = [p0*(p1+R1*q1 + k*(Y_uun*u^2 + Y_vun*v^2))/(1+p1+R1*q1+k*(Y_uud*u^2 + Y_vud*v^2)) - du*u
         p2*(p3+R2*q2 + k*(Y_uvn*u^2 + Y_vvn*v^2))/(1+p3+R2*q2+k*(Y_uvd*u^2 + Y_vvd*v^2)) - dv*v];
          





                                

 
