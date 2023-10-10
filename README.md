## Application Platform Configuration Release

Enables configuration of a typical Application Platform:

- customize script (job: `common_script`)
  - Note: pre-start, post-deploy, post-start
- customize tomcat config (job: `tomcat_conf`)
- customize postgres config (job: `postgres_conf`)
  - Note: Requires operations/use-postgres.yml

For a description of these and other functions, see `jobs/`.

## Usage

Include the release:

```yaml
releases:
  name: ap-conf
  version: latest
```

## Examples

In this example, we configure our BOSH deployment manifest to update the tomcat settings:

```yaml
- type: replace
  path: /instance_groups/name=uaa/jobs/-
  value:
    name: common_script
    release: ap-conf
    properties:
      post_deploy_script: |-
        #!/bin/bash
        echo "test complete"

- type: replace
  path: /instance_groups/name=uaa/jobs/-
  value:
    name: tomcat_conf
    release: ap-conf
    properties:
      cce_enable: true
```

See `jobs/*/spec` for more examples.
