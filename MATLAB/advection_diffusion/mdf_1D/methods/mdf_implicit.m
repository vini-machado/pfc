function C = mdf_implicit(concentration_per_volume, mesh_properties, is_stochastic)
    d = inputs;
    mp = mesh_properties;

    noise = 0;
    if is_stochastic
        noise = additive_noise('x', mp);
    end

    %% Raciocine com a matriz Ax=b

    %% Coeficientes utilizados
    Aw = (- d.fourier - d.courant);
    Ap = (1 + d.courant + 2*d.fourier) + noise;
    Ae = (- d.fourier);

    %% Criando a matriz quadrada principal (A)
    main_matrix = zeros(mp.x_number_of_points);
    main_matrix(1, 1) = 1;
    main_matrix(mp.x_number_of_points, mp.x_number_of_points -1) = -1;
    main_matrix(mp.x_number_of_points, mp.x_number_of_points)    = 1;

    for i = 2:mp.x_number_of_points - 1
        main_matrix(i, i-1) = Aw; 
        main_matrix(i, i)   = Ap; 
        main_matrix(i, i+1) = Ae;
    end

    %% Resolvendo o sistema

    for t = 2:mp.t_number_of_points
        vector = concentration_per_volume(:, t-1);
        vector(1) = d.C_x1;
        vector(mp.x_number_of_points) = 0;

        concentration_per_volume(:, t) = tdma(main_matrix, vector);
    end

    C = concentration_per_volume;
    
end