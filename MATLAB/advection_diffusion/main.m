clear, close all 

d = inputs;
len = length(d.number_of_points_array);

for i = 1:len
    number_of_points = d.number_of_points_array(i);
    
    if d.spacial_dimensions == 1
        [concentration_i, mp] = concentration_1D(d, number_of_points);
        plot_1D(d, mp, concentration_i);
    else
        [concentration_i, mp] = concentration_2D(d, number_of_points);
        plot_2D(d, mp, concentration_i);
    end
end
