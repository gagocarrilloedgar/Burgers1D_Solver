
%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%
%% Core of the program
% DESCRIPTION
% AdamBashforth time integration scheme
%
% INPUTS
% C = Convective term, n step
% C_ = Convective term, n-1 step
% D = Convective term, n step
% D_ = Convective term, n step
% u = Velocity at the n step for th k mode
% dt = time step
%
% OUTPUT
%
% x = Solution of the AB scheme for the 
% n+1 time step
%
%% Code

function x = AdamBashforth(C,C_,D,D_,u,dt)
c1 = 3/2;
c2 = 1/2;

x = u + dt*(-c1*(C+D) + c2*(C_+D_));
 
end
