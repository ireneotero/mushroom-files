% main file for continuation of 3D mushrooms
%close all

clear all
clc

load MUSHROOM3D_SORTED_SOLUTIONS1

ii=1;

par = mush{ii};
parx(1:13) = par(1:13);
parx(14:22) = par(14:22);


p0 = parx(1);
p1 = parx(2);
p2 = parx(3);
p3 = p1;
p4 = parx(4);
p5 = p1;
k = parx(5);
R1 = parx(6);
R2 = parx(7);
du = 1;
dv = parx(8);
dw = parx(9);
n1 = 2;
n2 = 2;
K1 = parx(10);
K2 = parx(11);
S(1) = parx(12);
S(2) = parx(13);
Y_uu = parx(14);
Y_vu = parx(15);
Y_wu = parx(16);
Y_uv = parx(17);
Y_vv = parx(18);
Y_wv = parx(19);
Y_uw = parx(20);
Y_vw = parx(21);
Y_ww = parx(22);

param = [p0 p1 p2 p3 p4 p5 k R1 R2 du dv dw n1 n2 K1 K2 S(1) Y_uu Y_vu Y_wu Y_uv Y_vv Y_wv Y_uw Y_vw Y_ww];

x_guess = [1 1 1];

[x,fval,exitflag]  = fsolve(@mushroom_ss,x_guess,optimoptions('fsolve','Display','off','TolFun', 1e-8, 'TolX', 1e-8),param);

xss = [x(1); x(2);  x(3)];

[x0,v0] = init_EP_EP(@mushroom_ode_cont,xss, param, 17);

opt  =contset;
opt = contset(opt,'Singularities',1);
opt = contset(opt,'MaxNumPoints',10000);
opt = contset(opt,'FunTolerance',1e-7);
opt = contset(opt,'VarTolerance',1e-7);
opt = contset(opt,'MaxNewtonIters',10);
opt = contset(opt,'Eigenvalues',1);
opt = contset(opt,'MaxCorrIters',100);
opt =contset(opt,'Backward',0);
[x,v,s,h,f]=cont('equilibrium',x0,[],opt);
disp('now backwards')
pause(5)

opt=contset(opt,'Backward',1);
opt=contset(opt,'MaxNumPoints',10000);
[xb,vb,sb,hb,fb]=cont('equilibrium',x0,[],opt);

figure(1)

set(gca,'fontsize',14)
plot(x(4,:),x(2,:),'b-')
hold on
plot(xb(4,:),xb(2,:),'b-')
axis([0 200 0 300])
xlabel('S','FontSize',14)
ylabel('u','FontSize',14)
set(gca,'fontsize',14)

