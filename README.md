# 8-Point FFT Verilog Implementation

## Overview
This repository contains a Verilog implementation of an 8-point Fast Fourier Transform (FFT) system. The design includes a datapath, control unit, and testbench for verification.

## Project Structure
The project consists of the following modules:

### Core Modules:
- **BF1.v**: Basic butterfly unit 1.
- **BF2.v**: Basic butterfly unit 2.
- **BF4.v**: Basic butterfly unit 4.
- **FFT_3stage.v**: Implements the 3-stage FFT pipeline.
- **FFT_8p_control.v**: Control unit for managing FFT computation.
- **FFT_8p_control_2.v**: Alternate control unit implementation.
- **FFT_datapath.v**: Handles the computation for the FFT process.
- **FFT_top.v**: Top-level module integrating all components.
- **FFT_xn_ROM.v**: ROM module containing precomputed input test vectors.
- **s2p.v**: Serial-to-parallel conversion module.

### Testbench:
- **tb_FFT_top.v**: Testbench for validating the FFT implementation.

## Features
- Fully implemented in Verilog.
- Supports 8-point FFT computation.
- Uses a pipelined architecture for efficient processing.
- Testbench included for verification with preloaded test vectors.
- Designed for FPGA and ASIC synthesis.

## Simulation and Testing
1. Compile all Verilog files using a simulation tool such as ModelSim, Xilinx Vivado, or QuestaSim.
2. Run `tb_FFT_top.v` testbench to verify the functionality.
3. Observe the outputs for correctness and latency measurements.

## Usage
To integrate this FFT module into your project:
1. Include `FFT_top.v` as the primary FFT module.
2. Ensure proper clocking and reset sequences.
3. Feed input data serially through `s_in`.
4. Capture FFT outputs from `X_0_re, X_0_im, ... X_7_re, X_7_im`.

## Author
**Mohamed S. Helal**  
Date Created: March 9, 2025

## License
This project is released under the MIT License. Feel free to use and modify it as needed.

