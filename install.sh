#!/bin/bash

mkdir src

git clone https://github.com/FEniCS/basix.git src/basix
pushd src/basix
cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -B build-dir \
    -DCMAKE_INSTALL_PREFIX="$CONDA_PREFIX" \
    -DBLAS_VENDOR="Generic" \
    -DBLAS_LIBRARIES="$CONDA_PREFIX/lib/libblas${SHLIB_EXT};$CONDA_PREFIX/lib/libcblas${SHLIB_EXT}" \
    cpp
cmake --build build-dir
cmake --install build-dir
python -m pip install --no-deps -vv ./python
popd

git clone https://github.com/FEniCS/ffcx.git src/ffcx
pushd src/ffcx
cmake \
    -DCMAKE_INSTALL_PREFIX="${CONDA_PREFIX}" \
    -B build-dir \
    -S cmake/
cmake --build build-dir
cmake --install build-dir
python -m pip install --no-deps -vv .
popd

git clone https://github.com/FEniCS/dolfinx.git src/dolfinx
pushd src/dolfinx
cmake \
    -DDOLFINX_UFCX_PYTHON=OFF \
    -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX \
    -B build \
    cpp
cmake --build build
cmake --install build
python -m pip install --no-deps -vv ./python
popd
