% === File 5: alpha_itu_fog.m ===
function alpha = alpha_itu_fog(lambda, visibility, fog_type)
    % Calculates attenuation alpha [dB/km] using ITU-R F.2106-1 model
    % lambda: wavelength in meters
    % visibility: in km
    % fog_type: 'advection' or 'radiation'

    lambda_um = lambda * 1e6;  % Convert wavelength to microns

    switch lower(fog_type)
        case 'advection'
            sigma = (0.11478 * lambda_um + 3.8367) / visibility;  % Eq (5)
        case 'radiation'
            sigma = (0.181262 * lambda_um^2 + 0.137094 * lambda_um + 3.8367) / visibility;  % Eq (6)
        otherwise
            error('Unknown fog type. Use "advection" or "radiation".');
    end

    alpha = 4.343 * sigma;  % Convert from natural log attenuation to dB/km
end