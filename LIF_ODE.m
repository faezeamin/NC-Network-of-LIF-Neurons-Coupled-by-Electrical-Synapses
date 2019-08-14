function [v_a2,spk] = LIF_ODE(v_th,v_rest, tau, dt, I_ext, I_synps, v_a1)

    v_a2 = v_a1 + dt/tau * (-(v_a1 - v_rest) + I_ext - I_synps);
    spk = false;
    if v_a2 >= v_th
        
        v_a2 = v_rest;
        spk = true;
        
    end
        
end

