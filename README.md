# Dotfiles _(dotfiles)_

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)

[mstrzele](https://mstrzele.io/)'s _dotfiles_, managed with [`chezmoi`](https://www.chezmoi.io/).

## Install

Open macOS Terminal, copy, paste and execute the command below:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $(id -un)
```

## Usage

See [daily operations in `chezmoi`'s user guide](https://www.chezmoi.io/user-guide/daily-operations/).

## Contributing

_dotfiles_ are supposed to be user-specific.

I accept PRs containing bug fixes or improvements only.

## License

[GPL-3.0](LICENSE) © [Maciej Strzelecki](mailto:mstrzele@users.noreply.github.com).
