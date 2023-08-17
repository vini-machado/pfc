function data = inputs
    %% Parâmetros de simulação
    data.spacial_dimensions = 1;
    data.number_of_points_array = [10, 50, 100, 250, 500];
    
    %% Parâmetros do problema
    data.total_distance = 1000;
    data.total_time = 60; 
    data.diffusion_coef = 2.11E-5;

    %% Campos de velocidades
    data.permanent_wind_velocity_x = 40;
    data.wind_field_x = @(x, y, t, noise) data.permanent_wind_velocity_x + noise;
    % data.wind_field_x = @(x, y, t, noise) data.permanent_wind_velocity_x *(1 - sin(4*x)^2) + noise;
    % data.wind_field_x = @(x, y, t, noise) 0.2*(y) / sqrt((x)^2 + (y)^2) + noise;
    % data.wind_field_x = @(x, y, t, noise) data.permanent_wind_velocity_x*(-y) / sqrt((x)^2 + (y)^2) + noise;
    
    data.permanent_wind_velocity_y = 40;
    data.wind_field_y = @(x, y, t, noise) data.permanent_wind_velocity_y + noise;
    % data.wind_field_y = @(x, y, t, noise) data.permanent_wind_velocity_y *(1 - cos(4*y)^2) + noise;
    % data.wind_field_y = @(x, y, t, noise) -0.2* (x) / sqrt((x)^2 + (y)^2) + noise;
    % data.wind_field_y = @(x, y, t, noise) data.permanent_wind_velocity_y* (x) / sqrt((x)^2 + (y)^2) + noise;

    %% Parâmetros de estabilidade
    data.peclet = 2;
    data.courant = 0.5;
    data.fourier = data.courant/data.peclet;

    %% Condições iniciais de concentração
    data.C_t1 = 0;
    data.C_x1 = 1;
    data.C_y1 = data.C_x1;

    %% Localização da fonte
    data.source_x = 15:15;
    data.source_y = data.source_x;

    %% Parâmetro estocástico
    data.is_stochastic = true;
    data.normal_distribution = makedist('Normal');
    data.stochastic_relevance = 1E-4;
end