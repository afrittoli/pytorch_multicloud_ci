# How to use this template

Run the init.sh script:

```bash
./init.sh "Presentation Title" filename
```

and remove this paragraph.
Note that "filename" may not include underscore signs.

# Collaborative Infrastructure at Scale: PyTorch's Multi-Cloud CI Model

Talk slides are available in [pdf](collaborative_infra.pdf).
A [script](demo_script.md) is available for the demo parts.

## Rebuilding the slides

Install xelatex with most of the plugins via your distro.
Either xelatex or lualatex are required for the fontspec package to work.

Install the IBMPlex font from https://github.com/IBM/plex.

To build the example just run:

```shell
% xelatex collaborative_infra.tex
```

the output will be [collaborative_infra.pdf](collaborative_infra.pdf).
