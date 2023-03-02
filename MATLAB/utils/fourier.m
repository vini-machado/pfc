function Fo = fourier(diffusion_coef, delta_t, delta_x)
%fourier - Description
%
% Syntax: Fo = fourier(diffusion_coef, delta_t, delta_x)
%
% Long description
    Fo = diffusion_coef * delta_t / (delta_x^2)
end