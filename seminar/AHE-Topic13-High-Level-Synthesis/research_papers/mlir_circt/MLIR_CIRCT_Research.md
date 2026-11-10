# Emerging Compiler Technologies: MLIR and CIRCT

## Literature Review and Critical Analysis

**Researcher:** Mir Sharjil Hasan  
**Seminar topic:** State of the Art in High-Level Synthesis  
**Research area:** MLIR, CIRCT, Emerging Compiler Infrastructures  
**Number of papers reviewed:** 4

---

## 1. MLIR: Scaling Compiler Infrastructure for Domain Specific Computation (2021)

**Authors:** Chris Lattner, Mehdi Amini, Uday Bondhugula, Albert Cohen, Andy Davis, Jacques Pienaar, River Riddle, Tatiana Shpeisman, Nicolas Vasilache, and Oleksandr Zinenko  
**Citation key:** `Lattner2021MLIR`

### Research Objective

Introduce and motivate Multi-Level Intermediate Representation (MLIR) as a reusable and extensible compiler infrastructure. The authors aim to overcome fragmentation between domain-specific compilers and the limitations of representing all problems at a single level of abstraction, particularly when targeting heterogeneous computing systems.

### Methodology

This is predominantly a **compiler-infrastructure and design paper**, not an FPGA HLS benchmark. It explains MLIR's design principles, representation model, dialects, extensible operations, types and attributes, SSA-based values and nested regions, and progressive lowering between abstraction levels. It motivates the framework with examples from different compiler domains.

### Main Findings

- **Multiple abstraction levels:** MLIR allows a compiler to retain high-level structural information until relevant optimizations have been applied, rather than lowering everything immediately to low-level instructions.
- **Extensible dialects:** Different domains may define their own operations, types and attributes within a shared compiler framework.
- **Shared infrastructure:** Parsing, printing, pass management, verification, diagnostics and related compiler utilities can be reused instead of reimplemented separately.
- **Progressive lowering:** Representations can be converted through several stages, making different analyses and transformations possible at different points in compilation.
- **Motivation for hardware design:** These capabilities provide infrastructure on which hardware-oriented compiler projects can be built; the paper does **not** itself demonstrate an FPGA speedup caused by MLIR alone.

### Limitations

**Identified in the research:**

- Flexibility also creates a risk of incompatible abstractions or fragmentation between independently developed dialects.
- Designing correct representations, transformations and semantics remains a difficult engineering problem.
- The paper emphasizes architectural rationale and use cases, not a controlled comparison of FPGA area, latency or power against a conventional HLS tool.

**Critical observation:** MLIR should be described as an **enabling compiler infrastructure**, not as an HLS compiler that directly turns arbitrary C/C++ into an FPGA bitstream. Claims that MLIR always produces faster or smaller hardware cannot be justified from this source.

### Relevance to Our Seminar

This is the theoretical foundation for our section. It explains **why a multi-level compiler infrastructure may provide better opportunities for HLS optimization and improved compiler-development productivity**, which the applied ScaleHLS and SODA-OPT papers subsequently investigate.

---

## 2. ScaleHLS: A New Scalable High-Level Synthesis Framework on Multi-Level Intermediate Representation (2022)

**Authors:** Hanchen Ye, Cong Hao, Jianyi Cheng, Hyunmin Jeong, Jack Huang, Stephen Neuendorffer, and Deming Chen  
**Citation key:** `Ye2022ScaleHLS`

### Research Objective

Develop a scalable HLS framework that performs optimizations at multiple levels of program representation and reduces reliance on manual rewriting and manually chosen synthesis directives. The authors target large computation kernels and neural-network models whose design spaces are difficult to optimize using a single-level compiler representation.

### Methodology

The researchers implement **ScaleHLS on MLIR**, with a front end for synthesizable HLS C, an analysis and transformation library, a design-space-exploration (DSE) engine, a quality-of-results (QoR) estimator, and a C/C++ emission backend that uses a downstream HLS tool for RTL generation.

The compiler applies transformations at three levels:

1. **Graph level:** restructures tasks or operations and explores parallelism at a higher design level.
2. **Loop level:** performs transformations such as loop permutation, tiling and unrolling.
3. **Directive level:** configures downstream HLS mechanisms such as loop pipelining and array partitioning.

Evaluation includes **six PolyBench-C computation kernels** (BICG, GEMM, GESUMMV, SYR2K, SYRK and TRMM) on a **Xilinx XC7Z020 FPGA**, and **three neural-network models** (ResNet-18, VGG-16 and MobileNet) on a **Xilinx VU9P** target. Hardware performance/resource data are collected using Vivado HLS synthesis results.

### Main Findings

- **Computation kernels:** The paper reports **41.7× to 768.1× speedups** across the six 4096-sized PolyBench kernels relative to the unoptimized C baselines without DSE or manual code rewriting (Table III). These are benchmark-specific cycle-count improvements, not universal end-to-end application speedups.
- **GEMM case study:** The DSE-optimized design requires approximately **1.610 × 10⁹ cycles**, versus **1.237 × 10¹²** for the unoptimized design and **2.684 × 10⁹** for the manually optimized design. It uses **217 of 220 DSPs (98.6%)** (Table IV). This illustrates the performance–resource trade-off and the ability of DSE to exploit available hardware.
- **Neural networks:** The authors report **1505.3× to 3825.0× throughput speedups** for the evaluated models relative to versions compiled through ScaleHLS **without its multi-level optimizations**, not relative to all other HLS systems (Table V and text).
- **Automation:** The authors report **37.3–60.8 seconds** for their optimization passes on the three neural-network designs, measured with MLIR pass timing; this is **not** the total time for FPGA place-and-route or bitstream creation.
- **Complementary optimizations:** The paper's ablation study assigns different performance contributions to graph, loop and directive-level transformations, indicating that these layers interact rather than producing a single fixed gain.

### Limitations

**Identified in the research:**

- ScaleHLS **relies on external HLS tools to generate RTL**; at the time of the study it did not provide a complete direct MLIR-to-RTL solution.
- The custom C front end accepts **a restricted synthesizable subset of C**; unsupported structures such as certain pointer-to-pointer cases are rejected.
- Significant acceleration is relative to relatively unoptimized baselines, so the headline speedups should not be interpreted as gains over a thoroughly tuned commercial HLS implementation.
- Evaluation uses specific FPGA devices, kernels and neural networks; transferability to other workloads and toolchains remains unproven by this evaluation.
- Strong gains may require substantial hardware resources. The GEMM example deliberately uses nearly all available DSPs.

**Critical observation:** The study provides compelling evidence of the **potential** of MLIR-enabled multi-level optimization and automated DSE, but not proof that MLIR itself is superior in every HLS application. The optimization algorithms, backend and chosen baseline all influence results.

### Relevance to Our Seminar

This is our **strongest directly quantitative study**. It links the MLIR architecture to practical HLS optimization, FPGA resource utilization, automated design exploration, and design productivity. It also explicitly proposes future **CIRCT-based RTL-level representation and optimization** as a research direction, connecting our two assigned technologies.

---

## 3. An MLIR-based Compiler Flow for System-Level Design and Hardware Acceleration (2022)

**Authors:** Nicolas Bohm Agostini, Serena Curzel, Vinay Amatya, Cheng Tan, Marco Minutoli, Vito Giovanni Castellana, Joseph Manzano, David Kaeli, and Antonino Tumeo  
**Citation key:** `Agostini2022SODAOPT`

### Research Objective

Reduce the manual effort required to identify, partition, optimize and synthesize hardware accelerators from higher-level application frameworks. The authors introduce **SODA-OPT**, an MLIR-based compiler system intended to improve accelerator generation while supporting more than one HLS backend.

### Methodology

SODA-OPT extends MLIR with a dedicated **SODA dialect** and transformation passes. Its flow searches for candidate computational kernels, **outlines** sections suitable for acceleration, performs **tiling**, separates host code from accelerator code, applies optimization sequences, and feeds optimized intermediate representations to HLS backends. A DSE engine tunes compiler passes and parameters.

The researchers evaluate **LeNet** outlining/fusion and convolution tiling, together with **PolyBench linear algebra kernels** synthesized using backends including **Bambu** and **Vitis HLS**. Their work discusses both FPGA and ASIC targets. They compare SODA-OPT against standalone HLS tools and ScaleHLS, while acknowledging that the backend choice affects observed performance.

### Main Findings

- **Automatic partitioning:** SODA-OPT can identify and outline regions of high-level programs to create accelerators, instead of requiring all accelerator boundaries to be manually defined.
- **System-level design:** Separating host and accelerator portions enables a broader workflow than loop-only optimization.
- **LeNet example:** Outlining/fusing the entire network produces about **1.26× speedup** relative to generating accelerators for individual operations in the reported FPGA experiment (Table 4 and Sec. 4.1).
- **PolyBench performance:** Some individual synthesized accelerators achieve **up to 60× speedup** against their relevant baseline. The authors report average speedups of approximately **25× versus standalone Bambu for FPGA**, **18× versus standalone Bambu for ASIC**, and **2× versus standalone Vitis HLS** under the particular test conditions (Sec. 4.2). These comparisons should not be treated as interchangeable.
- **Backend comparisons:** In the paper's evaluation SODA-OPT outperforms ScaleHLS on **6 of 11 benchmark families**, and in **70% of 44** individual synthesized designs. The authors also note that standalone Vitis HLS can have stronger baseline results than some other evaluated HLS flows.
- **Hardware cost:** Table 6 documents LUT overhead and performance gains. Some optimized examples demand substantially more LUTs, revealing trade-offs between speed and area.

### Limitations

**Identified in the research:**

- Benefits differ across algorithms: kernels with loop bounds dependent on outer induction variables (e.g., some SYRK/SYR2K/SYMM cases) show small or no gains from the presented pipeline.
- Larger speedups may require additional hardware resources; higher throughput and a smaller circuit are not necessarily achieved simultaneously.
- Results are influenced by tool versions, selected backends, target technologies, kernel dimensions and compared baselines.
- The paper describes **CIRCT-HLS as an emerging integration possibility**, not as an already evaluated SODA-OPT backend in its experiments.

**Critical observation:** SODA-OPT provides better evidence for **cross-backend high-level optimization and system-level partitioning** than for the specific merits of CIRCT. It also shows why a fair comparison must control the HLS backend and the resource metric.

### Relevance to Our Seminar

SODA-OPT adds a second **MLIR-based HLS use case** to complement ScaleHLS. It emphasizes **design productivity, portability across synthesis backends, accelerator outlining, and optimization of high-level representations**. Its comparison table and discussion of CIRCT-HLS also provide context for emerging hardware compiler flows.

---

## 4. Is It a Good Idea to Build an HLS Tool on Top of MLIR? Experience from Building the Dynamatic HLS Compiler (2026)

**Authors:** Jiahui Xu, Emmet Murphy, and Lana Josipović  
**Citation key:** `Xu2026Dynamatic`

### Research Objective

Evaluate the **practical advantages and difficulties of implementing an HLS compiler on MLIR** through the developers' experience building **Dynamatic**, a compiler for dynamically scheduled dataflow circuits. Rather than presenting a new benchmark competition, the paper critically assesses MLIR as software infrastructure for an HLS project.

### Methodology

The researchers present an **engineering-experience report with concrete case studies** from the Dynamatic compiler. Dynamatic uses a specialized **Handshake dialect** to represent dataflow units and channels. Its circuits can execute operations when their input tokens are available, which is useful for workloads with irregular control flow and memory access. The paper describes six case studies covering representation, analysis, rewriting, frontend support and cross-project integration.

### Main Findings

- **Benefits of MLIR:** Standardized dialect infrastructure, operations and transformation passes reduce compiler implementation effort; the authors find these features particularly valuable for a research tool developed substantially by students.
- **Graph-edge annotations:** MLIR's value model does not naturally attach attributes to graph edges, complicating storage of memory-dependence information and profiling data. Dynamatic uses workarounds such as naming operations and maintaining external information (Sec. 4.1).
- **Software-to-circuit conversion:** Converting control-flow block arguments into multiplexers is more complicated than desired because related values are not represented in a directly convenient form for local pattern rewrites (Sec. 4.2).
- **Cross-repository integration:** Combining dialects and passes from independently developed MLIR projects may be fragile when versions of LLVM/MLIR and APIs differ (Sec. 4.3).
- **C frontends and LLVM:** The authors find available C-to-MLIR frontends insufficient for some HLS analyses, requiring continued dependence on LLVM IR and introducing its restrictions into parts of the flow (Sec. 4.4).

### Limitations

**Identified in the research:**

- This is a **qualitative experience report**, not a controlled experimental measurement of LUTs, DSPs, latency, power or universal compiler productivity.
- Its conclusions reflect the specific requirements of **Dynamatic** and the MLIR version examined by the authors; other HLS architectures may have different constraints.
- The paper identifies design challenges and workarounds but does not experimentally prove that an alternative compiler infrastructure is universally better than MLIR.

**Critical observation:** This paper prevents an overly positive review. It demonstrates that **support for custom dialects is not the same as seamless interoperability** and that building correct hardware-oriented transformations still requires substantial engineering work.

### Relevance to Our Seminar

This is the **critical counterpoint** to the positive ScaleHLS and SODA-OPT results. It directly addresses **design productivity, framework integration, representation suitability, and practical barriers** in state-of-the-art HLS compilers. Its discussion of independent projects, including **CIRCT**, is relevant when considering MLIR-based tool ecosystems.

---

## CIRCT: Hardware-Oriented Compiler Infrastructure

This section draws on official CIRCT technical documentation and references in the reviewed papers. It is **not a fifth experimental research paper**.

### What CIRCT Contributes

**CIRCT (Circuit IR Compilers and Tools)** extends the LLVM/MLIR approach to digital hardware development. It offers hardware-specific dialects and compilation passes that can express circuits more naturally than a purely software-oriented IR. The official project distinguishes several dialects, including:

- **`hw`:** modules, instances and shared hardware constructs;
- **`comb`:** combinational logic;
- **`seq`:** sequential logic;
- **`sv`:** SystemVerilog-oriented constructs;
- **`handshake`:** token-based/dataflow circuit concepts used in dynamic HLS flows.

CIRCT supports hardware lowering and SystemVerilog emission as parts of its broader tooling. Its role is conceptually distinct from MLIR: **MLIR provides general extensible compiler infrastructure; CIRCT provides hardware-oriented representations and transformations built in that ecosystem.** Neither alone should be described as a universally complete C-to-FPGA toolchain.

### Relationship to HLS

A possible MLIR/CIRCT-oriented HLS pipeline starts with high-level source or a domain-specific language, passes through high-level MLIR representations and optimizations, lowers into hardware-oriented CIRCT representations, and then emits RTL for downstream synthesis and implementation. **This is a conceptual family of flows, not a single mandatory pipeline.** CIRCT's official HLS documentation describes several evolving approaches, including dynamically scheduled flows, and explicitly warns that many are research projects rather than production-ready systems.

The ScaleHLS paper (2022) identifies **direct RTL generation and RTL-level optimization with CIRCT as future work**. SODA-OPT (2022) discusses possible future integration with CIRCT-HLS, **not a completed benchmark result for such an integration**. The Dynamatic (2026) paper illustrates a real MLIR-based dataflow HLS compiler and its difficulties when integrating with other projects, including CIRCT.

### Benefits and Limitations

**Potential benefits:** domain-specific circuit abstractions; reuse of hardware compilation passes; interoperability in principle with other MLIR-based tools; structured lowering to RTL.  
**Current limitations:** immature or research-stage HLS flows; tool/version compatibility issues; no quantitative FPGA efficiency claim established by these four uploaded papers for CIRCT alone.

**Sources (technical, not counted as research papers):**

- CIRCT overview: [https://circt.llvm.org/](https://circt.llvm.org/)
- CIRCT HLS flows: [https://circt.llvm.org/docs/HLS/](https://circt.llvm.org/docs/HLS/)
- CIRCT dialect index: [https://circt.llvm.org/docs/Dialects/](https://circt.llvm.org/docs/Dialects/)
- CIRCT HW dialect rationale: [https://circt.llvm.org/docs/Dialects/HW/RationaleHW/](https://circt.llvm.org/docs/Dialects/HW/RationaleHW/)
- CIRCT Handshake dialect: [https://circt.llvm.org/docs/Dialects/Handshake/](https://circt.llvm.org/docs/Dialects/Handshake/)

---

# Overall Literature Analysis

## Common Findings

### 1. Preserving abstraction levels can enable more appropriate HLS transformations

The MLIR foundation paper argues for retaining useful structural information rather than prematurely lowering programs. ScaleHLS implements this idea by applying graph, loop and directive-level optimization in separate representations; SODA-OPT uses progressive lowering for system-level accelerator partitioning. **The connection is supported, but the measured performance gains belong to the full compiler flows, not to MLIR in isolation.**

### 2. Automated design-space exploration can improve performance and reduce manual optimization work

ScaleHLS and SODA-OPT both automate parameter selection and transformation sequences. ScaleHLS reports strong cycle/throughput improvements against defined baseline implementations, and SODA-OPT reports accelerator performance improvements across several tools. These results suggest productivity benefits, but the studies do not share a common measurement of developer hours across identical tasks.

### 3. Hardware efficiency requires balancing speed and resource use

The ScaleHLS GEMM example uses almost all DSPs on its target FPGA. SODA-OPT reports LUT overhead that can grow substantially under aggressive transformations. Therefore a statement such as “MLIR improves hardware efficiency” needs a **specific metric**: fewer cycles, lower latency, more throughput, fewer LUTs/DSPs, or better performance per resource. Optimizing one may worsen another.

### 4. Extensible compiler infrastructure does not eliminate integration difficulties

MLIR's dialects promise code reuse, but Dynamatic reports awkward edge annotation, nontrivial software-to-hardware conversion, version mismatches between repositories, and dependence on LLVM frontend infrastructure. Such engineering costs matter when evaluating **design productivity**, especially for research teams.

### 5. CIRCT is an important hardware-oriented complement, but quantitative evidence here is limited

The uploaded papers support discussing CIRCT's role in the MLIR ecosystem, but **none of the four independently benchmarks CIRCT against Vitis HLS, Bambu and Dynamatic on identical FPGA workloads**. This is an evidence gap, not a reason to invent a comparison.

## Cross-Paper Comparison

| Source                                | Type of contribution                           | Optimizations or concern                                                      | Evidence on hardware QoR                              | Main caution                                                                         |
| ------------------------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------ |
| Lattner et al. (2021)                 | General compiler infrastructure                | Multiple IR levels, dialects, progressive lowering                            | No FPGA HLS benchmark                                 | MLIR is infrastructure, not an FPGA speedup by itself                                |
| Ye et al. (2022), ScaleHLS            | Implemented MLIR-based HLS flow                | Graph, loop, directive optimizations and DSE                                  | Speedup and resource tables on FPGA targets           | Strong results versus selected unoptimized baselines; relies on external RTL backend |
| Bohm Agostini et al. (2022), SODA-OPT | Implemented compiler flow                      | Outlining, tiling, host/kernel partitioning, pass tuning                      | FPGA/ASIC backend comparisons, latency and LUTs       | Backend and workload strongly affect outcomes                                        |
| Xu et al. (2026), Dynamatic           | Developer experience and criticism             | Dynamic dataflow compiler; representation and integration problems            | No controlled comparative QoR benchmark in this paper | Qualitative evidence from one project                                                |
| CIRCT official docs                   | Hardware compiler infrastructure documentation | Hardware dialects, lowering, SystemVerilog generation, experimental HLS flows | No independently controlled benchmark in cited docs   | Documentation, not a fifth peer-reviewed experiment                                  |

## Overall Limitations of This Literature

1. **Different metrics:** ScaleHLS emphasizes speedup and throughput; SODA-OPT reports synthesized delay/cycles and LUT overhead; Dynamatic evaluates software engineering difficulties. The outcomes are not directly comparable numerically.
2. **Different baselines and hardware:** The platforms, HLS backends, benchmark sizes, tool versions, optimization settings and resource budgets differ. Large speedups relative to unoptimized baselines are not equivalent to superiority over best-practice manually tuned designs.
3. **Insufficient CIRCT-specific experimental evidence:** The primary papers discuss CIRCT or related dialects but do not provide a uniform benchmark of CIRCT's FPGA QoR against conventional tools.
4. **Study types differ:** A general infrastructure paper, two compiler implementations with experiments, and an engineering-experience report answer different questions. Treating them as four interchangeable benchmark studies would be misleading.
5. **Temporal evolution:** The papers span 2021–2026; compiler interfaces and HLS flows evolve. Older statements about future CIRCT integration should not automatically be read as descriptions of current integration status.

## Preliminary Conclusion

The reviewed work shows **why MLIR is attractive for emerging HLS toolchains**: it supports specialized intermediate representations, multiple levels of optimization, reusable infrastructure, and progressive lowering. **ScaleHLS** demonstrates substantial potential gains through automated multi-level optimization, while **SODA-OPT** shows how MLIR can support system-level kernel outlining, portability across HLS backends and optimization tuning. However, these improvements are workload- and baseline-dependent and often involve resource trade-offs. **Dynamatic** adds an important warning: MLIR's flexibility does not automatically resolve graph representation, frontend or interoperability challenges. **CIRCT** provides complementary hardware-oriented dialects and lowering infrastructure, but the four reviewed papers do not justify a numerical claim that CIRCT alone outperforms established HLS tools. Thus, the literature supports viewing MLIR and CIRCT as **promising and evolving infrastructures for HLS development**, while calling for more controlled, cross-tool FPGA benchmarking.
