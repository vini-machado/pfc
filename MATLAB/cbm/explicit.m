clear all, close all, clc

%% Dados do problema 
x_length = 0.1;
wind_velocity = 0.2;
diffusion_coef = 0;
k = 0;
C_t1 = 0;
C_x1 = 1;


x_number_of_points = 300;
x_length = 1;
t_length = 2 ;

delta_t = 8.389261744966444e-04;

a = 0;
b = .5;

iprint = 300;

delta_x = x_length/x_number_of_points;
icount = 0 ;
icol = 0;

t_number_of_points = floor(t_length/delta_t);
TT = floor(t_number_of_points/iprint);

for ii=1:x_number_of_points
    c1(ii) = 0;
    c2(ii) = 0;
end

d = zeros(x_number_of_points, TT)

for j = 1:x_number_of_points
    xj(j) = delta_x*(j-1)
    if xj(j) >= a & xj(j) <= b
        c1(j) = 1.;
    end
end

hold

plot(xj, c1)


c1(1) = 0;
c1(x_number_of_points) = 0;
c2(1) = 0;
c2(x_number_of_points) = 0;

for i = 1:t_number_of_points-1
    for j =2:x_number_of_points-1
        c2(j) = c1(j) - (wind_velocity*delta_t/delta_x)*(c1(j) - c1(j-1)) + (diffusion_coef*delta_t/(delta_x^2))*(c1(j+1) - 2*c1(j) + c1(j-1));

    end
    c1 = c2;
end


j = 1;
while j <= t_number_of_points
    figure(1);
    % plot(x,c(:,j),'k','LineWidth',1.5);
    plot(x,c2(:,j),'k','LineWidth',1.5);
    grid; 
    xlabel('Distância (m)'); 
    ylabel('Concentração (Bq/m³)')
    title('Solução');
    j = j+1;
end


plot(xj, d);