% === File 1: snr_values.m ===
function snr_struct = snr_values(distance_km, lambda, Cn2)
    % Calculates SNR parameters from distance and turbulence using Rytov theory
    % Inputs: distance_km = array of distances [km]
    %         lambda = wavelength [m]
    %         Cn2 = refractive index structure constant [m^(-2/3)]

    k = 2 * pi / lambda;             % Optical wave number [rad/m]
    R = distance_km * 1e3;           % Convert distance to meters

    % Scintillation index (variance of log irradiance)
    sigma_I2 = 1.23 * Cn2 * (k^(7/6)) .* (R.^(11/6));   % Eq 2.39 Kaushal, for plane wave

    % Parameters of lognormal distribution
    sigma2 = sigma_I2;              % variance of log-amplitude
    mu = -sigma2 / 2;               % mean for lognormal fading model

    snr_struct.mu = mu;             % mean value
    snr_struct.sigma2 = sigma2;     % variance
end
