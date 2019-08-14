# NC-Network-of-LIF-Neurons-Coupled-by-Electrical-Synapses

This program creates a network of n LIF neurons coupled by electrical synapses. It solves the following equation to pursue 
the dynamics of each neuron's sub-threshold membrane potential:

<img src="https://latex.codecogs.com/svg.latex?\Large&space;\tau\dot{v}=-(v-v_{rest})+I_{ext}-I_{synps}," title="LIF Formula" />

where v is the potential of post synaptic neuron, v_rest is the resting potential, I _ext is external input to the 
post-synaptic neuron 
which can be a representative of a sensory stimulus or an accumulative activity of population of surrounding neurons, 
and I_synps is the synaptic input 
from the neighbour neurons in the network. It is calculated using 

<img src="https://latex.codecogs.com/svg.latex?\Large&space;I_{synps}=(v_{post}-v_{pre})*g_{post,pre}," title="LIF Formula" />

where g is conductivity coefficient of the synapse.

In the output, you can find the membrane potential of all the neurons as well as the
raster plot of their spiking activity.
