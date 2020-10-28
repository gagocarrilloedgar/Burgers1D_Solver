%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%

%% Solving Parameters
N = 10:5:100;           % Levels for the summatory
Re = 10:2:50;                % Reynolds Number

%% Auxiliar Parameters
rho = 1;                % Fluid Density
mu = 2e-5;              % Fluid Viscosity
l = 1;
v0 = mu*Re/(rho*l);

%% Solver Parameters
delta = 1e-6;           %Convergence criteria
Ct    = [0.1];            % Time step compute constant

%% LES Modeling

ck = 0.4223; % Kolmogorov Constant
ops.LES = 1; % LES Solver selector
ops.SCH = "Euler"; % Time integration scheme


