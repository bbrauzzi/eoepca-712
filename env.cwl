$graph:

- class: Workflow
  id: eoepca719
  inputs:
    message:
      type: string
  outputs:
  - id: wf_outputs
    outputSource:
    - step_1/results
    type:
      Directory
  steps:
    step_1:
      in:
        message: message
      out:
      - results
      run: '#env-clt'
- class: CommandLineTool
  id: env-clt
  baseCommand: env
  inputs:
    message: string
  outputs:
    results:
      outputBinding:
        glob: .
      type: Directory

  requirements:
    DockerRequirement:
        dockerPull: ubuntu:latest


  stdout: output.txt

cwlVersion: v1.0

$namespaces:
  s: https://schema.org/
s:softwareVersion: 0.3.0
schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf