# Experiment Command

This command creates a new experiment for testing tools before adding them to the nix-darwin configuration.

## Usage

```
/experiment <name> "<description>"
```

## Steps

1. Parse the experiment name and description from the user's input
2. Get the current date in format YYYY-MM-DD
3. Add the experiment to `zshrc` with the appropriate experiment markers
4. Document the experiment in `apply.md` with steps to apply it permanently
5. Document the experiment in `rollback.md` with steps to cleanly remove it
6. Provide a summary of what was created

## Example

When the user types: `/experiment jdk-24 "Install JDK 24"`

The command should:

1. Add to `zshrc`:
```bash
## [exp] 2025-08-27: jdk-24: Install JDK 24
brew install --quiet openjdk@24
export PATH="/opt/homebrew/opt/openjdk@24/bin:$PATH"
## /[exp]
```

2. Add to `apply.md`:
```markdown
## [exp] 2025-08-27: jdk-24: Install JDK 24
- move openjdk@24 to nix-darwin configuration
- add java environment variables to shell configuration
```

3. Add to `rollback.md`:
```markdown
## [exp] 2025-08-27: jdk-24: Install JDK 24

### Rollback steps

```shell
brew uninstall openjdk@24
brew cleanup
```

### Verify

```shell
> java --version
zsh: command not found: java
```
```

## Implementation Notes

- Always use the current date for the experiment
- The experiment name should be lowercase with hyphens
- The brew install should use --quiet flag
- Include proper experiment markers `## [exp]` and `## /[exp]`
- For rollback, include both uninstall steps and verification
- Consider the type of tool being installed (language runtime, CLI tool, GUI app) and adjust accordingly
