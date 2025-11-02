# Nextflow refresher


```bash
# Convert bam to sam, basic testing of nf-core SAMTOOLS module
nextflow run main.nf --input 'data/*.bam' -profile docker

 N E X T F L O W   ~  version 25.10.0

Launching `main.nf` [amazing_agnesi] DSL2 - revision: 02d2120813

executor >  local (2)
[8d/cc21ad] SAMTOOLS_VIEW (tim)  [100%] 2 of 2 ✔
Found BAM file: [[id:tim], /Users/jchang3/github/j23414/remote_nextflow/data/tim.bam, []]
Found BAM file: [[id:tiny], /Users/jchang3/github/j23414/remote_nextflow/data/tiny.bam, []]
Converted: tiny.sam
Converted: tim.sam
Pipeline completed at: 2025-11-01T23:08:47.676561-07:00
Execution status: SUCCESS
Results directory: results
```

# Nextflow run remote

Do not need to `git clone` the pipeline, other than having the input files.

```
nextflow run j23414/remote_nextflow \
  --input 'data/*.bam' \
  --outdir here \
  -profile docker
```

```
 N E X T F L O W   ~  version 25.10.0

Pulling j23414/remote_nextflow ...
 downloaded from https://github.com/j23414/remote_nextflow.git
Launching `https://github.com/j23414/remote_nextflow` [goofy_magritte] DSL2 - revision: d3e373ce3b [main]

executor >  local (2)
[fe/493634] SAMTOOLS_VIEW (tim)  [100%] 2 of 2 ✔
Found BAM file: [[id:tim], /Users/jchang3/github/j23414/remote_nextflow/data/tim.bam, []]
Found BAM file: [[id:tiny], /Users/jchang3/github/j23414/remote_nextflow/data/tiny.bam, []]
Converted: tiny.sam
Converted: tim.sam
Pipeline completed at: 2025-11-01T23:30:45.708223-07:00
Execution status: SUCCESS
Results directory: here
```