%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Solving Parameters
N = 10:30:100;           % Levels for the summatory
Re = 10:10:50;                % Reynolds Number

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


