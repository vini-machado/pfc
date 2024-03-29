clf, clear, close all

d = inputs;
len = length(d.number_of_points_array);

for i = 1:len
    number_of_points = d.number_of_points_array(i);
    
    if d.spacial_dimensions == 1
        tic
        [concentration_i, effective_dose_i, mp] = concentration_1D(d, number_of_points, 'explicit');
        toc

        % plot_1D(d, mp, concentration_i, effective_dose_i);
    else
        tic
        [concentration_i, effective_dose_i, wind_field_i, mp] = concentration_2D(d, number_of_points);
        toc

        plot_2D(d, mp, concentration_i, effective_dose_i, wind_field_i);
    end
end
