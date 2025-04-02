% === File 3b: ber_analytical_closedform.m ===
function ber = ber_analytical_closedform(snr_db_range, sigma2)
    % Closed-form analytical approximation of BER (Kaushal Eq 5.3 or 5.4)
    % Inputs:
    %   snr_db_range: SNR values in dB
    %   sigma2: variance of log-amplitude (vector)

    snr_lin = 10.^(0.1 * snr_db_range);  % Convert to linear SNR
    sigma2_grid = repmat(sigma2(:)', length(snr_lin), 1);  % Match dimensions
    snr_grid = repmat(snr_lin(:), 1, length(sigma2));

    ber_matrix = 0.5 * erfc( log(snr_grid) ./ sqrt(8 * sigma2_grid) );
    ber = mean(ber_matrix, 2);  % Average over distance-dependent sigma2
end