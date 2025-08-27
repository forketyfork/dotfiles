# Apply Command

This command applies an experiment permanently by moving its installation to the nix-darwin configuration.

## Usage

```
/apply <experiment-name>
```

## Steps

1. Find the experiment in `zshrc` by searching for the experiment name in experiment markers
2. Find the corresponding apply steps in `apply.md`
3. Based on the tool type, add it to the appropriate section in nix-darwin configuration:
   - For brew packages: Add to `nix/homebrew.nix`
   - For system packages: Add to `nix/system-packages.nix`
   - For shell configuration: Add to `nix/shell.nix`
4. Remove the experiment section from `zshrc`
5. Move the apply section from `apply.md` to the "Applied experiments" section
6. Run the nix-darwin rebuild command to apply changes
7. Verify the tool is still available

## Example

When the user types: `/apply jdk-24`

The command should:

1. Find and remove from `zshrc`:
```bash
## [exp] 2025-08-27: jdk-24: Install JDK 24
brew install --quiet openjdk@24
export PATH="/opt/homebrew/opt/openjdk@24/bin:$PATH"
## /[exp]
```

2. Add to `nix/homebrew.nix` in the appropriate section:
```nix
"openjdk@24"
```

3. If needed, add environment variables to `nix/shell.nix`:
```nix
environment.variables = {
  JAVA_HOME = "${pkgs.openjdk24}/libexec/openjdk.jdk/Contents/Home";
};
```

4. Move in `apply.md` from active experiments to "Applied experiments" section

5. Run rebuild:
```bash
cd ../nix-darwin-config
./rebuild.sh
```

6. Verify:
```bash
java --version
which java
```

## Implementation Notes

- Check if the experiment exists before attempting to apply
- Determine the package manager (brew vs nix packages) from the experiment
- Handle different types of configurations (packages, services, shell settings)
- Always run rebuild after making changes
- Provide clear feedback about what was changed
- Keep the rollback instructions in `rollback.md` even after applying
