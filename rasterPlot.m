function rasterPlot(spike_train,T,no_neurons)

a = find(spike_train(:,1));
scatter(T(a,1),zeros(length(a),1)+1,'.')

hold on

for i=2:no_neurons
    a = find(spike_train(:,i));
    scatter(T(a,i),zeros(length(a),1)+i,'.')
end

ylim([0,no_neurons])
set(gca,'ytick',0:no_neurons)
title('Raster Plot')
xlabel('Time')
ylabel('Neuron Number')

end

