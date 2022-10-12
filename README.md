# docker-jsonlint

[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

Dockerized [jsonlint](https://github.com/prantlf/jsonlint), easy to use and easy to integrate with CI.

View **[Dockerfile](https://github.com/TheBlackMini/jsonlint/blob/main/Dockerfile)** on GitHub.

## Table of Contents

- [docker-jsonlint](#docker-jsonlint)
  - [Table of Contents](#table-of-contents)
    - [Usage](#usage)
      - [Options](#options)
    - [Command line](#command-line)
      - [Lint single file](#lint-single-file)
      - [Lint folder of files](#lint-folder-of-files)
    - [Continuous Integration (CI)](#continuous-integration-ci)
      - [GitLab CI](#gitlab-ci)
  - [Build](#build)

### Usage

Usage: `jsonlint [options] [<file, directory, pattern> ...]`

#### Options

    -f, --config [file]          read options from a custom configuration file
    -F, --no-config              disable searching for configuration file
    -s, --sort-keys              sort object keys (not when prettifying)
    -E, --extensions [ext]       file extensions to process for directory walk
                                  (default: ["json","JSON"])
    -i, --in-place               overwrite the input files
    -j, --diff                   print difference instead of writing the output
    -k, --check                  check that the input is equal to the output
    -t, --indent [num|char]      number of spaces or specific characters
                                  to use for indentation (default: 2)
    -c, --compact                compact error display
    -M, --mode [mode]            set other parsing flags according to a format
                                  type (default: "json")
    -B, --bom                    ignore the leading UTF-8 byte-order mark
    -C, --comments               recognize and ignore JavaScript-style comments
    -S, --single-quoted-strings  support single quotes as string delimiters
    -T, --trailing-commas        ignore trailing commas in objects and arrays
    -D, --no-duplicate-keys      report duplicate object keys as an error
    -V, --validate [file]        JSON schema file to use for validation
    -e, --environment [env]      which specification of JSON Schema the
                                  validation file uses
    -x, --context [num]          line count used as the diff context (default: 3)
    -l, --log-files              print only the parsed file names to stdout
    -q, --quiet                  do not print the parsed json to stdout
    -n, --continue               continue with other files if an error occurs
    -p, --pretty-print           prettify the input instead of stringifying
                                  the parsed object
    -P, --pretty-print-invalid   force pretty-printing even for invalid input
    -r, --trailing-newline       ensure a line break at the end of the output
    -R, --no-trailing-newline    ensure no line break at the end of the output
    --prune-comments             omit comments from the prettified output
    --strip-object-keys          strip quotes from object keys if possible
                                  (JSON5)
    --enforce-double-quotes      surrounds all strings with double quotes
    --enforce-single-quotes      surrounds all strings with single quotes
                                  (JSON5)
    --trim-trailing-commas       omit trailing commas from objects and arrays
                                  (JSON5)
    -v, --version                output the version number
    -h, --help                   output usage information

You can use BASH patterns for including and excluding files (only files).
Patterns are case-sensitive and have to use slashes as directory separators.
A pattern to exclude from processing starts with "!".

Parsing mode can be "cjson" or "json5" to enable other flags automatically.
If no files or directories are specified, stdin will be parsed. Environments
for JSON schema validation are "json-schema-draft-04", "json-schema-draft-06"
or "json-schema-draft-07". If not specified, it will be auto-detected.

### Command line

#### Lint single file

```sh
docker run --rm -v $PATH_TO_JSON:/data TheBlackMini/jsonlint jsonlint -q JSON_FILE.json

# Please replace "$PATH_TO_JSON" with your custom path,
# and replace "JSON_FILE.json" with your real json file filename.
```
#### Lint folder of files
```sh
docker run --rm -v $PATH_TO_FOLDER:/data TheBlackMini/jsonlint jsonlint -q

# Please replace "$PATH_TO_FOLDER" with your custom path
```

### Continuous Integration (CI)

#### GitLab CI

Add this block to your `.gitlab-ci.yml`:

```yaml
jsonlint:
  stage: lint
  image: TheBlackMini/jsonlint
  only:
    changes:
      - "**/*.json"
  script:
    - jsonlint -q
```

## Build

Build command, you need to specify a valid jsonlint version argument to `JSONLINT_VERSION`:

```sh
docker build --build-arg JSONLINT_VERSION="11.7.0" -t jsonlint .
```

You can find a valid version on [jsonlint](https://github.com/prantlf/jsonlint/releases) releases page.

## License

Copyright (C) 2012-2022 Zachary Carter, Ferdinand Prantl

Licensed under the [MIT License].

[MIT License]: http://en.wikipedia.org/wiki/MIT_License
