alias junit='java org.junit.runner.JUnitCore'

alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias vi='vim'
alias srcbashrc='source ~/.bashrc'
alias mb='mv'

alias cl='clear && ls'
alias grep='grep --color'

alias please='sudo'
alias g='git'

alias todo='grep --color -rn "@todo"'
alias kill='kill -9'

alias targz='tar -zcvf'
alias utargz='tar -zxvf'

alias spotifyweb='chromeApp "https://play.spotify.com/radio"'

alias gpu-top-pid='nvidia-smi --query-compute-apps=pid,process_name,used_memory --format=csv | sed -n 2p | cut -d"," -f1'

alias cuda-gdb-attach='sudo env PATH=$PATH cuda-gdb -p `gpu-top-pid`'


# alias pip3='python3 -m pip'
