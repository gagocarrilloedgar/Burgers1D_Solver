%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% ComputeDiffusive
% Description
% Core of the porgram, calls the different main scripts
%
% Inputs
%
% Outputs
%
%
%% CODE

% C: Convective term at n time step
% C: Convective term at n-1 time step
% D: Diffusive term at n time step
% D: Diffusive term at n-1 time step
% u: velocity value a k mode
% dt: time step
% x: variable at n+1 time step
% Ek_save: matrix of the energy interchanges on each mode
% it_: matrix saving each case scenario iterations
% time_: matrix saving each case scenario computational time
% N: Mesh size
% Re: Reynolds number
% ops: Integration scheme  and LES selector
% Ct: Time step constant
% delta: minimum admissible error
% ck: Kolmogrov constant
% k: modes
