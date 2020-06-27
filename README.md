# 🐢 puck

`puck` is a [`zsh`](https://zsh.org) prompt

> Work in progress 🧐

It'll look something like this:

```
~/Dev/Repo/Private/puck :git branch info here:
λ Typing commands goes here!
```

> Q: Why would you do this in OCaml instead of just using `zsh` or `oh-my-zsh`?
>
> A: Because I can?
>
> A: OCaml is fun and building a simple program that outputs a string is good for learning more OCaml! I was inspired by [`gbt`](https://github.com/jtyr/gbt).

## Project setup

- [`esy`](https://esy.sh)/[`dune`](https://dune.build)
  - [`npm`](https://npmjs.org)/[`yarn`](https://yarnpkg.com) for `esy`
- [alcotest](https://github.com/mirage/alcotest)
- [ocamlformat](https://github.com/ocaml-ppx/ocamlformat)
- [Bos](https://github.com/dbuenzli/bos)

> Project setup inspired by [spin](https://github.com/tmattio/spin) and [modern-ocaml](https://github.com/Khady/modern-ocaml). Thanks to [tmattio](https://github.com/tmattio) and [Khady](https://github.com/Khady) 🥳

## Installation

Right now the only way to use `puck` is to build from source:

- `puck` uses [`esy`](https://esy.sh) to install and manage dependencies

- `esy` is installed using [`npm`](https://npmjs.org) or [`yarn`](https://yarnpkg.com)

```zsh
npm i -g esy
git clone https://github.com/p1xelHer0/puck.git
cd puck
esy
```

This will install the `OCaml` compiler and required dependencies, it might take some minutes. After the initial installation this will be much faster. `esy` uses [`dune`](https://dune.build) behind the scenes, the de facto build system for `OCaml`.

Build the `puck` executable and source the `puck.zsh` file to enable the prompt. See [Build](#Build) for more information.

```bash
esy build

# read the contents of ./puck.zsh

# in your .zshrc
source /path/to/puck/puck.zsh
```

> Note: if you don't want to use `esy` for some reason then you can use `dune` itself. If you have this opinion you problably know how to do it yourself 😘. I'm might look into getting this working with both `dune` and `esy` in the future with proper documentation.

> This project is built with and tested using `esy` with these versions:
>
> - macOS Mojave Version `10.14.6`
> - `esy@0.6.4` installed with `yarn@1.22.4`
> - `zsh 5.3 (x86_64-apple-darwin18.0)`

### Build, test, formatting and more with `puck`

#### Build

```zsh
esy build
```

This will build `puck` with the name `main.exe`, the puck executable will be put in the `./_build/` folder. The complete path is:

```zsh
./_build/default/bin/main.exe
```

#### Testing

```zsh
esy test
```

This will run all unit tests. `puck` uses [alcotest](https://github.com/mirage/alcotest) for testing.

All unit tests can be found in the `./test` folder. The test runner executable is found under `./test/support/test_runner.ml`, test suits should be added there.

#### Formatting

```zsh
esy format
```

This will format all `ml` and `mli` files in the repository. `puck` uses [ocamlformat](https://github.com/ocaml-ppx/ocamlformat) for formatting. The formatted changes will be shown in the output.
