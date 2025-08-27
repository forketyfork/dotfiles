# Rollback Command

This command rolls back an experiment by removing it completely from the system.

## Usage

```
/rollback <experiment-name>
```

## Steps

1. Find the experiment in `zshrc` or check if it's been applied to nix-darwin
2. Find the rollback instructions in `rollback.md`
3. Execute the rollback steps:
   - If still in experimental phase: Remove from `zshrc` and execute uninstall commands
   - If already applied: Remove from nix-darwin configuration and rebuild
4. Verify the tool is no longer available
5. Optionally remove the experiment documentation from `apply.md` and `rollback.md`

## Example

When the user types: `/rollback jdk-24`

### Case 1: Experiment still in zshrc

1. Remove from `zshrc`:
```bash
## [exp] 2025-08-27: jdk-24: Install JDK 24
brew install --quiet openjdk@24
export PATH="/opt/homebrew/opt/openjdk@24/bin:$PATH"
## /[exp]
```

2. Execute rollback steps from `rollback.md`:
```bash
brew uninstall openjdk@24
brew cleanup
```

3. Verify removal:
```bash
java --version  # Should show "command not found"
```

### Case 2: Experiment already applied to nix-darwin

1. Remove from `nix/homebrew.nix`:
```nix
"openjdk@24"  # Remove this line
```

2. Remove from `nix/shell.nix` if environment variables were added:
```nix
# Remove JAVA_HOME and related environment variables
```

3. Rebuild nix-darwin:
```bash
cd ../nix-darwin-config
./rebuild.sh
```

4. Verify removal:
```bash
java --version  # Should show "command not found"
which java      # Should return nothing
```

5. Optionally archive the experiment documentation

## Implementation Notes

- Check both `zshrc` and nix-darwin configuration to determine current state
- Execute appropriate rollback based on where the experiment exists
- For brew packages, always run `brew cleanup` after uninstall
- For nix-darwin changes, always rebuild after modifications
- Provide clear feedback about what was removed
- Ask user if they want to keep the documentation for future reference
- Handle cases where the experiment might be partially applied
