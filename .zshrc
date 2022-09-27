# Enable colors and change prompt:
autoload -U colors && colors 

# Git Info
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %b'

# PROMPT Info
PS1="%B%{$fg[red]%}< %{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~ %{$fg[red]%}> "
# PROMPT Git Info
PS1="$PS1"'$fg[green]${vcs_info_msg_0_}'
# PROMPT 2nd Line Info
PS1="$PS1"$'\n'"%{$fg[yellow]%}ζ%b "

# History configurations
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.cache/zsh/history
setopt appendhistory

# Load Conda completion
fpath+=~/conda-zsh-completion

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# compinit config
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
