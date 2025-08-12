# dotfiles

These are my dotfiles.

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
