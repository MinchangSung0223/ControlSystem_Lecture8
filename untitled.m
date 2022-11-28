Fs = 42000 ;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
t = 0:T:1;        % Time vector
S = sin(2*pi*19000*t);
plot(t,S)
sound(S,Fs)