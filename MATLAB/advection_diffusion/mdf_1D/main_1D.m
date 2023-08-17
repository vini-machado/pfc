clear, close all 

d = inputs;

dimension_number_of_points = 500;
is_stochastic              = true;

[concentration_per_volume, mp] = concentration_1D(d, dimension_number_of_points);

plot_1D(d, mp, concentration_per_volume)