process READ2TREE {
    tag "$meta.id"
    label 'process_low'

    conda "bioconda::read2tree=0.1.5"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/read2tree:0.1.5--pyhdfd78af_0':
        'biocontainers/read2tree:0.1.5--pyhdfd78af_0' }"

    input:
    tuple val(meta),  path(fastq1, stageAs: 'read1_??.fa')
    tuple val(meta2), path(fastq2, stageAs: 'read2_??.fa')
    tuple val(meta3), path(markers)

    output:
    tuple val(meta), path("${prefix}_read2tree"), emit: out
    path "versions.yml"            , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    prefix = task.ext.prefix ?: "${meta.id}"
    """
    read2tree \\
        --${args} \\
        --tree \\
        --reads ${fastq1} ${fastq2} \\
        --standlone_path ${markers} \\
        --output_path ${prefix}_read2tree
    
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        read2tree: \$(echo \$(read2tree --version))
    END_VERSIONS
    """
}
