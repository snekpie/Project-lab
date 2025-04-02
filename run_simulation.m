% === File 4: run_simulation.m ===
clear; close all; clc;

% Simulation parameters
distance_km = linspace(0.2, 3, 20);         % From 200 m to 3 km
lambda = 1550e-9;                           % 1550 nm laser
Cn2 = 1e-15;                                % Typical value for weak turbulence
visibility = 2;                             % Visibility in km
fog_type = 'radiation';                    % Options: 'radiation' or 'advection'

% Calculate attenuation alpha using ITU fog model
alpha = alpha_itu_fog(lambda, visibility, fog_type);  % in dB/km

% Convert alpha from dB/km to natural exp form per distance
attenuation = exp(-alpha * distance_km);  % scalar attenuation factor for each distance

% Step 1: Get lognormal parameters based on distance and turbulence
snr_struct = snr_values(distance_km, lambda, Cn2);
mu = snr_struct.mu;
sigma2 = snr_struct.sigma2;

% Step 2: Simulate BER vs SNR (Monte Carlo)
snr_db = 0:1:15;
y_mc = ber_log_normal(snr_db, mu, sigma2);

% Step 3: Analytical BER using Gauss-Hermite quadrature
y_ana_gh = ber_analytical_gh(snr_db, mu, sigma2);

% Step 4: Analytical BER using closed-form erfc expression
y_ana_cf = ber_analytical_closedform(snr_db, sigma2);

% Step 5: Plot comparison
semilogy(snr_db, y_mc, 'o-', 'LineWidth', 2); hold on;
semilogy(snr_db, y_ana_gh, '--', 'LineWidth', 2);
semilogy(snr_db, y_ana_cf, '-.', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER under Lognormal Fading: Monte Carlo vs Analytical');
legend('Monte Carlo', 'Analytical (GH)', 'Analytical (Closed-form)', 'Location', 'southwest');
