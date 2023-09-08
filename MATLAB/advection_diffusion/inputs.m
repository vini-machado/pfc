function data = inputs
    %% Parâmetros de simulação
    data.spacial_dimensions = 2;
    % data.number_of_points_array = [100, 200, 400, 800, 1600];
    data.number_of_points_array = [400];
    
    %% Parâmetros do problema
    data.total_distance = 500;
    data.total_time = 60; 
    data.diffusion_coef = 2.11E-5;

    %% Campos de velocidades
    data.permanent_wind_velocity_x = 5;
    data.permanent_wind_velocity_y = 3;

    wind_field_function_x = @(x, y, t) sin((y^3))^2;
    wind_field_function_y = @(x, y, t) cos(sqrt(x))^2;

    data.wind_field_x = @(x, y, t, noise) data.permanent_wind_velocity_x*wind_field_function_x(x, y, t) + noise;
    data.wind_field_y = @(x, y, t, noise) data.permanent_wind_velocity_y*wind_field_function_y(x, y, t) + noise;

    %% Parâmetros de estabilidade
    data.peclet = 20;
    data.courant = 0.5;
    data.fourier = data.courant/data.peclet;

    %% Condições iniciais de concentração
    data.C_t1 = 0;
    data.C_x1 = 1;
    data.C_y1 = data.C_x1;

    %% Localização da fonte
    data.source_x = 5:5;
    data.source_y = data.source_x;

    %% Parâmetro estocástico
    data.is_stochastic = true;
    data.normal_distribution = makedist('Normal');
    data.stochastic_relevance = 1E-2;
end