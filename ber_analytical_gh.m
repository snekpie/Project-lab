% === File 3: ber_analytical_gh.m ===
function ber = ber_analytical_gh(snr_db_range, mu, sigma)
    % Analytical BER using Gauss-Hermite quadrature (Kaushal Eq 5.5)
    % Inputs:
    %   snr_db_range: vector of SNR values in dB
    %   mu: mean of lognormal fading (vector)
    %   sigma: variance of lognormal fading (vector)

    N = length(snr_db_range);
    M = 20;  % Number of Gauss-Hermite nodes
    [x, w] = hermite_quadrature(M);  % Gauss-Hermite points and weights
    ber = zeros(1, N);

    for ii = 1:N
        snr_lin = 10^(0.1 * snr_db_range(ii));
        sigma_ln = sqrt(sigma(ii));
        mu_ln = mu(ii);

        sum_term = 0;
        for m = 1:M
            % From Eq (5.5): lognormal sample = exp(sqrt(2)*sigma*x - sigma^2/2)
            h = exp(sqrt(2) * sigma_ln * x(m) - sigma_ln^2 / 2);
            q_val = qfunc(sqrt(snr_lin * h));
            sum_term = sum_term + w(m) * q_val;
        end

        ber(ii) = sum_term / sqrt(pi);
    end
end