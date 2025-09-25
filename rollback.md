# Experiment Rollback

## [exp] 2025-09-25: atuin: Shell history management tool

### Rollback steps

```shell
brew uninstall atuin
brew cleanup
rm -rf "$HOME/.local/share/atuin"
rm -rf "$HOME/.config/atuin"
```

### Verify

```shell
> atuin --version
zsh: command not found: atuin
```

## [exp] 2025-09-23: cursor-cli: Install Cursor CLI tool

### Rollback steps

```shell
brew uninstall --cask cursor-cli
brew cleanup
```

### Verify

```shell
> cursor --version
zsh: command not found: cursor
```

## [exp] 2025-09-04: audacity: Install Audacity audio editor

### Rollback steps

```shell
brew uninstall --cask audacity
brew cleanup
```

### Verify

```shell
> ls /Applications/Audacity.app
ls: /Applications/Audacity.app: No such file or directory
```

## [exp] 2025-08-11: timewarrior: local time tracker

### Rollback steps

```shell
brew uninstall timewarrior
brew cleanup
rm -rf "$HOME/.config/timewarrior"
rm -rf "$HOME/.local/share/timewarrior"
```

### Verify

```shell
> timew
zsh: command not found: timew
```

## [exp] 2025-08-11: Hammerspoon: track context switching

### Rollback steps

```shell
brew uninstall hammerspoon
brew cleanup
rm -rf "$HOME/.hammerspoon"
rm -rf "$HOME/.metrics"
```

### Verify

```shell
> ps aux | rg '[H]ammerspoon'
[empty output]
```

## [exp] 2025-08-13: Conductor: run a bunch of Claude Codes in parallel
### Rollback steps
```shell
brew uninstall conductor
```
- remove Conductor from third-party apps on GitHub: https://github.com/settings/applications

### Verify
```shell
> ls /Applications/Conductor.app
[empty output]
```
- Conductor is not at https://github.com/settings/applications
