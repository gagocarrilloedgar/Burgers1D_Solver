%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Convection
% Description
% Computes the convective term of the equation
%
% Inputs
% N: Mesh size
% k: mode
% u: velocity field
%
% Outputs
% C: Convective term 
%
%% CODE

function [C] = Convection(k,N,u)

C = 0;                              % Initialization value

for p=-N+k:N
    q = k-p;
    
   % Spatial Discretization Conditions
   if q ~= 0 && p ~= 0                  % Condition 1
       
        if q < 0                        % Condition 2                    
            u_q = conj(u(-q));
        else                        
            u_q = u(q);
        end
        
        if p < 0                        % Condition 3
            u_p = conj(u(-p));
        else
            u_p = u(p);
        end
        
        C = C +  u_p * q * 1i * u_q;    % Convective
   end
end

end