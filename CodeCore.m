
%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%
%% Core of the program
% DESCRIPTION
% Evalutaion of the SOlver for different parameters
% such as N, Re, and Ct
%
% INPUTS
% N = Range of N (modes) to evaluate
% Re = Range of Re number to evaluate
% delta = Convective term, n steps to evaluate
% Ct = Range of Time step constant
% ck = Kolmogrovs constant
% ops = time step
%
% OUTPUT
%
% Ek_save = Total energy matrices per mode, Re and CT
% it_ = Number of iteration per mode, Re and CT
% time_ = Time for computing each Ek per mode, Re and CT
%
%% Code

function [Ek_save,it_,time_] = CodeCore(N,Re,delta,Ct,ck,ops)


%Iterate over cases inside N
for i = 1:numel(N)
    for j = 1:numel(Re)
        for x = 1:numel(Ct)
            n = N(i);
            Re_ = Re(j);
            ct = Ct(x);
            
            Dt = (ct*Re_) / n^2;
            
            %Velocity initialization
            u = 1./(1:1:n)';
            
            % SOLVER
            [u,it,time] = Solver(Dt,delta,u,n,Re_,ops,ck,i);
            
            % ENERGY SPECTRUM
            Ek =conj(u).*u;
            
            % Iterations trhought different Re, Ck & N values
            Ek_save{i,j,x} = Ek;
            it_(i,j,x) = it;
            time_(i,j,x) = time;
        end
    end
    
end
