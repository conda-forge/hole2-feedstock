# compile HOLE with gfortran
cd ${SRC_DIR}/src
source ../source.apache

if [[ "$target_platform" == osx-* ]]; then
    if [ -n "${CONDA_BUILD_SYSROOT}" ]; then
        echo "CONDA_BUILD_SYSROOT: ${CONDA_BUILD_SYSROOT}"
        CFLAGS+=" -isysroot ${CONDA_BUILD_SYSROOT}"
        FFLAGS+=" -isysroot ${CONDA_BUILD_SYSROOT}"
    fi

    export LFLAGS=${LDFLAGS}
fi

FFLAGS+=" -fd-lines-as-comments "

make FC=${GFORTRAN} CC=${CC} CFLAGS="${CFLAGS}" FFLAGS="${FFLAGS}" LFLAGS="${LFLAGS}"
make FC=${GFORTRAN} CC=${CC} PREFIX=${PREFIX} install-all CFLAGS="${CFLAGS}" FFLAGS="${FFLAGS}" LFLAGS="${LFLAGS}"