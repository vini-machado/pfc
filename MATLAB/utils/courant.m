function Co = courant(wind_velocity, delta_t, delta_x)
%courant - Description
%
% Syntax: Co = courant(velocity, delta_t, delta_x)
%
% Long description

    Co = velocity * delta_t / delta_x 
    
end