function C_vector = cds(initial_C_vector, x_number_of_points, t_number_of_points, courant, fourier, C_x1, delta_t, k)
%cds - Description
%
% Syntax:C_vector = cds(initial_C_vector, x_number_of_points, t_number_of_points, courant, fourier)
%
% Long description

    for j = 2:t_number_of_points
        initial_C_vector(1, j) = C_x1;
        for i = 2:x_number_of_points - 1
            initial_C_vector(i, j) =         (fourier + courant/2)*initial_C_vector(i-1, j - 1) ...
                                     + (1 + k*delta_t - 2*fourier)*initial_C_vector(i  , j - 1)   ...
                                           + (fourier - courant/2)*initial_C_vector(i+1, j - 1); 
                             
        end
    end
    C_vector = initial_C_vector;

end