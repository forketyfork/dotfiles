# Dotfiles

[![Build status](https://github.com/forketyfork/dotfiles/actions/workflows/build.yml/badge.svg)](https://github.com/forketyfork/dotfiles/actions/workflows/build.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Shell](https://img.shields.io/badge/language-Shell-green.svg)](https://www.gnu.org/software/bash/)

Personal dotfiles and configuration files for development environment setup.

## git hooks
To install the pre-commit and post-commit hooks, after cloning, run the following command in the repository directory:
```sh
git config --local core.hooksPath hooks
```

## Process

All experiments are added with the comment in the source code:
```shell
# [exp] YYYY-mm-DD: change-name: explanation
change
# /[exp]
```

A record in `apply.md` on how to apply the change permanently:

```markdown
## [exp] YYYY-mm-DD: change-name: explanation
... (steps to apply the change permanently)

```

And a record in `rollback.md` on how to rollback the change:

```markdown
## [exp] YYYY-mm-DD: change-name: explanation
### Rollback steps
... (the exact steps to roll back the change in under 5 minutes)
### Verify
... (how to verify that the rollback is achieved)

```
