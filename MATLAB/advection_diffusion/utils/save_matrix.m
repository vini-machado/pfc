function [] = save_matrix(matrix, wind_field, number_of_points, method, dimension, is_stochastic)
    d = inputs;
    
    %% concentration matrix

    s = "";
    if is_stochastic
        sr = num2str(floor(log10(d.stochastic_relevance)));
        s = "s" + sr + "_";
    end

    if dimension == 1
        dim = "exports/1D/";
    else
        dim = "exports/2D/";
    end

    concentration_filename = dim + s + num2str(number_of_points) + "_" + method + ".csv";
    writematrix(matrix, concentration_filename)

    %% wind field matrix
    wind_field_filename =  dim + "wind_field/" + s + num2str(number_of_points) + "_" + method + ".csv";
    writematrix(wind_field, wind_field_filename)

end