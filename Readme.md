# Build Riemann container out of a config repository

This is a [s2i](https://github.com/openshift/source-to-image) builder for
[Riemann](https://riemann.io) configs.

Use either the following files as main Riemann config file
 * `riemann.config`
 * `main.clj`
or set `RIEMANN_CONFIG_FILE` in `.sti/environment` or as environment
variable.
