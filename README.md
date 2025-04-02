# 📡 Free-Space Optical Communication (FSO) – BER Simulation under Lognormal Fading

This repository contains a modular MATLAB implementation of Bit Error Rate (BER) analysis for Free-Space Optical (FSO) systems under weak atmospheric turbulence. The model uses lognormal fading and includes both Monte Carlo and analytical approaches based on equations from the **Kaushal & Kaddoum book**.

---

## 🔍 Project Goal

To simulate and compare BER performance in an FSO link over 0.2–3 km using:

- ✅ Monte Carlo Simulation
- ✅ Analytical BER using **Gauss-Hermite Quadrature** (Kaushal Eq. 5.5)
- ✅ Analytical **Closed-form Approximation** (Kaushal Eq. 5.3/5.4)

---

## 📁 File Structure

| File                          | Description |
|------------------------------|-------------|
| `run_simulation.m`           | Main script to run the simulations and generate comparison plots |
| `snr_values.m`               | Calculates Rytov-based fading parameters (μ, σ²) |
| `ber_log_normal.m`           | Monte Carlo BER simulation using fading samples |
| `ber_analytical_gh.m`        | Gauss-Hermite quadrature BER computation |
| `ber_analytical_closedform.m`| Fast approximation using closed-form erfc formula |
| `alpha_itu_fog.m`            | ITU-R F.2106-1 fog model for attenuation (dB/km) |

---

## 📘 Theory Used

### Lognormal Fading
- Based on the Rytov theory for weak turbulence
- mu = -sigma^2  ensures unity-mean lognormal fading.

### Atmospheric Attenuation
- Attenuation α is computed using the **ITU-R F.2106-1** model for fog (radiation or advection).
- Converted from dB/km to natural exponential form for power scaling.

---

## 📊 Outputs

The script generates BER vs SNR curves comparing:

- Monte Carlo simulation
- Gauss-Hermite analytical approximation
- Closed-form erfc approximation

---

## 🔧 Parameters

- Wavelength: 1550 nm  
- Distance: 0.2 to 3 km  
- Visibility: 2 km  
- C_n^2: 10^{-15}, {m}^{-2/3} (weak turbulence)  
- Bits simulated per SNR point: 10^6

---

## 📌 Usage

Open MATLAB and run:
```matlab
run_simulation
