function [delta, vector] = mesh_points(mesh_length, number_of_points)
%mesh_step - Description
%
% Syntax: delta = mesh_step(mesh_length, number_of_points)
%
% Long description

delta = mesh_length/(number_of_points - 1);
vector = 0 : delta : mesh_length;
    
end