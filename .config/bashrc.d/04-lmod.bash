# Activate Lmod if installed
if [ -f /usr/share/lmod/lmod/init/bash ]; then 
  source /usr/share/lmod/lmod/init/bash 
  # Set module file dir if it exists
  if [ -d $HOME/bin/lmod-modules/deployed ]; then 
    module use $HOME/bin/lmod-modules/deployed
  fi
  if [ -d /opt/lmod-modules/deployed ]; then
    module use /opt/lmod-modules/deployed
  fi
  if [ -d /opt/nvidia/hpc_sdk/modulefiles/ ]; then 
    module use /opt/nvidia/hpc_sdk/modulefiles/
  fi
  # Load some modules if relevant / not already loaded. 
  # module is-loaded is not available in ubuntu packaged lmod :(
  # instead, do some horrible grep stuff that might fail
  module_is_loaded () {
    if module list "$1" 2>&1 | egrep -qi "None found|No modules loaded" ; then
      return 1
    else
      return 0
    fi
  }
  if ! module_is_loaded clang; then
    module try-load clang;
  fi
  if ! module_is_loaded gcc; then
    module try-load gcc;
  fi
  if ! module_is_loaded CUDA; then
    module try-load CUDA;
  fi
  if ! module_is_loaded nsight-compute; then
    module try-load nsight-compute;
  fi
  if ! module_is_loaded nsight-systems; then
    module try-load nsight-systems;
  fi
fi
