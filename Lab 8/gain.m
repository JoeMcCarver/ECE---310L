g = xlsread('10-100k.xlsx',1,'F2:F24');
freq = xlsread('10-100k.xlsx',1,'A2:A24');
phase = xlsread('10-100k.xlsx',1,'D2:D24');
loglog(freq,g)

grid on
xlabel('Gain')
ylabel('Frequency')
figure
loglog(freq,phase,'.-')
grid on
xlabel('phase')
ylabel('Frequency')