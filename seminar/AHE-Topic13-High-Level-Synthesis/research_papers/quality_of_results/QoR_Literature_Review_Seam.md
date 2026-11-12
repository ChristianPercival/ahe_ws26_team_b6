# Quality of Results (QoR) in High-Level Synthesis
## Literature Review and Critical Analysis

**Researcher:** Seam  
**Seminar topic:** State of the Art in High-Level Synthesis  
**Research area:** FPGA Resource Utilization, Performance Metrics, and Benchmarking  
**Number of papers reviewed:** 3

---

## 1. High-Level Synthesis for FPGAs—A Hardware Engineer's Perspective (2025)

**Authors:** Sakari Lahti and Timo D. Hämäläinen

**Citation key:** `Lahti2025HLSPerspective`

### Research Objective

Investigate the current state of High-Level Synthesis (HLS) for FPGA development, particularly how the hardware quality and design productivity of HLS-generated implementations compare with manually written Register-Transfer Level (RTL) designs.

The study aims to determine whether HLS can provide competitive hardware performance while reducing the engineering effort required for FPGA development.

### Methodology

The researchers conduct a literature review of scientific publications from 2017 to 2024 that compare HLS and manual RTL implementations.

The study also surveys available commercial and academic HLS tools and examines their design flows, capabilities, and limitations.

The evaluation considers:

- Hardware performance and execution speed.
- FPGA resource utilization and circuit area.
- Development effort and engineering productivity.
- The influence of hardware-specific code optimization.
- Differences between HLS-generated and manually optimized RTL designs.

The researchers analyze results from existing experimental studies rather than performing one new benchmark across all HLS tools.

### Main Findings

- HLS provides a clear improvement in hardware design productivity compared with manually written RTL.
- Manually optimized RTL implementations achieve somewhat better performance on average in the reviewed studies.
- HLS-generated designs generally consume slightly more basic FPGA resources than their manual RTL counterparts.
- Hardware efficiency depends strongly on how the original high-level code is structured and optimized.
- Achieving competitive QoR often requires knowledge of FPGA architecture, memory organization, and parallel execution.
- The study identifies 12 HLS tools that satisfy its selection criteria, illustrating the diversity of available HLS development approaches.
- Automated design-space exploration and better code transformation could improve both QoR and development productivity.

### Limitations

**Identified in the research:**

- The reviewed studies use different FPGA applications and experimental configurations.
- Some reported comparisons lack complete information about development effort or hardware resource usage.
- The study focuses on FPGA development rather than ASIC implementations.
- The findings depend on the HLS tools and research publications available during the review period.
- High-level software descriptions often require substantial modifications before producing efficient FPGA hardware.

**Critical observation:**

The results demonstrate an important trade-off between hardware quality and engineering productivity.

Although HLS can reduce development effort, it does not automatically generate the most efficient FPGA implementation.

The average findings should not be interpreted as a guarantee that manually written RTL will outperform HLS for every application.

### Relevance to Our Seminar

This paper provides the theoretical foundation for evaluating Quality of Results in modern HLS workflows.

It explains why hardware performance and FPGA resource consumption must be measured separately from design productivity.

It is particularly useful for discussing the relationship between HLS abstraction, hardware efficiency, and the continuing need for manual optimization.

---

## 2. A Survey and Evaluation of FPGA High-Level Synthesis Tools (2016)

**Authors:** Razvan Nane, Vlad-Mihai Sima, Christian Pilato, Jongsok Choi, Blair Fort, Andrew Canis, Yu-Ting Chen, Hsuan Hsiao, Stephen Brown, Fabrizio Ferrandi, Jason Anderson, and Koen Bertels

**Citation key:** `Nane2016HLSEvaluation`

### Research Objective

Investigate and compare existing FPGA High-Level Synthesis tools to understand their differences in hardware generation capabilities, performance, resource efficiency, and usability.

The research aims to provide a systematic evaluation of HLS tools and identify important considerations when selecting a tool for FPGA development.

### Methodology

The researchers survey the characteristics of FPGA HLS tools and conduct an experimental comparison involving one commercial and three academic tools.

The academic tools include Bambu, LegUp, and DWARV.

The evaluation uses a collection of C-language benchmark applications to investigate how different HLS approaches generate FPGA hardware.

The study examines:

- Execution performance of generated hardware.
- Hardware resource requirements.
- Differences in supported input programs and tool capabilities.
- Tool-specific synthesis and optimization strategies.
- The suitability of benchmark applications for comparative evaluation.

The authors use common benchmark programs to make the evaluation more systematic.

### Main Findings

- Different HLS tools can generate different hardware implementations from comparable high-level programs.
- Hardware performance and resource utilization depend on tool-specific compilation and synthesis decisions.
- A tool that produces efficient hardware for one application may not perform equally well for another.
- Evaluating only execution performance is insufficient because faster implementations may require additional hardware resources.
- Tool capabilities and supported programming constructs influence the practicality of using HLS for different applications.
- Common benchmark programs provide a more meaningful basis for evaluating competing HLS approaches.
- The study demonstrates the importance of examining multiple evaluation criteria rather than relying on a single performance measurement.

### Limitations

**Identified in the research:**

- HLS tools differ in supported programming features and synthesis capabilities.
- Benchmark applications do not represent every possible FPGA workload.
- Hardware performance depends on the target FPGA architecture and synthesis constraints.
- The study evaluates tool versions available during its research period.

**Critical observations:**

The study was published in 2016, so its experimental results should not be treated as a ranking of modern HLS tools.

Newer tool versions may include improved optimization algorithms, additional hardware support, and different synthesis strategies.

Furthermore, differences in resource utilization should be interpreted together with performance, target hardware, and implementation conditions.

### Relevance to Our Seminar

This paper is particularly important for our benchmarking methodology.

It provides an example of how multiple HLS tools can be evaluated using common benchmark applications.

It supports the argument that Quality of Results must consider both execution performance and hardware resource consumption.

The paper also provides a foundation for discussing the limitations of comparisons involving different HLS tools and FPGA architectures.

---

## 3. Towards a Comprehensive Benchmark for High-Level Synthesis Targeted to FPGAs (2023)

**Authors:** Yunsheng Bai, Atefeh Sohrabizadeh, Zongyue Qin, Ziniu Hu, Yizhou Sun, and Jason Cong

**Citation key:** `Bai2023HLSynBenchmark`

### Research Objective

Develop a comprehensive benchmark dataset for evaluating and predicting the Quality of Results of FPGA implementations generated through High-Level Synthesis.

The research aims to address limitations in existing HLS datasets, particularly their restricted program complexity, limited optimization configurations, and insufficient diversity.

The authors investigate how machine-learning-based prediction methods can support faster evaluation of HLS designs.

### Methodology

The researchers introduce a benchmark dataset called HLSyn.

The dataset includes 42 unique computational kernels selected from MachSuite and PolyBench benchmark suites.

Different optimization configurations are applied to these kernels, producing more than 42,000 labeled hardware designs.

The benchmark includes implementations generated using AMD/Xilinx SDx and Vitis HLS flows.

The experimental setup uses:

- AMD/Xilinx Alveo U200 FPGA.
- A target clock frequency of 250 MHz.
- Different pipeline, parallelization, and tiling configurations.
- Multiple computational workloads, including matrix operations and other numerical algorithms.

The researchers evaluate five Quality of Results targets:

1. Performance, represented through latency-related measurements.
2. DSP resource utilization.
3. BRAM resource utilization.
4. LUT resource utilization.
5. Flip-flop resource utilization.

The dataset is then used to compare machine-learning models that predict hardware quality without requiring a complete synthesis run for every candidate configuration.

### Main Findings

- HLSyn contains **42 unique kernels and more than 42,000 labeled designs**.
- Changing optimization pragmas can significantly affect hardware performance and resource utilization.
- Pipelining, parallelization, and tiling influence the microarchitecture generated by HLS.
- Increasing parallelism may improve performance but can also increase FPGA resource requirements.
- The large number of possible optimization configurations makes exhaustive design-space exploration expensive.
- HLS evaluation can require minutes or hours for individual configurations, motivating faster prediction techniques.
- Machine-learning-based QoR prediction can help estimate the quality of candidate designs and guide design-space exploration.
- Systematic benchmark datasets enable more consistent evaluation of prediction methods across different workloads.

### Published Quantitative Example

The paper illustrates how changing optimization configurations affects the measured QoR of a matrix-multiplication kernel.

For two example configurations of the 2MM kernel, the reported normalized targets are:

| QoR target | Design 1 | Design 2 |
|---|---:|---:|
| Performance target | 1.1971 | 4.7760 |
| DSP utilization | 0.1000 | 0.2500 |
| BRAM utilization | 0.0400 | 0.1300 |
| LUT utilization | 0.0600 | 0.1100 |
| FF utilization | 0.0600 | 0.1000 |

These values illustrate how one change in optimization configuration can affect multiple QoR targets simultaneously.

The performance target is a dataset-specific measure and should not be interpreted directly as throughput, clock frequency, or execution time without applying the paper's definition.

### Limitations

**Identified in the research:**

- The benchmark focuses on selected computational kernels rather than all possible FPGA applications.
- The experimental data comes from specific AMD/Xilinx HLS flows and hardware configurations.
- The optimization search space is extremely large, making exhaustive evaluation impractical.
- QoR prediction models may not generalize equally well to previously unseen programs.
- Prediction accuracy depends on the available training data and representation of optimization settings.
- The study does not provide a controlled comparison of Vitis HLS, Bambu, and Dynamatic.

**Critical observation:**

HLSyn provides a valuable framework for understanding hardware performance and resource trade-offs.

However, predicted QoR values are not equivalent to verified post-place-and-route measurements.

The reported results should be interpreted in relation to the benchmark configuration, FPGA platform, and specific prediction objectives.

### Relevance to Our Seminar

This paper provides a modern example of systematic FPGA HLS benchmarking.

It is particularly useful for explaining how performance and resource utilization can be measured across many hardware configurations.

It also demonstrates the relationship between optimization directives and hardware quality, connecting our QoR analysis to the team's discussion of pipelining, loop unrolling, and compiler optimization.

---

# Overall Literature Analysis

## Common Findings

Across the three publications, several recurring observations emerge.

**1. Hardware quality cannot be evaluated using a single metric.**

FPGA implementations must be evaluated using both performance and hardware resource consumption.

A design with lower latency may require more LUTs, flip-flops, DSP blocks, or BRAM.

Therefore, the most suitable implementation depends on the application's performance requirements and available hardware resources.

**2. HLS productivity and hardware efficiency are different evaluation objectives.**

Lahti and Hämäläinen demonstrate that HLS can reduce engineering effort while still producing somewhat less efficient hardware than manually optimized RTL.

Consequently, faster development does not automatically imply better FPGA performance.

**3. Optimization configurations strongly influence QoR.**

The studies show that HLS optimization choices can change the generated hardware architecture.

Pipelining, parallelization, memory organization, and other transformations influence both execution performance and resource utilization.

**4. Standardized benchmarks are necessary for meaningful comparisons.**

Nane et al. demonstrate the value of evaluating HLS tools using common computational workloads.

Bai et al. extend systematic evaluation through a large dataset of optimization configurations.

Together, these studies support the use of clearly defined benchmarks and consistent evaluation metrics.

**5. Design-space exploration is an important challenge.**

HLS tools offer numerous optimization possibilities.

Evaluating every configuration through synthesis can be computationally expensive.

Automated optimization and QoR prediction methods can help researchers identify promising configurations more efficiently.

**6. No single HLS approach is universally optimal.**

The literature indicates that hardware quality depends on the application, FPGA architecture, optimization settings, and tool capabilities.

Different approaches may prioritize performance, resource efficiency, or development productivity.

---

## FPGA Quality of Results Evaluation Metrics

The following metrics are central to evaluating FPGA implementations generated by HLS tools.

### Hardware Resource Utilization

**Look-Up Tables (LUTs):**

LUTs implement configurable digital logic functions inside an FPGA.

LUT utilization indicates how much of the available logic capacity is consumed by a design.

**Flip-Flops (FFs):**

Flip-flops store intermediate values, control states, and pipeline registers.

Their utilization helps evaluate the storage requirements of the generated circuit.

**Digital Signal Processing Blocks (DSPs):**

DSP blocks provide dedicated hardware for arithmetic operations such as multiplication and multiply-accumulate calculations.

DSP utilization is particularly relevant for computationally intensive algorithms.

**Block RAM (BRAM):**

BRAM provides dedicated on-chip memory for storing data and intermediate results.

Its utilization is important for memory-intensive FPGA applications.

### Performance Metrics

**Latency:**

The number of clock cycles or amount of time required to complete one operation.

Lower latency is generally preferred when response time is important.

**Initiation Interval (II):**

The number of clock cycles between starting consecutive operations in a pipelined implementation.

A smaller initiation interval can allow new operations to begin more frequently.

**Throughput:**

The number of operations or results processed per unit of time.

Higher throughput is desirable for applications requiring continuous processing.

**Maximum Clock Frequency (Fmax):**

The highest clock frequency at which the implemented hardware can satisfy timing constraints.

Fmax is influenced by the circuit's critical path, routing, and FPGA architecture.

**Critical observation:**

Latency, initiation interval, throughput, and Fmax describe different aspects of hardware performance.

They should not be treated as interchangeable measurements.

For example, a design may have a high clock frequency but still exhibit high latency because it requires many clock cycles to complete an operation.

---

## Benchmarking Methodology

A meaningful HLS benchmark comparison should consider the following experimental conditions.

**1. Equivalent computational workloads**

The implementations should perform the same function using comparable input data and problem sizes.

**2. Comparable FPGA targets**

The same FPGA model should be used whenever possible to avoid differences caused by hardware architecture.

**3. Consistent timing constraints**

Clock-frequency targets and other implementation constraints should be documented and kept comparable.

**4. Consistent optimization configurations**

Pipelining, loop unrolling, memory partitioning, and other synthesis directives should be recorded.

**5. Comparable implementation stages**

HLS estimates, post-synthesis reports, and post-place-and-route results should be distinguished.

**6. Multiple evaluation metrics**

Comparisons should include both hardware performance and resource utilization rather than relying on one measurement.

**7. Reproducible experimental conditions**

Tool versions, benchmark sources, FPGA devices, and relevant settings should be documented.

---

## Overall Limitations of the Literature

The three selected publications investigate related aspects of HLS but use different research methodologies.

Lahti and Hämäläinen focus on literature-based comparisons between HLS and manually written RTL.

Nane et al. evaluate multiple HLS tools using common benchmark applications.

Bai et al. introduce a benchmark dataset primarily intended for evaluating QoR prediction methods.

Consequently, their numerical results cannot be directly combined into one ranking of HLS tools.

The studies also cover different publication periods, tool versions, FPGA devices, and application workloads.

Furthermore, the selected literature does not provide a complete controlled comparison of current Vitis HLS, Bambu, and Dynamatic implementations.

A more direct tool comparison would require measurements collected under equivalent experimental conditions.

---

## Preliminary Conclusion

The reviewed literature suggests that Quality of Results in FPGA High-Level Synthesis must be evaluated through a combination of hardware performance, resource utilization, and experimental conditions.

HLS can improve hardware design productivity, but achieving competitive performance and resource efficiency often requires careful optimization of the source code and synthesis configuration.

Published research demonstrates that different HLS tools and optimization settings can generate hardware implementations with substantially different characteristics.

Systematic benchmarks and clearly defined metrics are therefore essential for meaningful evaluation.

Rather than identifying one universally superior HLS tool, QoR analysis should focus on understanding the trade-offs between latency, throughput, clock frequency, FPGA resource consumption, and development effort.

This provides a foundation for our seminar's investigation of modern HLS tools and their effects on FPGA hardware efficiency.

---

# Preliminary Outline for Section V

## V. Quality of Results and Benchmarking

### A. Quality of Results Evaluation Metrics

- FPGA resource utilization: LUTs, FFs, DSPs, and BRAM.
- Performance metrics: latency, initiation interval, throughput, and Fmax.
- Performance–resource trade-offs.

### B. Benchmarking Methodologies

- Standard FPGA HLS benchmark suites.
- Common computational workloads and FPGA targets.
- Consistent synthesis constraints and optimization settings.
- Differences between estimated and implemented QoR.

### C. Published Quantitative Results

- QoR and productivity comparisons from Lahti and Hämäläinen.
- Multi-tool evaluation methodology from Nane et al.
- HLSyn benchmark data and optimization configurations from Bai et al.
- Interpretation of performance and resource trade-offs.

### D. Challenges and Limitations

- Different FPGA architectures and tool versions.
- Differences in optimization configurations.
- Inconsistent measurement methodologies.
- Limitations of cross-study comparisons.
- Lack of a complete modern three-tool benchmark.

### E. Summary

QoR evaluation requires multiple performance and resource metrics, consistent benchmarking conditions, and critical interpretation of published results.
