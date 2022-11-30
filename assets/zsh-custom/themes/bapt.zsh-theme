# Bapt custom theme

PROMPT=$'%{$fg[cyan]%}┌[%{$fg[green]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$fg[green]%}%m%{$reset_color%}%{$fg[cyan]%}] [%{$fg[green]%}%(5~|%-1~/…/%2~|%3~)%{$reset_color%}%{$fg[cyan]%}] %{$(git_prompt_info)%}
%{$fg[cyan]%}└%{$reset_color%}%{$fg[cyan]%}[%(?,%{$fg[white]%},%{$fg[magenta]%})%?%{$reset_color%}%{$fg[cyan]%}]%{$reset_color%} '
PS2=$' %{$fg[cyan]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}[%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[cyan]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[cyan]%}⚡%{$reset_color%}"
