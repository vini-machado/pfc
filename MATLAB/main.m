clear all, close all, clc

%% Dados do problema 
x_length = 0.1;
wind_velocity = 0.2;
diffusion_coef = 0;
k = 0;
C_t1 = 0;
C_x1 = 1;

%% Hipóteses assumidas
courant = 0.25;

%% Números de pontos em x do domínio discreto
x_number_of_points = 150;

%% Vetores
t_length = 1;

[x_vector, delta_x] = mesh(x_length, x_number_of_points);
[delta_t, t_vector, t_number_of_points] = time(t_length, delta_x, courant, wind_velocity);

%% Iniciando o vetor de Concentração
initial_C = zeros(x_number_of_points, t_number_of_points - 1);
initial_C(:, 1) = C_t1;

%% Parâmetros da solução numérica
fourier = fourier(diffusion_coef, delta_x, delta_x);
peclet  = peclet(wind_velocity, delta_x, diffusion_coef);

C = cds(initial_C, x_number_of_points, t_number_of_points, courant, fourier, C_x1, delta_t, k);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

while j <= t_number_of_points
    figure(1);
    % plot(x,c(:,j),'k','LineWidth',1.5);
    plot(x_vector,C(:,j),x_vector,c(:,j),'k','LineWidth',1.5);
    grid; 
    xlabel('Distância (m)'); 
    ylabel('Concentração (Bq/m³)')
    title('Solução');
    j = j+1;
end