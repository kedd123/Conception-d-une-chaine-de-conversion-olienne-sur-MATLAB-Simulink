%% =========================================================
%  Initialisation paramètres - Éolienne PMSG
% =========================================================
clear; clc;

%% ----------------- Turbine -----------------
R    = 3.96;                 % Rayon des pales (m)
S    = pi * R^2;             % Surface balayée (m^2)
rho  = 1.225;                % Masse volumique de l'air (kg/m^3)
beta = 0;                    % Angle de pas (deg)

%% Coefficients Cp (modèle aérodynamique)
A1 = 0.548;   
A2 = 116;    
A3 = 0.4;
A4 = 5;      
A5 = -21;    
A6 = 0.0068;

%% ----------------- Multiplicateur -----------------
G = 6.24;                    % Rapport de transmission

%% ----------------- Simulation -----------------
Ts = 1e-6;                   % Pas d’échantillonnage
Fc = 8000;                   % Fréquence PWM (Hz)

%% ----------------- PMSG -----------------
P_nom = 25000;               % Puissance nominale (W)
F     = 4.924e-4;            % Frottement visqueux (N.m.s/rad)
J_PMSG = 0.2227;             % Inertie (kg.m^2)

Rs    = 0.0485;              % Résistance statorique (Ohm)
Ls    = 3.95e-4;             % Inductance statorique (H)
Phi_r = 0.1194;              % Flux rotorique (Wb)
p     = 4;                   % Paires de pôles

J = J_PMSG;

%% Constante de couple
Kt = 1.5 * p * Phi_r;

%% ----------------- Commande redresseur -----------------
% Boucle courant d-axis
kp_isd = 2.75;    
ki_isd = 13800;
Id_ref = 0;

% Boucle courant q-axis
kp_isq = kp_isd;   
ki_isq = ki_isd;

%% Boucle de vitesse
kp_omega = 3.108; 
ki_omega = 0.6873;
Omega_ref = 157;              % rad/s

%% Feedforward
Gain_FF_Torque = 1 / Kt;
Gain_FF_Accel  = J_PMSG / Kt;

%% ----------------- Bus DC -----------------
C_dc = 4.5e-3;                % Capacité DC (F)

Vdc_ref = 700;                % Tension DC de référence (V)
W_vdc   = 80;                 % Pulsation boucle Vdc (rad/s)

kp_vdc = 2 * C_dc * W_vdc;
ki_vdc = C_dc * W_vdc^2;

%% ----------------- Côté réseau -----------------
% Boucle courant Id
kp_id_grid = 4.5;
ki_id_grid = 225;
id_grid_ref = 0;

% Boucle courant Iq
kp_iq_grid = kp_id_grid;
ki_iq_grid = ki_id_grid;

%% Boucle puissance réactive (Q)
kp_Q = 5e-4;
ki_Q = 0.05;

%% PLL
kp_PLL = 180;   
ki_PLL = 3200;

%% Filtre onduleur
Lf = 8e-3;    
Rf = 0.15;

%% Réseau triphasé
U = 400;                     % Tension ligne-ligne (V)
f = 50;                      % Fréquence réseau (Hz)

disp('>> Paramètres Simulink chargés avec succès');
