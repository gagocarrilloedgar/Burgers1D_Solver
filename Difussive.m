
%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%
%% Core of the program
% DESCRIPTION
% Computation of the Diffusive term
%
% INPUTS
% Re = Reynolds number
% k = Mode to evaluate
% u = velocity of the mode k and the time step i
% uf = velocity of the alst mdoe
% LES = logical operator to indicate the LES operation
% ck = Kolmogrovs' constat
% n = Total number of modes
% m = slope 
%
% OUTPUT
%
% D = Diffusive value for the mode k
%
%% Code

function D = Difussive(u,Re,k,LES,m,ck,n,uf)

if LES
   % Eddy-viscosity model
   v_inf = 0.31*((5-m)/(m+1))*sqrt(3-m)*ck^(-3/2);
   v_ = 1 + 34.5*exp(-3.03*n/k);
   %Cutoff energy
   E_kn = conj(uf)*uf;
   vt = v_inf*sqrt(E_kn/n)*v_;
else
    vt = 0;
end

D = (k^2) *(1/Re + vt)*u;

end
