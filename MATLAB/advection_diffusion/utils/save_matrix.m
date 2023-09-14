function [] = save_matrix(matrix, number_of_points, method, dimension, is_stochastic)
    d = inputs;
    
    s = "";
    if is_stochastic
        sr = num2str(floor(log10(d.stochastic_relevance)));
        s = "s" + sr + "_";
    end

    if dimension == 1
        dim = "1D/";
    else
        dim = "2D/";
    end

    filename = "exports/" + dim + s + num2str(number_of_points) + "_" + method + ".csv";
    writematrix(matrix, filename)
end