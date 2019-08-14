
%This program creates a network of n LIF neurons coupled by
%electrical synapses. It solves the following equation to pursue the dynamics
%of each neuron's sub-threshold membrane potential:
%          tau * v_dot = -(v - v_rest) + I_ext - I_synps,
%
%where v is the potential of post synaptic neuron, v_rest is the resting
%potential, I _ext is external input to the neuron which could be from 
%a sensory stimulus or the cumulative activity of neurons around, and
%I_synps is the synaptic input from the neighbour neurons in the network. It
%is calculated using 
%          I_synps = ( V_post - V_pre ) * g_post,pre;
%
%where g is conductivity coefficient of the synapses.
%Since an LIF neuron just depicts the dynamics of sub-threshold membrane 
%potential, this model cannot show the urge of ions during action
%potential.
%Setting the values of g, tau, and V0 in different fashions or randomly 
%results in various fascinating patterns of activity for even a network 
%made up of three neurons.
%In the output, the membrane potential of all the neurons as well as the
%raster plot of their spiking activity is presented.


close all; clc; clear all

v_th = -65;
I_ext = 5.5;
v_a0 = -66;
v_b0 = -70;
dt = .01;
v_rest = -70;
spk_pick= 40;
t_f = 150;
no_neurons = 3;
g = (rand (no_neurons,no_neurons) *.1);
g = g - diag(diag(g));
%g=[0,2; 0,0];
tau = rand (no_neurons,1)*10; 
%tau = [1,1.4];

n_tSteps = t_f/dt +1;
V = zeros(n_tSteps,no_neurons);
V(1,1:no_neurons) = rand(1,no_neurons)*4 +v_rest;
%V(1,1:2) = [v_a0,v_b0];

spike_train = zeros(n_tSteps,no_neurons);
T = zeros(n_tSteps,no_neurons);


for tStep=1:n_tSteps -1
    
    
    for j=1:no_neurons
        I_synps = I_elec_synps(j,tStep, g, V);
        v_a1 = V(tStep,j);  
        [v_a2,spk] = LIF_ODE(v_th,v_rest, tau(j), dt, I_ext, I_synps, v_a1);
        T(tStep+1,j) = T(tStep,j)+dt;
        V(tStep+1,j) = v_a2;
        if spk == true
            spike_train(tStep+1,j) = 1;
        end
        v_a1 = v_a2;
    end    
    
  
end


figure(1);   
plot(T,V)
title('Membrane Dynamics')
xlabel('Time')
ylabel('V')

% figure (2)
% plot (T,spike_train)
% title('Spike Train')

figure(3)
rasterPlot(spike_train,T,no_neurons)
