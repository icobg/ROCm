#!/bin/bash

set -e
PRGNAM=rocThrust
cd $ROCM_REL_DIR
wget https://github.com/ROCm/$PRGNAM/archive/rocm-$PKGVER.tar.gz
tar xf $PRGNAM-$LDIR.tar.gz
rm -rf $ROCM_BUILD_DIR/$PRGNAM
mkdir -p $ROCM_BUILD_DIR/$PRGNAM
cd $ROCM_BUILD_DIR/$PRGNAM

DEST=$OUTPUT/package-$PRGNAM

NUMJOBS=${NUMJOBS:-" -j$(expr $(nproc) + 1) "}
BUILD=1
rm -rf $DEST

pushd .

cmake \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_CXX_COMPILER=${ROCM_INSTALL_DIR}/bin/hipcc \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none" \
    -D CMAKE_INSTALL_PREFIX=${ROCM_INSTALL_DIR} \
    $ROCM_REL_DIR/$PRGNAM-$LDIR

cmake --build . $NUMJOBS
DESTDIR=$DEST cmake --install . --strip

mkdir -p $DEST/install
cat >> $DEST/install/slack-desc << 'END'
# HOW TO EDIT THIS FILE:
# The "handy ruler" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

         |-----handy-ruler------------------------------------------------------|
rocThrust: rocThrust (Port of Thrust parallel algorithm library atop HIP/ROCm)
rocThrust:
rocThrust: Thrust is a parallel algorithm library. It has been ported to HIP and
rocThrust: ROCm, which use the rocPRIM library. The HIP-ported library works on
rocThrust: HIP and ROCm software. Currently there is no CUDA backend in place.
rocThrust:
rocThrust:
rocThrust:
rocThrust:
rocThrust:
END

cd $DEST
makepkg -l y -c n $OUTPUT/$PRGNAM-$PKGVER-$ARCH-${BUILD}$TAG.txz

popd
