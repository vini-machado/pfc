function [] = plot_2D(data_inputs, mp, concentration_per_volume)
    d = data_inputs;

    for t = 1:mp.t_number_of_points
        % h = contourf(mp.x_grid, mp.y_grid, concentration(:,:,t));
        
        surf(mp.x_grid, mp.y_grid, concentration_per_volume(:,:,t))
        view(0,50);
        zlim([0,d.C_x1]);
        xlim([0,d.total_distance]);
        ylim([0,d.total_distance]);
    
        xlabel('Distância (m)'); 
        ylabel('Distância (m)'); 
        zlabel('Concentração (Bq/m³)');

        title("Tempo de simulação " + num2str(mp.delta_t*t, 2) + " s");
    
        colorbar
        clim([0 d.C_x1]);
        clim([0 d.C_x1]);
    
        pause(.05)   
    end
end