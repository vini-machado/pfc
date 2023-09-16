function [] = plot_2D(data_inputs, mp, concentration_per_volume, effective_dose, wind_field)
    d = data_inputs;

    MIN_DOSE_THRESHOLD = 1E-1;
    MIN_CONCENTRATION_THRESHOLD = 1E-3;

    full_size_window()
    for t = 1:mp.t_number_of_points
        tcl = tiledlayout(1,2);
        title(tcl,"Tempo de Simulação: " + num2str(mp.delta_t*t, 4) + " s")

        nexttile
        max_concentration = concentration_plot(concentration_per_volume, t, MIN_CONCENTRATION_THRESHOLD, d, mp);
        hold on 
        
        arrows(wind_field, max_concentration, t, d, mp)
        if d.is_stochastic
            legend('Concentração (Bq/m^3)', "Direção do vento Determinístico", "Direção do vento estocástico");
        else
            legend('Concentração (Bq/m^3)', "Direção do vento Determinístico");
        end

        hold off

        nexttile
        max_dose = dose_plot(effective_dose, t, MIN_DOSE_THRESHOLD, d, mp);
        hold on

        arrows(wind_field, max_dose, t, d, mp)
        if d.is_stochastic
            legend('Dose Efetiva Acumulada (mSv)', "Direção do vento Determinístico", "Direção do vento estocástico");
        else
            legend('Dose Efetiva Acumulada (mSv)', "Direção do vento Determinístico");
        end

        hold off

        pause(.05)    
    end
end