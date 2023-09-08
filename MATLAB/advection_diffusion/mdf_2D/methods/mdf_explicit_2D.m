function [C, effective_dose] = mdf_explicit_2D(concentration_per_volume, effective_dose, mesh_properties, is_stochastic)
    d = inputs;
    mp = mesh_properties;

    noise_x = 0;
    noise_y = 0;

    wiener_x = 0;
    wiener_y = 0;

    if is_stochastic
        nd = normal_distribution;
        wiener_x = wiener_process('x', mp);
        wiener_y = wiener_process('y', mp);
    end

    for t = 1:mp.t_number_of_points
        for i = 2:mp.x_number_of_points-1
            for j = 2:mp.y_number_of_points-1

                if is_stochastic
                    noise_x = random(nd)*wiener_x;
                    noise_y = random(nd)*wiener_y;
                end
                
                % advection_x = d.wind_field_x(i, t, noise_x)/d.total_distance * (concentration_per_volume(i+1, j, t)                                      - concentration_per_volume(i-1, j, t)) / (2*mp.delta_x); % cds 
                % advection_y = d.wind_field_y(j, t, noise_y)/d.total_distance * (concentration_per_volume(i, j+1, t)                                      - concentration_per_volume(i, j-1, t)) / (2*mp.delta_y); % cds
                
                advection_x = d.wind_field_x(i, j, t, noise_x)* (concentration_per_volume(i, j, t) - concentration_per_volume(i-1, j, t)) / (mp.delta_x);
                advection_y = d.wind_field_y(i, j, t, noise_y)* (concentration_per_volume(i, j, t) - concentration_per_volume(i, j-1, t)) / (mp.delta_y);
                
                diffusion_x = d.diffusion_coef * (concentration_per_volume(i+1, j, t) - 2*concentration_per_volume(i, j, t) + concentration_per_volume(i-1, j, t)) / (mp.delta_x^2);
                diffusion_y = d.diffusion_coef * (concentration_per_volume(i, j+1, t) - 2*concentration_per_volume(i, j, t) + concentration_per_volume(i, j-1, t)) / (mp.delta_y^2);

                value = concentration_per_volume(i, j, t) + mp.delta_t * (diffusion_x - advection_x + diffusion_y - advection_y);
                concentration_per_volume(i, j, t + 1) = value;
                effective_dose(i, j, t+1) = d.activity_concentration*concentration_per_volume(i, j, t+1)*d.dose_coefficient*mp.delta_t + effective_dose(i, j, t);

                % concentration_per_volume(i, j, t + 1) = value_checker(value);

                % Restart noise
                noise_x = 0;
                noise_y = 0;
            end
        end
        concentration_per_volume(d.source_x, d.source_y, :) = d.C_x1;
        
        %% tracking de tempo
        % if rem(t,50) == 0
        %     t
        %     % concentration_per_volume(d.source_x, d.source_y, :) = d.C_x1;
        % end

    end

    C = concentration_per_volume;

end