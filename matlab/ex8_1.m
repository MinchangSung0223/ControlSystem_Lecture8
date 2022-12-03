clc;clear all; format compact; close all;
s=tf('s');
Dc = 10*(s/2+1)/(s/10+1)
Ts = 0.025;
Dz = c2d(Dc,Ts,'tustin');
[num,den]=tfdata(Dz);
Dz = tf(num,den,Ts,"Variable","z^-1")
figure(1)
step(Dc);
hold on;
step(Dz);