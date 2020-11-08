%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% CodeCore
% Description
% Three fors in order to evaluate different case scenarios, save the matrix
% computed energy
%
% Inputs
% N: Mesh size
% Re: Reynolds number
% ops: Integration scheme selector
% Ct: Time step constant
% delta: minimum admissible error
% ck: Kolmogrov constant
%
% Outputs
% Ek_save: matrix of the energy interchanges on each mode
% it_: matrix saving each case scenario iterations
% time_: matrix saving each case scenario computational time
%
%% CODE
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