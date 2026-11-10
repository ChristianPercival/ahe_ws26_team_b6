\# IV. HLS Optimization Techniques



\*\*Primary author:\*\* Christian  

\*\*Peer reviewer:\*\* Seam  

\*\*Seminar topic:\*\* State of the Art in High-Level Synthesis



\## A. Loop Pipelining



\*\*Objective:\*\* Explain how loop pipelining improves hardware throughput by allowing multiple iterations of a loop to overlap.



\### Topics to cover



1\. \*\*Fundamental principles\*\*

&#x20;  - Explain how loop iterations are scheduled into overlapping execution stages.

&#x20;  - Introduce the initiation interval (II) and its relationship to throughput.

&#x20;  - Distinguish initiation interval from pipeline depth and execution latency.



2\. \*\*Scheduling constraints\*\*

&#x20;  - Explain how loop-carried dependencies restrict the achievable II.

&#x20;  - Discuss resource constraints, particularly limited functional units and memory ports.

&#x20;  - Introduce recurrence-constrained and resource-constrained minimum initiation intervals (recMII and resMII).



3\. \*\*Advanced pipelining approaches\*\*

&#x20;  - Explain why conventional static pipelining may struggle with irregular control flow and unpredictable memory dependencies.

&#x20;  - Introduce speculative loop pipelining as a method for exploiting additional parallelism.

&#x20;  - Discuss resource sharing and selective unpipelining as approaches to reduce hardware overhead.



4\. \*\*Benefits and limitations\*\*

&#x20;  - Improved throughput through overlapping iterations.

&#x20;  - Potential increases in hardware resource utilization.

&#x20;  - Restrictions caused by dependencies, memory access and resource availability.



\### Supporting research



\*\*Primary reference:\*\*



Leothaud et al. (2026) — \*Area Efficient Speculative Loop Pipelining for High-Level Synthesis.\*



\*\*Supporting reference:\*\*



Zhao et al. (2020) — \*Performance Modeling and Directives Optimization for High-Level Synthesis on FPGA.\*



\### Suggested figure



A conceptual comparison of sequential loop execution and pipelined loop execution, showing overlapping iterations and the initiation interval.



\---



\## B. Loop Unrolling



\*\*Objective:\*\* Explain how loop unrolling increases hardware parallelism and why the degree of unrolling must be selected carefully.



\### Topics to cover



1\. \*\*Fundamental principles\*\*

&#x20;  - Define loop unrolling as the replication of loop-body operations.

&#x20;  - Explain full and partial loop unrolling.

&#x20;  - Introduce the unrolling factor and its relationship to parallel hardware operations.



2\. \*\*Hardware implications\*\*

&#x20;  - Discuss how unrolling can increase computational parallelism.

&#x20;  - Explain why unrolling may require additional arithmetic units, registers and routing resources.

&#x20;  - Discuss how memory bandwidth and available memory ports can restrict parallel execution.



3\. \*\*Interaction with memory partitioning\*\*

&#x20;  - Explain why parallel operations may require simultaneous access to different memory banks.

&#x20;  - Introduce the relationship between multidimensional memory partitioning and loop unrolling.

&#x20;  - Discuss memory-bank switching and the associated routing overhead.



4\. \*\*Performance and energy trade-offs\*\*

&#x20;  - Explain why greater unrolling does not necessarily reduce execution time.

&#x20;  - Discuss the influence of memory dependencies and initiation interval.

&#x20;  - Examine why different unrolling factors may optimize latency, area or energy differently.



\### Supporting research



\*\*Primary references:\*\*



Cilardo and Gallo (2015) — \*Interplay of Loop Unrolling and Multidimensional Memory Partitioning in HLS.\*



Guha and Guerrieri (2025) — \*Precision Unwound: Fine-Tuning Loop Unrolling for Energy-Efficient FPGA-Based PQC Using HLS.\*



\*\*Supporting reference:\*\*



Zhao et al. (2020) — \*Performance Modeling and Directives Optimization for High-Level Synthesis on FPGA.\*



\### Suggested figure



A conceptual comparison of a conventional loop, a partially unrolled loop and a fully unrolled loop, illustrating the increase in parallel operations and potential hardware resource requirements.



\---



\## C. Dataflow Optimization



\*\*Objective:\*\* Explain how HLS dataflow architectures enable concurrent execution of computational stages.



\### Topics to cover



1\. \*\*Fundamental principles\*\*

&#x20;  - Introduce dataflow processing as an approach in which separate computational stages execute concurrently.

&#x20;  - Explain the relationship between data dependencies and communication between processing stages.

&#x20;  - Describe streaming data transfers and FIFO-based communication.



2\. \*\*Dataflow architecture\*\*

&#x20;  - Explain how an algorithm can be divided into independent or partially dependent processing stages.

&#x20;  - Discuss how pipelining can occur within individual stages while dataflow enables concurrency between stages.

&#x20;  - Describe the role of buffering in maintaining continuous execution.



3\. \*\*Practical application\*\*

&#x20;  - Introduce sparse matrix-vector multiplication as an example of a memory-intensive application.

&#x20;  - Explain how a streaming dataflow architecture can combine computation and memory transfers.

&#x20;  - Discuss how pipelining and streaming can improve memory-bandwidth utilization.



4\. \*\*Benefits and limitations\*\*

&#x20;  - Potential improvements in throughput through concurrent execution.

&#x20;  - Reduced waiting between processing stages.

&#x20;  - Performance restrictions associated with memory bandwidth, data dependencies and buffering.

&#x20;  - Additional architectural complexity when adapting conventional software algorithms to streaming hardware.



\### Supporting research



\*\*Primary reference:\*\*



Hosseinabady and Nunez-Yanez (2020) — \*A Streaming Dataflow Engine for Sparse Matrix-Vector Multiplication Using High-Level Synthesis.\*



\*\*Supporting reference:\*\*



Zhao et al. (2020) — \*Performance Modeling and Directives Optimization for High-Level Synthesis on FPGA.\*



\### Suggested figure



A simplified streaming dataflow architecture:



Input data → Processing Stage 1 → FIFO → Processing Stage 2 → FIFO → Output



The figure should illustrate overlapping execution and communication between stages.



\---



\## D. Advanced Loop Transformations



\*\*Objective:\*\* Briefly introduce developments that extend conventional HLS optimization beyond individual loops.



\### Topics to cover



1\. \*\*Limitations of conventional scheduling\*\*

&#x20;  - Explain why multiple loops with irregular memory dependencies may be executed sequentially.

&#x20;  - Discuss the difficulty of identifying safe parallel execution opportunities during compilation.



2\. \*\*Dynamic loop fusion\*\*

&#x20;  - Introduce dynamic loop fusion as an approach for executing multiple loops concurrently.

&#x20;  - Explain the role of runtime memory-dependency checking.

&#x20;  - Describe how compiler and hardware co-design can expose additional parallelism.



3\. \*\*Practical constraints\*\*

&#x20;  - Discuss memory-address monotonicity requirements.

&#x20;  - Mention limitations concerning automatic loop unrolling and internal buffering.



\### Supporting research



\*\*Primary reference:\*\*



Szafarczyk et al. (2025) — \*Dynamic Loop Fusion in High-Level Synthesis.\*



\### Suggested figure



Two separate loops executing sequentially compared with a dynamically fused implementation that allows their operations to overlap.



\---



\## E. Optimization Interactions and Trade-offs



\*\*Objective:\*\* Bring together the findings from the different optimization techniques and explain why HLS optimization requires balancing multiple hardware objectives.



\### Topics to cover



1\. \*\*Interaction between optimization techniques\*\*

&#x20;  - Explain why pipelining, unrolling and memory partitioning cannot always be optimized independently.

&#x20;  - Discuss how one optimization may alter the effectiveness of another.



2\. \*\*Performance versus resource utilization\*\*

&#x20;  - Explain why reducing latency or increasing throughput may increase hardware costs.

&#x20;  - Discuss the importance of selecting optimization directives according to the target application's constraints.



3\. \*\*Design-space exploration\*\*

&#x20;  - Introduce the challenge of selecting suitable optimization configurations.

&#x20;  - Explain how analytical modeling can support optimization decisions.

&#x20;  - Briefly introduce the COMBA framework as an example.



4\. \*\*Key observations from the reviewed literature\*\*

&#x20;  - Increasing parallelism does not guarantee improved efficiency.

&#x20;  - Memory architecture can limit optimization benefits.

&#x20;  - Different workloads require different optimization configurations.

&#x20;  - Hardware efficiency must be evaluated using multiple performance and resource metrics.



\### Supporting research



\*\*Primary reference:\*\*



Zhao et al. (2020) — \*Performance Modeling and Directives Optimization for High-Level Synthesis on FPGA.\*



\*\*Supporting references:\*\*



Cilardo and Gallo (2015); Guha and Guerrieri (2025); Leothaud et al. (2026).



\### Connection to Section V — Quality of Results



This subsection should conclude by establishing why the effectiveness of HLS optimizations must be assessed using quantitative performance and resource metrics.



The detailed analysis of those metrics, including LUTs, FFs, DSPs, BRAM, latency, initiation interval and maximum operating frequency, belongs in Seam's Quality of Results section.



\---



\## Preliminary Section Conclusion



The reviewed literature demonstrates that loop pipelining, loop unrolling and dataflow optimization provide different ways of exploiting hardware parallelism in FPGA implementations.



However, the effectiveness of these techniques depends on algorithmic dependencies, memory architecture, hardware resource constraints and the interactions between optimization directives.



Consequently, HLS optimization should be treated as a design-space exploration problem rather than a process of maximizing parallel execution without considering hardware costs.



The next section evaluates how the resulting hardware quality can be assessed through performance and resource-utilization metrics.

