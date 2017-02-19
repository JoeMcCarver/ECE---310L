%% ECE 310L - Lab 5

clc
clear all

NMOS_Vt = csvread('n2.csv',3,0)';

t1 = NMOS_Vt(1,:);
Vd1 = NMOS_Vt(2,:);
Vs1 = NMOS_Vt(3,:);

NMOS_Vt05 = csvread('n3.csv',3,0)';

t2 = NMOS_Vt05(1,:);
Vd2 = NMOS_Vt05(2,:);
Vs2 = NMOS_Vt05(3,:);

NMOS_Vt1 = csvread('n4.csv',3,0)';

t3 = NMOS_Vt1(1,:);
Vd3 = NMOS_Vt1(2,:);
Vs3 = NMOS_Vt1(3,:);

NMOS_Vt15 = csvread('n5.csv',3,0)';

t4 = NMOS_Vt15(1,:);
Vd4 = NMOS_Vt15(2,:);
Vs4 = NMOS_Vt15(3,:);

% NMOS_Vt2 = csvread('n5.csv',3,0)';
% 
% t5 = NMOS_Vt2(1,:);
% Vd5 = NMOS_Vt2(2,:);
% Vs5 = NMOS_Vt2(3,:);

t = [t1;t2;t3;t4];
Vd = [Vd1;Vd2;Vd3;Vd4];
Vs = [Vs1;Vs2;Vs3;Vs4];
Id = (Vd./10);

xmin = 0.1; xmax = 0.42; ymin = 0; ymax = .16;

a = int32(5);

figure
subplot(2,1,1)
waterfall(Id)

subplot(2,1,2)
waterfall(Vs)
rotate3d

figure 
waterfall(Vs,Id), rotate3d
%%

figure
for i=1:4
%     n = length(Vs);
%     ne = 9*n/10;
%     ns = 3*n/10;
%     ne = cast(ne,'like',a);
%     ns = cast(ns,'like',a);
    subplot(4,1,i)
    plot(t(i,:),Vs(1,:),t(i,:),Vd(i,:)), grid
%     plot(Vs(i,ns:ne),Id(1,ns:ne)), grid
    title(sprintf('Id_%d(t)',i))
%     axis([xmin xmax ymin ymax])
end