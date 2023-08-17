function [] = plot_1D(mp, concentration_per_volume, total_distance)
    space = 0:mp.delta_x:total_distance;

    j = 1;
    while j <= mp.t_number_of_points
        figure(1);
        plot(space,concentration_per_volume(:,j), 'r--o','LineWidth',1.5);
        % plot(space,concentration_per_volume(:,j), 'r--o', space,concentration_per_volume(:,j), 'k','LineWidth',1.5);
        
    
        grid; 
        xlabel('Distância (m)'); 
        ylabel('Concentração (Bq/m³)');
        title('Solução');
        j = j+1;
    end

end