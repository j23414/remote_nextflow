#!/usr/bin/env nextflow

// Use nf-core! Jeez the install took a while...pulling images, no because we overwrote...blah
include { SAMTOOLS_VIEW } from './modules/nf-core/samtools/view/main'

workflow {

    // The nf-core module expects input: tuple val(meta), path(bam), path(index)
    ch_bam = Channel
        .fromPath(params.input, checkIfExists: true)
        .map { file ->
            def meta = [id: file.baseName] // meta = metadata map...cool that's new or I'm out fo the loop
            return tuple(meta, file, []) // Return tuple: [meta, bam_file, index (null)]
        }
        .view { "Found BAM file: $it" }  // Add this line to debug

    // Create empty channels for fasta reference and qname (not needed for BAM->SAM)
    ch_fasta = Channel.value([[],[]])  // Empty tuple for meta2 and fasta
    ch_qname = Channel.value([])       // Empty list for qname. Oh weird
    ch_index_format = Channel.value([])  // Index format, not used but required

    // Run SAMTOOLS_VIEW to convert BAM to SAM
    // Could have piped from above, check if 'combine' is still a thing
    SAMTOOLS_VIEW(
        ch_bam,
        ch_fasta,
        ch_qname,
        ch_index_format
    )

    // Named outputs is normal now... so named inputs one day? Maybe a bad idea
    SAMTOOLS_VIEW.out.sam
        .view { meta, sam -> "Converted: ${meta.id}.sam" }
}

// On complete.
workflow.onComplete {
    println "Pipeline completed at: $workflow.complete"
    println "Execution status: ${ workflow.success ? 'SUCCESS' : 'FAILED' }"
    println "Results directory: ${params.outdir}"
}