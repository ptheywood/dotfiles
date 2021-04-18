# ShARC specific rules
# @todo - invert  the if statement by returning early?
if [[ "$HOSTNAME" == sharc-*.shef.ac.uk ]]; then

function checkDGX {
qstat -q rse.q@sharc-node126.shef.ac.uk -u \*
qhost -h sharc-node126 -F gpu
qhost -h sharc-node126 -j

}

function sneakDGX {
qrshx -l h=sharc-node126 -P rse
}

function checkRSE {
qstat -q rse.q -u \*
}

function checkDGXgpus {
qhost -h sharc-node126 -F gpu
}

function checkStrituvad {
qstat -q rse-strituvad.q@sharc-node154.shef.ac.uk -u \*
qhost -h sharc-node154 -F gpu
qhost -h sharc-node154 -j
}


function checkPublicGPU {
qstat -q qpu.q@sharc-node099.shef.ac.uk -u \*
qhost -h sharc-node099 -F gpu -j
qhost -h sharc-node099 -F
qstat -q gpu.q@sharc-node100.shef.ac.uk -u \*
qhost -h sharc-node100 -F gpu -j
qhost -h sharc-node100 -F
}

function sneakGPU099 {
qrshx -l h=sharc-node099 
}

function sneakGPU100 {
qrshx -l h=sharc-node100 
}


function countRSEGPUJobs {
        qstat -q rse.q -u \* -r | grep "gpu=" | wc -l
}

# Iceberg
# 2070s on node 001, 002, ... 007
# K40s on node 213, 214, 215, 216

fi;  # // HOSTNANE == sharc-*.shef.ac.uk


