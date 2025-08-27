**Prefer the following tools**:
- `rg` as a better alternative to `grep` to search for text in files
- `date` to get the current date/time
- `tree` to get a tree-like view of a directory
- `fd` as a better alternative to `find`
- `gh` to access GitHub issues, pull requests, etc.
  - if being asked to address the review comments, use command `gh api repos/<org>/<repo>/pulls/<#PR>/comments` to get the comments and their context

**Style**:
- Prefer self-documenting code over comments
- If you need to delete some code, remove it without leaving any comments in its stead
- Use grammatically correct English for comments

## Experiment System

This repository uses an experiment-based approach for testing new tools and configurations before permanently adding them to the nix-darwin configuration.

### How it works:

1. **Creating experiments**: New tools are initially installed via temporary methods (e.g., brew install in `.zshrc`)
2. **Documentation**: Each experiment is documented in:
   - `apply.md` - Steps to apply the experiment permanently (move to nix-darwin)
   - `rollback.md` - Steps to cleanly remove the experiment
3. **Testing phase**: Tools are tested in the experimental setup
4. **Applying**: If successful, the tool installation is moved to the permanent nix-darwin configuration
5. **Rolling back**: If unsuccessful, the tool can be cleanly removed using rollback steps

### Custom Commands:

- `/experiment <name> "<description>"` - Create a new experiment
- `/apply <name>` - Apply an experiment to nix-darwin configuration
- `/rollback <name>` - Roll back an experiment

The `nix-darwin-config` directory (located at `../nix-darwin-config` relative to this repo) contains the permanent system configuration managed by nix-darwin.
