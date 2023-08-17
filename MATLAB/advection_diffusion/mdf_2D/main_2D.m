clear, close all 

d = inputs;
dimension_number_of_points = 100;

mp = mesh_points(dimension_number_of_points);

[mp.x_number_of_points, mp.y_number_of_points, mp.t_number_of_points]
% 251 251 1001 demora ~4,5 minutos

concentration_per_volume = zeros(mp.x_number_of_points, mp.y_number_of_points, mp.t_number_of_points);
concentration_per_volume(d.source_x, d.source_y, :) = d.C_x1;

concentration = mdf_explicit_2D(concentration_per_volume, mp, true);

for t = 1:mp.t_number_of_points
    % h = contourf(mp.x_grid, mp.y_grid, concentration(:,:,t));
    
    surf(mp.x_grid, mp.y_grid, concentration(:,:,t))
    view(0,50);
    zlim([0,d.C_x1]);
    xlim([0,d.total_distance]);
    ylim([0,d.total_distance]);

    xlabel('Distância (m)'); 
    ylabel('Distância (m)'); 
    zlabel('Concentração (Bq/m³)');

    colorbar
    clim([0 d.C_x1]);
    clim([0 d.C_x1]);

    pause(.05)
    
end