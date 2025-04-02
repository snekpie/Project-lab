% === File 2: ber_log_normal.m ===
function ber = ber_log_normal(snr_db_range, mu, sigma)
    % Monte Carlo simulation for BER under lognormal fading
    % Inputs:
    %   snr_db_range: vector of SNR values in dB
    %   mu: mean of lognormal fading (vector)
    %   sigma: variance of lognormal fading (vector)

    N = 1e6;                         % Number of bits to simulate
    ber = zeros(size(snr_db_range));

    for ii = 1:length(snr_db_range)
        snr_lin = 10^(0.1 * snr_db_range(ii));
        fading_samples = lognrnd(mu(ii), sqrt(sigma(ii)), [1, N]);
        ber(ii) = mean(0.5 * erfc(0.5 * sqrt(snr_lin * fading_samples)));
    end
end