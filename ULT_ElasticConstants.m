%% Auth: Arian Velayati, PhD
% The script can be used to find the ultrasonic elastic constants
...of the rock from s and p-wave traveling times

clc; close; clear;

%% Input

L = [18.745]; % Traveling Distance, mm
P = [2.55]; % Bulk Density, g/cc
Tp = [3.42]; % P-wave traveling time, us
Ts = [7.23]; % S-wave traveling time, us

%% Calculations

P = P*1000; % Density in kg/m3
Vp = (L/1000)/(Tp/1e6); % Compression wave velocity, m/s
Vs = (L/1000)/(Ts/1e6); % Shear wave velocity, m/s

E = (P*Vs^2*(3*Vp^2-4*Vs^2))/(Vp^2-Vs^2); % Young's Modulus
G = P*Vs^2; % Shear Modulus
v = (Vp^2-2*Vs^2)/(2*(Vp^2-Vs^2)); % Poisson ratio
k = P*(3*Vp^2-4*Vs^2)/3; % Bulk Modulus
E = E/1e9; G = G/1e9; k = k/1e9; % Units in GPa

%% Output
   T = table(E,G,v,k,'VariableNames',{'YM_GPa','SM_GPa','PR','BM_GPa'})
  
    writetable(T,'ULT_Moduli.csv')