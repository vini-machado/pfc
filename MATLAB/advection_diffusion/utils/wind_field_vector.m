function wind_field = wind_field_vector
    d = inputs;

    if d.is_stochastic
        wind_field = ones(d.wind_changes + 1, 3);
    else
        wind_field = [0 0 1];
    end
    
    wind_field(:, 1) = d.permanent_wind_velocity_x;
    wind_field(:, 2) = d.permanent_wind_velocity_y;
end