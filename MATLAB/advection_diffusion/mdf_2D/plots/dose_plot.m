function max_dose = dose_plot(effective_dose, time_step, min_dose_threshold, d, mp)
    max_dose = max(effective_dose, [], 'all');

    surf(mp.x_grid, mp.y_grid, effective_dose(:,:,time_step));

    set(gca,'ColorScale','log');
    shading interp

    view(2);
    % zlim([0,3]);
    xlim([0,d.total_distance]);
    ylim([0,d.total_distance]);

    xlabel('Distância (m)'); 
    ylabel('Distância (m)'); 
    zlabel('Dose Efetiva Acumulada (mSv)');

    % title("Dose Efetiva Acumulada (mSv)");

    colormap(custom_gray)
    cl = colorbar;

    dose_ticks = colorbar_ticks(min_dose_threshold, max_dose);
    cl.Ticks = dose_ticks;
    cl.TickLabels = num2cell(dose_ticks);

    clim([min(dose_ticks) max(dose_ticks)]);
    
end