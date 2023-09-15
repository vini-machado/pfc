function [C, effective_dose, wind_field] = mdf_explicit_2D(concentration_per_volume, effective_dose, mesh_properties, is_stochastic)
    d = inputs;
    mp = mesh_properties;
    wind_field = wind_field_vector;

    noise_x = 0;
    noise_y = 0;

    wiener_x = 0;
    wiener_y = 0;

    time_cycle = floor(mp.t_number_of_points/d.wind_changes);

    if is_stochastic
        nd = normal_distribution;
        wiener_x = wiener_process('x', mp);
        wiener_y = wiener_process('y', mp);
    end

    for t = 1:mp.t_number_of_points
        if is_stochastic && rem(t,time_cycle) == 0
            noise_x = random(nd)*wiener_x;
            noise_y = random(nd)*wiener_y;
        end
        for i = 2:mp.x_number_of_points-1
            for j = 2:mp.y_number_of_points-1

                % advection_x = d.wind_field_x(i, t, noise_x)/d.total_distance * (concentration_per_volume(i+1, j, t)                                      - concentration_per_volume(i-1, j, t)) / (2*mp.delta_x); % cds 
                % advection_y = d.wind_field_y(j, t, noise_y)/d.total_distance * (concentration_per_volume(i, j+1, t)                                      - concentration_per_volume(i, j-1, t)) / (2*mp.delta_y); % cds
                u_x = d.wind_field_x(i, j, t, noise_x);
                u_y = d.wind_field_y(i, j, t, noise_y);

                
                advection_x = u_x * (concentration_per_volume(i, j, t) - concentration_per_volume(i-1, j, t)) / (mp.delta_x);
                advection_y = u_y * (concentration_per_volume(i, j, t) - concentration_per_volume(i, j-1, t)) / (mp.delta_y);
                
                diffusion_x = d.diffusion_coef * (concentration_per_volume(i+1, j, t) - 2*concentration_per_volume(i, j, t) + concentration_per_volume(i-1, j, t)) / (mp.delta_x^2);
                diffusion_y = d.diffusion_coef * (concentration_per_volume(i, j+1, t) - 2*concentration_per_volume(i, j, t) + concentration_per_volume(i, j-1, t)) / (mp.delta_y^2);

                value = concentration_per_volume(i, j, t) + mp.delta_t * (diffusion_x - advection_x + diffusion_y - advection_y);

                % Registrando os valores nas variáveis de interesse
                concentration_per_volume(i, j, t + 1) = value;
                effective_dose(i, j, t+1) = d.activity_concentration*concentration_per_volume(i, j, t+1)*d.dose_coefficient*mp.delta_t + effective_dose(i, j, t);
            end
        end
        concentration_per_volume(d.source_x, d.source_y, :) = d.C_x1;
        
        if is_stochastic && rem(t,time_cycle) == 0
            line = floor(t/time_cycle) + 1;
            
            wind_field(line, 1) = u_x;
            wind_field(line, 2) = u_y;
            wind_field(line, 3) = t;
        end

        %% tracking de tempo
        if rem(t,50) == 0
            t
            % concentration_per_volume(d.source_x, d.source_y, :) = d.C_x1;
        end

    end
    concentration_per_volume(concentration_per_volume < 1E-15) = NaN;
    effective_dose(effective_dose < 1E-4)                     = NaN;

    C = concentration_per_volume;
end