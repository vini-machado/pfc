function [delta_t, t_vector, t_number_of_points] = time(t_length, delta_x, courant, wind_velocity)
%time - Description
%
% Syntax: delta_t, t_vector, t_number_of_points = time(delta_x, courant, velocity)
%
% Long description
    delta_t  = courant*delta_x/wind_velocity;
    t_number_of_points = int16(t_length/delta_t + 1);
    t_vector = linspace(0, t_length, t_number_of_points);
end