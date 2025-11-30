#!/bin/sh

pushd .
CWD=$(pwd)
source $CWD/rocm-environment.sh

# Preparing directory for sources
mkdir -p $CWD/sources

##git submodule deinit -f --all
##git submodule update --init --recursive

# fetching main sources
if [ -d $ROCM_LIBRARIES_DIR ]; then
    ( cd $ROCM_LIBRARIES_DIR && git clean -f -d && git reset --hard HEAD && git fetch --all --tags && git submodule deinit -f --all && git checkout ${ROCM_BRANCH} )
else
    ( cd $ROCM_REL_DIR && git clone -j 4 --branch ${ROCM_BRANCH} https://github.com/ROCm/rocm-libraries.git )
fi

if [ -d $ROCM_SYSTEMS_DIR ]; then
    ( cd $ROCM_SYSTEMS_DIR && git clean -f -d && git reset --hard HEAD && git fetch --all --tags && git submodule deinit -f --all && git checkout ${ROCM_BRANCH} )
else
    ( cd $ROCM_REL_DIR && git clone -j 4 --branch ${ROCM_BRANCH} https://github.com/ROCm/rocm-systems.git )
fi

popd
