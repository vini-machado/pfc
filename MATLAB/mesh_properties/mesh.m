function [x_vector, delta_x, y_vector, delta_y] = mesh(x_length, x_number_of_points, y_length, y_number_of_points)
%mesh_vector - Description
%
% Syntax: vector = mesh_vector(length, number_of_points)
%
% Long description
[delta_x, x_vector] = mesh_points(x_length, x_number_of_points);

if nargin > 2
    [delta_y, y_vector] = mesh_points(y_length, y_number_of_points);
end
