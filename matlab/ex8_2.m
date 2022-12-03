clc;clear all; format compact; close all;
s=tf('s');
Dc = 10*(s/2+1)/(s/10+1)
Ts = 0.025;
Dz = c2d(Dc,Ts,'matched');
[num,den]=tfdata(Dz);
matched_Dz = tf(num,den,Ts,"Variable","z^-1")
figure(1)
step(Dc);
hold on;
step(matched_Dz)

s=tf('s');
Dc = 10*(s/2+1)/(s/10+1)
Ts = 0.025;
Dz = c2d(Dc,Ts,'zoh');
[num,den]=tfdata(Dz);
zoh_Dz = tf(num,den,Ts,"Variable","z^-1")
figure(1)
hold on;
step(zoh_Dz)

s=tf('s');
Dc = 10*(s/2+1)/(s/10+1)
Ts = 0.025;
tustin_Dz = c2d(Dc,Ts,'tustin');
[num,den]=tfdata(Dz);
Dz = tf(num,den,Ts,"Variable","z^-1")
figure(1)
hold on;
step(tustin_Dz)