% main file for continuation of 2D mushrooms

clear all
clc


load MUSHROOM2D_SORTED_SOLUTIONS1

ii=1;
par = mush{ii};

p0 = par(1);
p1 = par(2);
p2 = par(3);
p3 = p1;

k = par(4);
R1 = par(5);
R2 = par(6);
du = 1;
dv = par(7);
n1 = 2;
n2 = 2;
K1 = par(8);
K2 = par(9);
S(1) = par(10);
S(2) = par(11);

Y_uu = par(12);
Y_vu = par(13);
Y_uv = par(14);
Y_vv = par(15);


param = [p0 p1 p2 p3 k R1 R2 du dv n1 n2 K1 K2 S(1) Y_uu Y_vu Y_uv Y_vv];

x_guess = [1 1];

[x,fval,exitflag]  = fsolve(@mushroom_ss,x_guess,optimoptions('fsolve','Display','off','TolFun', 1e-8, 'TolX', 1e-8),param);

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
plot(x(3,:),x(1,:),'LineWidth',2)
hold on
plot(xb(3,:),xb(1,:),'LineWidth',2)
axis([0 200 0 300])
xlabel('S','FontSize',14)
ylabel('u','FontSize',14)
set(gca,'fontsize',14)


subplot(1,2,2)
plot(x(3,:),x(2,:),'LineWidth',2)
hold on
plot(xb(3,:),xb(2,:),'LineWidth',2)
axis([0 200 0 300])
xlabel('S','FontSize',14)
ylabel('v','FontSize',14)
set(gca,'fontsize',14)


sprintf('structure%d = %d %d %d %d  \n',ii,Y_uu, Y_vu, Y_uv, Y_vv);
eval(sprintf('saveas(gcf,''bifurcation_diagram_%d.fig'')',ii))

