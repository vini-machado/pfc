function [step_size, number_of_points] = spacial_step_new(~, dimension_number_of_points)
    d = inputs;

    % step_size: Distância entre pontos da malha (delta_x)  
    step_size = d.total_distance/(dimension_number_of_points - 1);
    number_of_points = dimension_number_of_points;

end