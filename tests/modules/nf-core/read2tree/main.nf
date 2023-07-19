#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { READ2TREE } from '../../../../modules/nf-core/read2tree/main.nf'

workflow test_read2tree {
    
    fastq1 = [
                 [ id:'test', single_end:false ], // meta map
                 [file('/home/phanh/projects/nf-core-plantpathsurveil/scratch/test_read2tree/read2tree/tests/sample_1.fastq'), file('/home/phanh/projects/nf-core-plantpathsurveil/scratch/test_read2tree/read2tree/tests/sample_2.fastq')]
             ]                                                                                  
    fastq2 = [
                 [ id:'test', single_end:false ], // meta map
                 [file('/home/phanh/projects/nf-core-plantpathsurveil/scratch/test_read2tree/read2tree/tests/sample_1.fastq'), file('/home/phanh/projects/nf-core-plantpathsurveil/scratch/test_read2tree/read2tree/tests/sample_2.fastq')]
             ]
    markers = [
                 [ id:'test', single_end:false ], // meta map
                 file('/home/phanh/projects/nf-core-plantpathsurveil/scratch/test_read2tree/read2tree/tests/marker_genes')
              ]                                                                            
    READ2TREE ( fastq1, fastq2, markers )
    READ2TREE.out.out.view()
}
