clear, close all 

d = inputs;

dimension_number_of_points = 100;
is_stochastic              = true;

[concentration_per_volume, mp] = concentration_2D(d, dimension_number_of_points);

plot_2D(d, mp, concentration_per_volume)