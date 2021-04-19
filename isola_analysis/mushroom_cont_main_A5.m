% analysis of isola formation (structure A5)
% continuation with Cl_ matcont5p4

close all
clear all
clc


p0 = 230.4215 ;
p1 = 50.0000;
p2 = 220.8200;
p3 = p1;

k = 0.1000;
R1 = 264.2336;
R2 = 274.5111;
du = 1;
n1 = 2;
n2 = 2;
K1 = 10.0000;
K2 = 133.2515;
S(1) =  5.2981;
S(2) = 82.1557;
Y_uu = 0;
Y_vu = -1;
Y_uv = -1;
Y_vv = -1;

dvx = [0.28 0.24 0.2 0.17 0.1524 0.1522 0.15 0.12];

for ii=1:1:8

dv = dvx(ii);

param = [p0 p1 p2 p3 k R1 R2 du dv n1 n2 K1 K2 S(1) Y_uu Y_vu Y_uv Y_vv];

x_guess = [1 1];

[x,fval,exitflag]  = fsolve(@mushroom_ss,x_guess,[],param);

xss = [x(1); x(2)];

[x0,v0] = init_EP_EP(@mushroom_ode_cont,xss, param, 14);

opt  =contset;
opt = contset(opt,'Singularities',1);
opt = contset(opt,'MaxNumPoints',10000);
opt = contset(opt,'FunTolerance',1e-7);
opt = contset(opt,'VarTolerance',1e-7);
opt = contset(opt,'MaxNewtonIters',10);
opt = contset(opt,'MaxCorrIters',100);
opt =contset(opt,'Backward',0);
[x,v,s,h,f]=cont('equilibrium',x0,[],opt);
disp('now backwards')
pause(5)

opt=contset(opt,'Backward',1);
opt=contset(opt,'MaxNumPoints',10000);
[xb,vb,sb,hb,fb]=cont('equilibrium',x0,[],opt);

figure(1)
subplot(1,2,1)
set(gca,'fontsize',14)
plot(x(3,:),x(1,:),'b-')
hold on
plot(xb(3,:),xb(1,:),'b-')
axis([0 200 0 250])
xlabel('S','FontSize',14)
ylabel('u','FontSize',14)
set(gca,'fontsize',14)

subplot(1,2,2)
plot(x(3,:),x(2,:),'b-')
hold on
plot(xb(3,:),xb(2,:),'b-')
axis([0 200 0 250])
xlabel('S','FontSize',14)
ylabel('v','FontSize',14)
set(gca,'fontsize',14)


end
