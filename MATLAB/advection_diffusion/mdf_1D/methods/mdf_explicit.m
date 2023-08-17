function C = mdf_explicit(concentration_per_volume, mesh_properties, is_stochastic)
    d = inputs;
    mp = mesh_properties;

    noise  = 0;
    wiener = 0;

    if is_stochastic
        nd = normal_distribution;
        wiener = wiener_process('x', mp);
    end

    for j = 2:mp.t_number_of_points
        for i = 2:mp.x_number_of_points - 1
            if is_stochastic
                noise = random(nd)*wiener;
            end

   
            advection = d.wind_field_x(i, 0, j, noise) * (                                       concentration_per_volume(i, j-1) - concentration_per_volume(i-1, j-1)) / (mp.delta_x); 
            diffusion = d.diffusion_coef               * (concentration_per_volume(i+1, j-1) - 2*concentration_per_volume(i, j-1) + concentration_per_volume(i-1, j-1)) / (mp.delta_x^2);

            value = concentration_per_volume(i, j -1) + mp.delta_t * (diffusion - advection) + noise;
            % concentration_per_volume(i, j) = value_checker(value);
            concentration_per_volume(i, j) = value;

            % Restart noise
            noise = 0;

        end
        if rem(j,50) == 0
            j
        end
    end
    
    % Condição de contorno 
    % concentration_per_volume(mp.x_number_of_points,:) = concentration_per_volume(mp.x_number_of_points - 1 ,:);

    C = concentration_per_volume;
    
    end