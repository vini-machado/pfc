function noise = additive_noise(dimension)
    d = inputs;
    mp = mesh_points;
    
    stochastic_relevance = d.stochastic_relevance;
    random_number = random(d.normal_distribution);

    if dimension == 'x'
        delta_s = mp.delta_x;
    elseif dimension == 'y'
        delta_s = mp.delta_y;
    else 
        error 'Dimensão não reconhecida'
    end 

    noise = random_number*sqrt(mp.delta_t/delta_s);
    noise = stochastic_relevance*noise;
end