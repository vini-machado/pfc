function max_concentration = concentration_plot(concentration_per_volume, time_step, min_concentration_threshold, d, mp)
    max_concentration = max(concentration_per_volume, [], 'all');

    surf(mp.x_grid, mp.y_grid, concentration_per_volume(:,:,time_step));
        
    set(gca,'ColorScale','log');
    shading interp

    view(2);
    % zlim([0,d.C_x1]);
    xlim([0,d.total_distance]);
    ylim([0,d.total_distance]);

    xlabel('Distância (m)'); 
    ylabel('Distância (m)'); 
    zlabel('Concentração (Bq/m³)');

    % title("Concentração (Bq/m³)");

    colormap(custom_gray)
    cl = colorbar;

    concentration_ticks = colorbar_ticks(min_concentration_threshold, max_concentration);
    cl.Ticks = concentration_ticks;
    cl.TickLabels = num2cell(concentration_ticks);

    clim([min_concentration_threshold max_concentration]);
end