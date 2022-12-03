clc;clear all; format compact; close all;
s = tf('s');z = tf('z');Dc = 5/(s+5);Ts = 1/3;Fs = 1/Ts;
zoh_Dz = c2d(Dc,Ts,'zoh');
MMPZ_Dz = c2d(Dc,Ts,'matched');
MPZ_Dz = (1-exp(-5*Ts))/2 * (1+z^-1) / (1- exp(-5*Ts)*z^-1)
[num,den] = tfdata(MPZ_Dz)
MPZ_Dz = tf(num,den,Ts,"Variable","z^-1")
tustin_Dz = c2d(Dc,Ts,'tustin');
w = 0:Fs/1000*2*pi:Fs*2*pi*3.5
[mag,phase,w]=bode(Dc,w);hold on;
[mag,phase,w]=reshape_data(mag,phase,w);
[zoh_mag,zoh_phase,zoh_w]=bode(zoh_Dz,w);hold on;
[zoh_mag,zoh_phase,zoh_w]=reshape_data(zoh_mag,zoh_phase,zoh_w);
[MMPZ_mag,MMPZ_phase,MMPZ_w]=bode(MMPZ_Dz,w);hold on;
[MMPZ_mag,MMPZ_phase,MMPZ_w]=reshape_data(MMPZ_mag,MMPZ_phase,MMPZ_w);
[tustin_mag,tustin_phase,tustin_w]=bode(tustin_Dz,w);hold on;
[tustin_mag,tustin_phase,tustin_w]=reshape_data(tustin_mag,tustin_phase,tustin_w);
[MPZ_mag,MPZ_phase,MPZ_w]=bode(MPZ_Dz,w);hold on;
[MPZ_mag,MPZ_phase,MPZ_w]=reshape_data(MPZ_mag,MPZ_phase,MPZ_w);
plot(w,mag);
close all;
figure(1)

subplot(4,1,1)
plot([w, -w],[mag,mag],'r');
hold on;
grid on;
plot([zoh_w,-zoh_w],[zoh_mag,zoh_mag],'b--');
plot([tustin_w,-tustin_w],[tustin_mag,tustin_mag],'b--');
freq_line = -3:0.5:3;
freq_line = freq_line*Fs*2*pi;
xline(freq_line)
xticks(freq_line)
xlim([-Fs*2*pi*3.5 Fs*2*pi*3.5])

subplot(4,1,2)
plot([w, -w],[mag,mag],'r');
hold on;
grid on;
% plot([zoh_w,-zoh_w],[zoh_mag,zoh_mag],'b--');
% plot([tustin_w,-tustin_w],[tustin_mag,tustin_mag],'b--');
plot([MMPZ_w,-MMPZ_w],[MMPZ_mag,MMPZ_mag],'b:');
plot([MPZ_w,-MPZ_w],[MPZ_mag,MPZ_mag],'b:');
freq_line = -3:0.5:3;
freq_line = freq_line*Fs*2*pi;
xline(freq_line)
xticks(freq_line)
xlim([-Fs*2*pi*3.5 Fs*2*pi*3.5])

subplot(4,1,3)
loglog([w, -w],[mag,mag],'r');
hold on;
grid on;
loglog([zoh_w,-zoh_w],[zoh_mag,zoh_mag],'b--');
loglog([tustin_w,-tustin_w],[tustin_mag,tustin_mag],'b--');
xline(freq_line)
yline(1/sqrt(2))
xlim([0 Fs*2*pi*3.5])
ylim([1/100  1])
subplot(4,1,4)
loglog([w, -w],[mag,mag],'r');
hold on;
grid on;
% loglog([zoh_w,-zoh_w],[zoh_mag,zoh_mag],'b--');
% loglog([tustin_w,-tustin_w],[tustin_mag,tustin_mag],'b--');
loglog([MMPZ_w,-MMPZ_w],[MMPZ_mag,MMPZ_mag],'b:');
loglog([MPZ_w,-MPZ_w],[MPZ_mag,MPZ_mag],'b:');
xline(freq_line)
xlim([0 Fs*2*pi*3.5])
ylim([1/100  1])
function [mag,phase,w]=reshape_data(mag,phase,w)
    mag = reshape(mag,[],1);
    phase = reshape(phase,[],1);
    w = reshape(w,[],1);
end