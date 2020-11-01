%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% AdamBashforth
% Description
% AdamBashforth time scheme integration
%
% Inputs
% C: Convective term at n time step
% C: Convective term at n-1 time step
% D: Diffusive term at n time step
% D: Diffusive term at n-1 time step
% u: velocity value a k mode
% dt: time step
%
% Outputs
% x: variable at n+1 time step
%
%% CODE

function x = AdamBashforth(C,C_,D,D_,u,dt)
c1 = 3/2;
c2 = 1/2;

x = u + dt*(-c1*(C+D) + c2*(C_+D_));
 
end