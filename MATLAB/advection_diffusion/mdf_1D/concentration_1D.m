function [concentration_per_volume, mp] = concentration_1D(data_inputs, dimension_number_of_points, is_stochastic)

    d = data_inputs;
    mp = mesh_points(dimension_number_of_points);

    %% Iniciando o vetor de Concentração
    concentration_per_volume = zeros(mp.x_number_of_points, mp.t_number_of_points);
    concentration_per_volume(:, 1) = d.C_t1; % concentração inicial em todos os pontos da malha 
    concentration_per_volume(1, :) = d.C_x1; % concentração inicial constante na fonte

    %% Utilização do método numérico
    concentration_per_volume = mdf_explicit(concentration_per_volume, mp, is_stochastic);
end