%% ECE 310L - Lab 5

clc
clear all

NMOS_27 = csvread('n_vg_27.csv',0,0);

Vd = NMOS_27(:,1);
Vs1 = NMOS_27(:,2);

NMOS_32 = csvread('n_vg_32.csv',0,0);

Vs2 = NMOS_32(:,2);

NMOS_37 = csvread('n_vg_37.csv',0,0);

Vs3 = NMOS_37(:,2);

NMOS_42 = csvread('n_vg_42.csv',0,0);

Vs4 = NMOS_42(:,2);



Vs = [Vs1';Vs2';Vs3';Vs4']./10;
Id = 0.5:0.5:10;

% xmin = 0.1; xmax = 0.42; ymin = 0; ymax = .16;

figure
plot(Id,Vs(1,:),Id,Vs(2,:),Id,Vs(3,:),Id,Vs(4,:)), grid

% figure
% for i=1:4
%     subplot(4,1,i)
% %     waterfall(Id,Vs(i,:)), grid
%     plot(Vs(i,:),Id), grid
%     title(sprintf('Id_%d(t) vs Vs_%d(t)',i,i))
% %     axis([xmin xmax ymin ymax])
% end
% rotate3d

% NMOS = [NMOS_27(:,1)./10,NMOS_27(:,2),NMOS_32(:,2),NMOS_37(:,2),NMOS_42(:,2)];

% figure
% plot(NMOS), rotate3d
% 
% figure
% scatter(NMOS), rotate3d
% 
% figure
% stem(NMOS), rotate3d
% 
% figure
% stairs(NMOS), rotate3d
% 
% figure
% rectangle(NMOS), rotate3d
% 
% figure
% fill(NMOS), rotate3d
% 
% figure
% compass(NMOS), rotate3d
% 
% figure
% feather(NMOS), rotate3d

% figure
% comet(NMOS), rotate3d
% title('Comet')
% 
% figure
% area(NMOS), rotate3d
% title('Area')
% 
% figure
% ribbon(NMOS), rotate3d
% title('Ribbon')

% figure
% mesh(NMOS), rotate3d
% title('Mesh')

% 
% figure
% waterfall(NMOS'), rotate3d
% title('Waterfall')


