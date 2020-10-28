
%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%
%% Core of the program
% DESCRIPTION
% Postprocess of the results
%
% INPUTS
% Ek_save = Total energy  saved from the different
% case studies
% Re = Range of the used Re
% N = Range of the used modes
% Ct = Range of time integrations steps
%
%% Code

function PostProcess(Ek_save, N,Re,Ct)

set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultaxesticklabelinterpreter','latex');
set(groot,'defaultlegendinterpreter','latex');



%% Previous calculations
for i=1:numel(N)
    for j=1:numel(Re)
        it = size((Ek_save{i,j}),2);
        for t=1:it   
            %Energy sum
            Tot_Ek(i,j,t) = sum(Ek_save{i,j}(:,t));
        end
    end
end

h2=figure(2);
loglog(1:100, (1:100).^(-2), '--k'); hold on;
for i=1:length(N)
    for j=1:numel(Ct)
        it = size((Ek_save{i,j}),2);
        loglog(1:N(i),Ek_save{i,j}(:,it));
        xlabel('Wave number ($k$)');
        ylabel('Energy Spectrum $E_k$');
        grid on
    end
end

% legend("slope=-2",sprintf('$N = %d $ DNS', N(1)),...
%     sprintf('$N = %d $ LES, ck = %.4f', N(2),0.4223) , ...
%     sprintf('$N = %d $ LES, ck = %.2f', N(3),0.05),...
%     sprintf('$N = %d $ DNS', N(4)));

% legend("slope=-2", ...
%     sprintf('$N = %d $ DNS, Re = %d', N(1), Re(1)),...
%     sprintf('$N = %d $ DNS, Re = %d', N(1), Re(2)),...
%     sprintf('$N = %d $ DNS, Re = %d', N(1), Re(3)),...
%       "location","southwest");

% legend("slope=-2", ...
%     sprintf('$N = %d $ DNS, Adam-Bashforth Scheme', N(1)),...
%     sprintf('$N = %d $ DNS, Euler Scheme', N(2)),...
%       "location","southwest");

legend("slope=-2", ...
    sprintf('$N = %d $ DNS, ct = %.f', N(1),Ct(1)),...
    sprintf('$N = %d $ DNS, ct = %.2f', N(1),Ct(2)),...
    sprintf('$N = %d $ DNS, ct = %.3f', N(1),Ct(2)),...
      "location","southwest");


%% Plot Storage
pathh     = pwd;
mkdir Images
myfolder = 'Images';

f = fullfile(pathh , myfolder, 'EnergySpectrum.png');
saveas(h2,f);

end
