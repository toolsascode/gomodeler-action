
<p align="center"><a href="https://github.com/toolsascode/protomagic"><image src="https://raw.githubusercontent.com/toolsascode/protomagic/main/assets/protomagic.png" style="width: 100px;"></a></p>

# Go Modeler for GitHub Action

GoModeler is a small CLI to facilitate the compilation of templates using the go template engine.

**See more:** <https://github.com/toolsascode/gomodeler>

## Changelog

Please refer to the [release page](https://github.com/toolsascode/gomodeler/releases) for the latest release notes.

## Usage

```yaml
- uses: toolsascode/gomodeler-action@v1
  with:
    # By default, Golang installation is enabled for binary installation via `go install` command.
    # Default: true
    go-setup: true
    # Expected log level in application output.
    # Currently the following options are supported: debug, info, warn, error, fatal or panic
    # Default: info
    log-level: info
    # List of environment variables in key=value format
    # Default: ''
    environments: |
        key=value
    # Environment variables file in YAML or JSON format.
    # Default: ''
    environment-file: /path/to/envFile.yaml
    # gotemplate code block to be rendered
    # Default: ''
    template: |
        {{ .key }}
    # List of template files for rendering.
    # Default: ''
    template-file: /path/to/templates/file.ext.gotmpl
    # Path of template files for rendering.
    # Default: ''
    template-path: /path/to/templates
    # The path where the rendered files will be stored.
    # Default: "./outputs"
    output-path: /path/to/outputs
    # Add rendered content to GITHUB_STEP_SUMMARY output.
    # Default: false
    github-step-summary: false
```

## Examples

### Render templates

- This model is useful for those who only expect to compile the file and use the file for other tasks.

```yaml
- uses: toolsascode/gomodeler-action@v1
  with:
    log-level: info
    environment-file: /path/to/envFile.yaml
    template-path: /path/to/templates
    output-path: /path/to/outputs
```

### Add rendered content to GitHub Step Summary

- In this case, in addition to compiling, the file is automatically added to GITHUB_STEP_SUMMARY.

```yaml
- uses: toolsascode/gomodeler-action@v1
  with:
    log-level: info
    environment-file: /path/to/envFile.yaml
    template-path: /path/to/templates
    output-path: /path/to/outputs
    github-step-summary: true
```

**See example:** <https://github.com/toolsascode/gomodeler-action/actions/runs/10893938906>

## License
The scripts and documentation in this project are released under the [MIT License](./LICENSE.md)
