%% Burgers equation
% Author:Gago, Edgar
% Date 28/10/2020
% Subject: Computational engineering
%
%% Solver
% Description
% Time integration solver, computes the velocity in each mode and time step
%
% Inputs
% N: Mesh size
% Re: Reynolds number
% Ct: Time step constant
% delta: minimum admissible error
% ops: Integration scheme  and LES selector
% Dt: time step
% a: control variable for a special case scenario (see inputs)
% u: initialised velocity vector
% ck: Kolmogrov constant
%
% Outputs
% u: final velocity vector
% it: number of iterations
% time: computational time
%
%% CODE

function [u,it,time] = Solver(Dt,delta,u,N,Re,ops,ck,a)

it = 1;                                   % Iteration initializaion
diff = 1;                                 % Error initialization

% %Unncomment in order to change LES and ck initial options
% if a == 2 || a == 3
%        ops.LES = 1;
%     ops.SCH ="Euler";
%     if a == 3
%         ck = 0.05;
%     end
% end
tic;
while diff>delta
    
    for k=1:N
        u_n = u(k,it);
        C(it) = Convection(k,N,u(:,it));
        D(it) = Difussive(u_n,Re,k,ops.LES,2,ck,N,u(N,it));
        
        
        if ops.SCH == "Euler"
            u(k,it+1) = Euler(D(it),C(it),Dt,u_n);
        else
            if it ==1
                u(k,it+1) = AdamBashforth(C(it),C(it),D(it),D(it),u_n,Dt);
            else
                u(k,it+1) = AdamBashforth(C(it),C(it-1),D(it),D(it-1),u_n,Dt);
            end
        end
        
        u(1,it+1) = 1;
    end
    
    diff = max(max(abs(u(:,it+1)-u(:,it))));
    
    it = it+1;
    
    if(it>12000)
        fprintf("Process exceed 10000 iterations");
        time = toc;
        break;
    end
    
end

time = toc;
end