# blackmass specific rules 
if [ "$HOSTNAME" == "mavericks" ]; then
module load libs/CUDA/10.1/binary 

if [ -f ~/.rvm/scripts/rvm ]; then
  source ~/.rvm/scripts/rvm
fi

fi
