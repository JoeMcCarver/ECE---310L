%% ece 310 lab 2
% computations using componenet measurements
R1 = 9.983*10^3; R2 = 474.95; R3 = 11.05;
Vt = 26*10^(-3);
Vd = 0:0.001:-0.41;
Is = 10^(-6);


Id = Is.*exp(Vd/Vt);

figure
plot(Vd,Id), grid on


%%


Vd = -0.80:0.001:0;
Is = -10^(-7);
n = -1.7;

Id = Is.*exp((Vd)/(n*Vt));

figure
plot(Vd,Id), grid on
% axis([-0.8 0 -10^(-7) 10^(-7)]);


%% scope data 
%forward 10k
filename = 'Lab2.xlsx';
sheet = 1;

figure
vr1 = xlsread(filename,sheet,'B2:L2');
vd1 = xlsread(filename,sheet,'B3:L3');
ir1 = vr1./9383;
plot(vd1,ir1);
hold on;

%reverse 10k
vrr1 = xlsread(filename,sheet,'B7:Q7');
vdr1 = xlsread(filename,sheet,'B8:Q8');
vdr1 = vdr1.*(-1);
irr1 = vrr1./9383;
irr1 = irr1.*(-1);
subplot(2,1,1)
plot(vdr1,irr1), grid on
xlabel('V_d')
ylabel('I_d')
title('I-V plot with diode')

%forward 500
subplot(2,1,2)
figure
vr2 = xlsread(filename,sheet,'B12:L12');
vd2 = xlsread(filename,sheet,'B13:L13');
ir2 = vr2./474.95;
plot(vd2,ir2);
hold on;

%reverse 500
vrr2 = xlsread(filename,sheet,'B17:Q17');
vdr2 = xlsread(filename,sheet,'B18:Q18');
vdr2 = vdr2.*(-1);
irr2 = vrr2./474.95;
irr2 = irr2.*(-1);
plot(vdr2,irr2), grid on
xlabel('V_d');
ylabel('I_d');
title('I-V plot with zener diode')
