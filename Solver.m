%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%
%% Core of the program
% DESCRIPTION
% Time integration solver for the differnt schemes 
% ans case studies
%
% N = Range of N (modes) to evaluate
% Re = Range of Re number to evaluate
% delta = Convective term, n steps to evaluate
% Ct = Range of Time step constant
% ck = Kolmogrovs constant
% ops = SCHEME & LES selector
% a = N selector
% u = initialized velocities
% delta = minimum allowed error
% Dt = time step
%
% OUTPUT
%
% u = Converged velocity (solution)
% it = Number of iterations of the mode
% time = Time of the process
%
%% Code

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
    
    
    if(it>12000)
        fprintf("Process exceed 10000 iterations");
        time = toc;
        break;
    end
    
    it = it+1;
    
end

time = toc;
end
