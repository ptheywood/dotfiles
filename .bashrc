# ~/.bashrc: executed by bash(1) for non-login shells.
case $- in
    *i*) ;;
      *) return;;
esac

# Load each file from the .config/.bashrc.d directory
if [ -d $HOME/.config/bashrc.d ]; then
  for file in $HOME/.config/bashrc.d/*.bash; do
    source $file
  done
fi


HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_environment ]; then
    . ~/.bash_environment
fi

# enable programmable completion features (you don't need to enable
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Activate Lmod if installed
if [ -f /usr/share/lmod/lmod/init/bash ]; then 
  source /usr/share/lmod/lmod/init/bash 
  # Set module file dir if it exists
  if [ -d $HOME/bin/lmod-modules/deployed ]; then 
    module use $HOME/bin/lmod-modules/deployed
    # Load some modules if relevant
    module try-load clang
    module try-load gcc
    module try-load CUDA
    module try-load nsight-compute
    module try-load nsight-systems
  fi 
  if [ -d /opt/nvidia/hpc_sdk/modulefiles/ ]; then 
    module use /opt/nvidia/hpc_sdk/modulefiles/
  fi
fi

if [ -f ~/.homesick/repos/homeshick/homeshick.sh ]; then
  source ~/.homesick/repos/homeshick/homeshick.sh
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ptheywood/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ptheywood/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ptheywood/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ptheywood/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

