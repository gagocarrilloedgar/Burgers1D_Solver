%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Euler
% Description
% Euler time scheme integration
%
% Inputs
% C: Convective term at n time step
% D: Diffusive term at n time step
% u: velocity value a k mode
% dt: time step
%
% Outputs
% x: variable at n+1 time step
%
%% CODE
function x = Euler(D,C,dt,u)

x = u - dt*(D+C);
end