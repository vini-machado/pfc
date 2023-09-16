function [] = arrows(wind_field, max_concentration, time_step, d, mp)

    time_cycle      = floor(mp.t_number_of_points/d.wind_changes);
    wind_field_line = floor(time_step/time_cycle) +1;

    
    
    ARROW_SCALE = 100;
    quiver3(1, 1, max_concentration, d.permanent_wind_velocity_x, d.permanent_wind_velocity_y, 0, ARROW_SCALE, 'k--')
    
    if d.is_stochastic
        u_x =  wind_field(wind_field_line, 1);
        u_y =  wind_field(wind_field_line, 2);
        quiver3(1, 1, max_concentration, u_x , u_y , 0, ARROW_SCALE, 'b-') 
    end
end