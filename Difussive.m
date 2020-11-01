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