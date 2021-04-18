# Bessemer
if [[ "$HOSTNAME" == bessemer-*.shef.ac.uk ]]; then


function gpu-queue {
  squeue -p gpu -o "%.18i %.12j %.12u %.12b %.2t %.10M %.10l %R"
}

function gpu-nodes {
  sinfo -p gpu
  echo "in use: "
  squeue -p gpu -h -t R -O gres | grep gpu | cut -d":" -f 2 | paste -sd+ | bc
  sinfo -p gpu -N -O NodeList,Gres,GresUsed
}

function dcs-gpu-queue {
  squeue -p dcs-gpu -o "%.18i %.12j %.12u %.12b %.2t %.10M %.10l %R"
  squeue -p dcs-gpu-test -o "%.18i %.12j %.12u %.12b %.2t %.10M %.10l %R"
}

function dcs-gpu-nodes {
  sinfo -p dcs-gpu
  echo "in use:" 
  squeue -p dcs-gpu -h -t R -O gres | grep gpu | cut -d":" -f 2 | paste -sd+ | bc
  squeue -p dcs-gpu-test -h -t R -O gres | grep gpu | cut -d":" -f 2 | paste -sd+ | bc
  sinfo -p dcs-gpu -N -O NodeList,Gres,GresUsed
}

fi;  # HOSTANME == bessemer-*.shef.ac.uk
