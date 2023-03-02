function Pe = peclet(wind_velocity, delta_x, diffusion_coef)
%peclet - Description
%
% Syntax: Pe = peclet(velocity, delta_x, diffusion_coef)
%
% Long description

    Pe = wind_velocity * delta_x / diffusion_coef
    
end