%% Boost Converter
% given parameters
Trise = 190*10^(-6);
Tfall = 10*10^(-6);
Vomin = 0.5;
Vomax = 3.6;
deltaVo = Vomax-Vomin;
Vo = (Vomax+Vomin)/2;
R = 100;
T = Trise+Tfall;
f = 1/T;
D = Trise/T;
Vi = Vo/D;
Io = Vo/R;
Iin = D*Io;
L = (1-D)*R/(2*f);


%%

% calculated boundry values
Rmax = Vo^2/Po_min;
Rmin = Vo^2/Po_max;

Dmin = (Vo - Vi_max)/Vo;
Dmax = (Vo - Vi_min)/Vo;

% values calculated for Ideal Model 
Lcr = (Rmax*(1-Dopt)^2*Dopt)/(2*f); 
L = 2*Lcr;
C = Dmax*Vo/(Rmin*f*deltaVo);

% values found for parasitic elements
Vd = 0.752;
Rd = 0.0325;
Rds = 0.18;
R = 7.2;
RL = 0.1;
D = 0:0.001:1;


Vo = zeros(5,1001);
i = 5:9;
for n = 1:5
    for d = 1:1001
        Vi=i(1,n);
        Von=(Vi-(1-D(1,d))*Vd)/((1-D(1,d))+(D(1,d)/D(1,d))*(Rds/R)+(1/(1-D(1,d)))*(RL/R)+(Rd/R));
        Vo(n,d) = Von;
    end
end

% visual reffernce for specified output voltage
desiredVo = 12.*(ones(1,1001));

% all curves plotted together in one figure
figure
plot(D(1,:),Vo(1,:),D(1,:),desiredVo(1,:),D(1,:),Vo(2,:),D(1,:),Vo(3,:),D(1,:),Vo(4,:),D(1,:),Vo(5,:)), grid
title('D vs. Vo -> Vin = 5 - 9 V'); xlabel('D'); ylabel('Vo V');
axis([0,1,4,34]);


% multiple individual plots - not easy to make correlations

% figure
% subplot(2,3,1)
% plot(D(1,:), Vo(1,:)), grid
% title('D vs. Vo -> Vin = 5 V'); xlabel('D'); ylabel('Vo V');
% axis([0.25,1,5,20]);
% 
% subplot(2,3,2)
% plot(D(1,:), Vo(2,:)), grid
% title('D vs. Vo -> Vin = 6 V'); xlabel('D'); ylabel('Vo V');
% axis([0.25,1,5,20]);
% 
% subplot(2,3,3)
% plot(D(1,:), Vo(3,:)), grid
% title('D vs. Vo -> Vin = 7 V'); xlabel('D'); ylabel('Vo V');
% axis([0.25,1,5,20]);
% 
% subplot(2,3,4)
% plot(D(1,:), Vo(4,:)), grid
% title('D vs. Vo -> Vin = 8 V'); xlabel('D'); ylabel('Vo V');
% axis([0.25,1,5,20]);
% 
% subplot(2,3,5)
% plot(D(1,:), Vo(5,:)), grid
% title('D vs. Vo -> Vin = 9 V'); xlabel('D'); ylabel('Vo V');
% axis([0.25,1,5,20]);

%% Non-Ideal
% Values used
Vin = 5;
Vd = 0.752;
Rd = 0.0325;
Rds = 0.18;
R = 7.2;
RL = 0.1;
D = 0:0.001:1;

% for a linear plot, creading arrays corresponding to D
Vo = zeros(1,1001);
Po = zeros(1,1001);
IL = zeros(1,1001);
Ploss = zeros(1,1001);
eta = zeros(1,1001);
eff = zeros(1,1001);

% temp variables used
% (because I'm lazy and didn't want to do matrix operations)
TempPo = 0;
TempIL = 0;
TempPloss = 0;
Tempeff = 0;
n = 0;
Von = 0;
% Calculating efficiency as a function of duty cycle for the chosen
% values
for d = 1:1001
    n = d;
    % contionals used to avoid division by 0
    % i.e. for initial val of 0, or final values 1-D when D=1
    if d > 1
        Von=(Vin-(1-D(1,d))*Vd)/((1-D(1,d))+(D(1,d)/D(1,d))*(Rds/R)+(1/(1-D(1,d)))*(RL/R)+(Rd/R));
        TempPo = (Von^2)/R;
        Po(n) = TempPo;
        TempIL = (Von/R)/(1-D(1,d));
        IL(n) = TempIL;
        TempPloss = (TempIL^2)*RL;
        Ploss(n) = TempPloss;
        Tempeff = TempPo/(TempPo + TempPloss);
        eff(n) = Tempeff;
    end
    if d > 1000
        TempPo = (Von^2)/R;
        Po(n) = TempPo;
        TempIL = (Von/R);
        IL(n) = TempIL;
        TempPloss = (TempIL^2)*RL;
        Ploss(n) = TempPloss;
        Tempeff = TempPo/(TempPo + TempPloss);
        eff(n) = Tempeff;
    end
    Vo(1,d) = Von;
    eta(1,d) = Tempeff;
end

% lines plotted to provide reference, visusly see efficiency of
% benchmark Po
Po5 = 0.972436604189636*ones(1,1001);
Po10 = 0.945105351613398*ones(1,1001);
Po15 = 0.915134620254583*ones(1,1001);
Po20 = 0.882514490662722*ones(1,1001);

% plot all elements, lable axis, title, and legend
figure
plot(D(1,:),eta(1,:),':.black',D(1,:),Po5(1,:),'-g',D(1,:),Po10(1,:),'-b',D(1,:),Po15(1,:),'-y',D(1,:),Po20(1,:),'-r','Linewidth',1),grid on, grid minor;
title({'Efficiency \eta vs. D'},'FontSize',12,'FontWeight','Bold'); 
xlabel({'Duty Cycle'},'FontSize',12,'FontWeight','Bold'); 
ylabel({'Efficiency \eta'},'FontSize',12,'FontWeight','Bold');
legend({'\eta','Po = 5','Po = 10','Po = 15','Po = 20'},'Location','southwest','FontSize',12,'FontWeight','Bold')
axis([0,1,0.75,1]);
