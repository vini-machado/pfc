clear, close all 

d = inputs;
dimension_number_of_points = 500;

mp = mesh_points(dimension_number_of_points);

%% Iniciando o vetor de Concentração
concentration_per_volume = zeros(mp.x_number_of_points, mp.t_number_of_points);
concentration_per_volume(:, 1) = d.C_t1; % concentração inicial em todos os pontos da malha 
concentration_per_volume(1, :) = d.C_x1; % concentração inicial constante na fonte

%% Utilização do método numérico
concentration_per_volume = mdf_explicit(concentration_per_volume, mp, true);

%% Plotando gráficos
space = 0:mp.delta_x:d.total_distance;

j = 1;
while j <= mp.t_number_of_points
    figure(1);
    plot(space,concentration_per_volume(:,j), 'r--o','LineWidth',1.5);
    % plot(space,concentration_per_volume(:,j), 'r--o', space,concentration_per_volume(:,j), 'k','LineWidth',1.5);
    

    grid; 
    xlabel('Distância (m)'); 
    ylabel('Concentração (Bq/m³)');
    title('Solução');
    j = j+1;
end