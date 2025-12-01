#!/bin/bash

export ROCM_INSTALL_DIR=/opt/rocm
export ROCM_MAJOR_VERSION=7
export ROCM_MINOR_VERSION=1
export ROCM_PATCH_VERSION=1
export ROCM_MAGIC=38
export PKGVER=7.1.1
export ROCM_LIBPATCH_VERSION=70101
export ROCM_VERSION=70101
export ROCM_PKGTYPE=TGZ
export ROCM_REL_DIR=/usr/local/src/rocm/sources
export ROCM_BUILD_DIR=/usr/local/src/rocm/rocm-build/build
export ROCM_LIBRARIES_DIR=$ROCM_REL_DIR/rocm-libraries/projects
export ROCM_SYSTEMS_DIR=$ROCM_REL_DIR/rocm-systems/projects
# Uncomment line below if you need to build ROCm with support for all devices. Home users usually don't need this enabled.
#export AMDGPU_TARGETS="gfx803,gfx900,gfx906,gfx908,gfx90a,gfx942,gfx950,gfx1010,gfx1011,gfx1012,gfx1030,gfx1031,gfx1032,gfx1034,gfx1035,gfx1100,gfx1101,gfx1102,gfx1103,gfx1150,gfx1151,gfx1200,gfx1201"
export ROCM_BRANCH=rocm-7.1.1
export LIBRARY_PATH=$ROCM_INSTALL_DIR/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$ROCM_INSTALL_DIR/lib:$LD_LIBRARY_PATH
export PATH=$ROCM_INSTALL_DIR/bin:$ROCM_INSTALL_DIR/llvm/bin:$ROCM_INSTALL_DIR/hip/bin:$CMAKE_DIR/bin:$PATH
export ARCH=${ARCH:-x86_64}
export OUTPUT=${OUTPUT:-/usr/local/src/packages}
export LDIR=${LDIR:-rocm-}${PKGVER}
export TAG=condor
