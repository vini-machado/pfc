function [] = plot_1D(data_inputs, mp, concentration_per_volume)
    d = data_inputs;
    space = 0:mp.delta_x:d.total_distance;

    j = 1;
    while j <= mp.t_number_of_points
        figure(1);
        plot(space,concentration_per_volume(:,j), 'r--o','LineWidth',1.5);
        ylim([0,d.C_x1]);
        grid; 

        xlabel('Distância (m)'); 
        ylabel('Concentração (Bq/m³)');
        title("Tempo de simulação " + num2str(mp.delta_t*j, 2) + " s");
        
        j = j+1;
    end

end