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
