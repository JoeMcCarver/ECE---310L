%%lab9
%grp13

t1 = xlsread('scope_0.xlsx',1,'A3:A1002');
vd = 5- xlsread('scope_0.xlsx',1,'B3:B1002');

t2 = xlsread('scope_1.xlsx',1,'A3:A1002');
vr = xlsread('scope_1.xlsx',1,'B3:B1002');

t3 = xlsread('scope_2.xlsx',1,'A3:A1002');
vc = xlsread('scope_2.xlsx',1,'B3:B1002');

subplot(3,1,1)
plot(t1,vd);
title('V_D1')
subplot(3,1,2)
plot(t2,vr);
title('V_rc')
subplot(3,1,3)
plot(t3,vc);
title('V_CE')
%%
I = [20,15,10,5];
wl = [0.00912,0.01278,0.0126,0.0088];
ws = [0.046536,0.02646,0.012,0.003036];
plot(I,wl);
hold on
plot(I,ws)
legend('linear','switch mode')