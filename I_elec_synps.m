function I_synps = I_elec_synps(j,tStep, g, V)
    
%     n = size(g,1);
%     I_synps =0;
    
%     for k = 1:n
%         I_synps = I_synps + g(j,k) * ( V(tStep,j) - V(tStep,k) );
%     end
    I_synps = ( V(tStep,j) - V(tStep,:) )  .* g(j,:) ;
    I_synps = sum (I_synps,2);
end

