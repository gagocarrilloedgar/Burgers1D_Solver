

%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%
%% Core of the program
% DESCRIPTION
% Euler time integration scheme computation
%
% INPUTS
% C = Convective term, n step
% D = Convective term, n step
% u = Velocity at the n step for th k mode
% dt = time step
%
% OUTPUT
%
% x = Result of the Euler scheme for the 
% n+1 time step
%
%% Code

function x = Euler(D,C,dt,u)

x = u - dt*(D+C);
end
