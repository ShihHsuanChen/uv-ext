# uv-ext

Extended uv commands for global virtual environments operations


## Requirements

- Ubuntu with bash shell
- [`uv`](https://github.com/astral-sh/uv)


## Installation

1. Clone [this repository](https://github.com/ShihHsuanChen/uv-ext)

```
$ git clone https://github.com/ShihHsuanChen/uv-ext.git
$ cd uv-ext
```

2. Execute `install.sh to add the command to your bash shell`

```
$ chmod u+x ./install.sh
$ ./install.sh
```

3. If the `uv-ext` command not found, try restarting the shell.

## Usage

### Show help

```
$ uv-ext --help
Extended uv command for global virtual environments operations.

Usage: uv-ext <COMMANd> [OPTIONS]

Commands:
  list                 List global uv virtual environments
  create <venv name>   Create a new global uv virtual environments
  remove <venv name>   Remove a global uv virtual environments
  activate <venv name> Activate a global uv virtual environments

Options:
  --help               Show this help message

```
