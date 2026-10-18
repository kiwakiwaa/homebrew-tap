# Homebrew tap

Homebrew formula for the [mkd-tools CLI](https://github.com/kiwakiwaa/mkd-tools).
Python bindings are installed separately, this formula installs only `mkd-tools`.

## Installation

```sh
brew install kiwakiwaa/tap/mkd-tools
```

The formula builds from source and fetches the pinned Git submodules automatically.
Building on macOS requires Xcode Command Line Tools.

## Release preparation

For subsequent releases, update the tag, revision and version together.

Verify formula changes with:

```sh
brew reinstall --build-from-source kiwakiwaa/tap/mkd-tools
brew test kiwakiwaa/tap/mkd-tools
brew audit --strict kiwakiwaa/tap/mkd-tools
brew style kiwakiwaa/tap/mkd-tools
```
