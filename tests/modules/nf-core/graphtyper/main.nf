#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GRAPHTYPER } from '../../../../modules/nf-core/graphtyper/main.nf'

workflow test_graphtyper {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
    ]

    GRAPHTYPER ( input )
}
