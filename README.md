# DKOscreen.fusion_detection
Scripts to process sequencing reads for double KO screening experiment, separating fusion from designed guide RNA pairs.

# DEMO
Follow `main.sh` to run the scripts in order. Demo input is stored in the raw_data folder and demo output is stored in the oupput folder. CPU time of the demo on a normal destop should not exceed 5 minutes. BLAST was the most time-consuming step which could be parallelized. 

# Dependencies
The code was tested with the following environment and software:
- GNU bash, version 4.2.46(2)-release (x86_64-redhat-linux-gnu)
- blast version 2.6.0
- cutadapt version 1.16
- R version 3.3.1 with packages ggplot2_3.3.0, data.table_1.12.8 and plyr_1.8.6

No non-standard hardware is required. No additional installation is required. 

