# Passwordless ZSH history

Keep passwords out of your ZSH history

ZSH will let you recover the previous command from history immediately after it has been run. After that it will not be added to history if it matches `HISTORY_EXCLUDE_PATTERN`

```bash
> curl http://username:password@github.com/foo
> # <up-arrow> recovers command with password
> # curl command is not available in history here
```

To exclude _any_ command from history, prefix with a space. It behaves the same as above:
```bash
>  echo "prefixed with space"
> # available here on <up-arrow>
> # Not available here 
```

## Installation

**Antibody**

```
antibody bundle jgogstad/passwordless-history
```

**Antigen**

```
antigen bundle jgogstad/passwordless-history
```

**Plain zsh**

Add to `.zshrc`

```
. /path/to/passwordless-history.plugin.zsh
```

## Customization

Default exclusion pattern is

```bash
> echo $HISTORY_EXCLUDE_PATTERN
^ |password|PASSWORD|//[^/]+:[^/]+@
```

Overwrite variable to customize

```bash
> export HISTORY_EXCLUDE_PATTERN="^ykchalresp|$HISTORY_EXCLUDE_PATTERN"
```
