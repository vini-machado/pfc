function [] = plot_2D(data_inputs, mp, concentration_per_volume, effective_dose)
    d = data_inputs;

    for t = 1:mp.t_number_of_points
        figure(1)
        % h = contourf(mp.x_grid, mp.y_grid, concentration_per_volume(:,:,t), 25);
        
        h = surf(mp.x_grid, mp.y_grid, concentration_per_volume(:,:,t));

        set(h,'linestyle','none');

        view(2);
        zlim([0,d.C_x1]);
        xlim([0,d.total_distance]);
        ylim([0,d.total_distance]);

        xlabel('Distância (m)'); 
        ylabel('Distância (m)'); 
        zlabel('Concentração (Bq/m³)');

        title("Tempo de simulação " + num2str(mp.delta_t*t, 2) + " s");
    
        colormap(hot)
        colorbar
        clim([0 d.C_x1]);

        figure(2)

        h1 = surf(mp.x_grid, mp.y_grid, effective_dose(:,:,t));

        set(h1,'linestyle','none');

        view(2);
        zlim([0,3]);
        xlim([0,d.total_distance]);
        ylim([0,d.total_distance]);

        xlabel('Distância (m)'); 
        ylabel('Distância (m)'); 
        zlabel('Dose Efetiva Acumulada (mSv)');

        title("Tempo de simulação " + num2str(mp.delta_t*t, 2) + " s");
    
        colormap(hot)
        colorbar
        % clim([0 3]);



        plot_darkmode
        % pause(.05)
    end
end