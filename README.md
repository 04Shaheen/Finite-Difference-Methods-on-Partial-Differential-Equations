# Finite-Difference-Methods-on-Partial-Differential-Equations

This project demonstrates the use of **Finite Difference Methods (FDM)** to numerically solve **Partial Differential Equations (PDEs)** using **MATLAB**. The focus is on comparing numerical schemes—both explicit and implicit—with analytical solutions, and analyzing their **stability**, **consistency**, and **convergence**.

## Overview

We begin by formulating **Ordinary Differential Equations (ODEs)** numerically using **Runge-Kutta methods**, then move on to solving **PDEs** using various finite difference schemes.

### Objectives

- Solve systems of ODEs using RK2 and RK4
- Numerically solve Transport and Heat equations using FDM
- Implement and compare explicit and implicit schemes
- Analyze stability, convergence, and consistency
- Compare numerical solutions with analytical results

## Numerical Methods Used

### 1. Ordinary Differential Equations (ODEs)

Implemented using:
- Runge-Kutta 2nd Order (RK2)
- Runge-Kutta 4th Order (RK4)

Test Systems:
- Linear Spring-Mass System
- Non-Linear Predator-Prey Model
- Chaotic Lorenz System

### 2. Partial Differential Equations (PDEs)

Equations Solved:
- Transport (Advection) Equation
- Heat (Diffusion) Equation

Explicit Schemes:
- FTFS: Forward in Time, Forward in Space
- FTBS: Forward in Time, Backward in Space
- FTCS: Forward in Time, Centered in Space
- Lax-Wendroff Scheme

Implicit Schemes:
- BTFS: Backward in Time, Forward in Space
- BTBS: Backward in Time, Backward in Space
- BTCS: Backward in Time, Centered in Space

## Analysis and Inference

For each scheme and equation, we analyzed:

- Stability: Using theoretical and experimental approaches
- Consistency: Ensuring the scheme approximates the PDE correctly
- Convergence: Comparing with analytical solutions (when available)

We observed expected breakdowns (e.g., FTFS on the transport equation) and demonstrated stable behavior using more appropriate schemes (e.g., FTBS, Lax-Wendroff).

## Tools Used

- MATLAB for all simulations and visualizations
- Plots and animations to illustrate wave propagation, diffusion, and system behavior

## File Structure

```
├── README.md               # Project overview
├── ODE/
│   ├── spring_mass.m
│   ├── predator_prey.m
│   ├── lorenz_system.m
│   └── rk2_rk4_functions.m
├── PDE/
│   ├── transport/
│   │   ├── ftfs.m
│   │   ├── ftbs.m
│   │   └── lax_wendroff.m
│   ├── heat/
│   │   ├── ftcs.m
│   │   ├── btcs.m
│   │   └── comparison_plot.m
└── utils/
    └── analytical_solutions.m
```

## Results

- FTFS scheme showed instability for the transport equation
- FTBS and Lax-Wendroff offered more stable results for advection
- FTCS was stable under certain time step constraints for the heat equation
- Implicit methods (BTCS, etc.) demonstrated unconditional stability

## Contact

For questions, collaboration, or feedback, feel free to reach out:

**Shaheen Ali**  
shaheenalirv@gmail.com  
Birla Institute of Technology and Science Pilani Hyderabad Campus

---

## 📂 File Structure

