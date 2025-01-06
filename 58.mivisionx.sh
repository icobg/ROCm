#!/bin/bash

set -e

cd $ROCM_REL_DIR
wget https://github.com/ROCm/MIVisionX/archive/rocm-$PKGVER.tar.gz
wget https://www.ixip.net/rocm/0003-ffmpeg5-6-build-fixes.patch
tar xf MIVisionX-$LDIR.tar.gz
cd MIVisionX-$LDIR

patch -Np1 -i $ROCM_REL_DIR/0003-ffmpeg5-6-build-fixes.patch

rm -rf $ROCM_BUILD_DIR/MIVisionX
mkdir -p $ROCM_BUILD_DIR/MIVisionX
cd $ROCM_BUILD_DIR/MIVisionX

pushd .

DEST=$OUTPUT/package-MIVisionX
PRGNAM=MIVisionX
NUMJOBS=${NUMJOBS:-" -j$(expr $(nproc) + 1) "}
BUILD=1

cmake \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=${ROCM_INSTALL_DIR} \
    -D BUILD_TESTING=OFF \
    $ROCM_REL_DIR/MIVisionX-$LDIR

cmake --build . $NUMJOBS
DESTDIR=$DEST cmake --install .

mkdir -p $DEST/install
cat >> $DEST/install/slack-desc << 'END'
# HOW TO EDIT THIS FILE:
# The "handy ruler" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

         |-----handy-ruler------------------------------------------------------|
MIVisionX: MIVisionX (MIVisionX)
MIVisionX:
MIVisionX: MIVisionX toolkit is a set of comprehensive computer vision and
MIVisionX: machine intelligence libraries, utilities, and applications bundled
MIVisionX: into a single toolkit. AMD MIVisionX delivers highly optimized
MIVisionX: conformant open-source implementation of the Khronos OpenVX™ and
MIVisionX: OpenVX™ Extensions along with Convolution Neural Net Model Compiler
MIVisionX: & Optimizer supporting ONNX, and Khronos NNEF™ exchange formats. 
MIVisionX:
MIVisionX:
MIVisionX:
END

cd $DEST
makepkg -l y -c n $OUTPUT/$PRGNAM-$PKGVER-$ARCH-${BUILD}$TAG.txz

popd
