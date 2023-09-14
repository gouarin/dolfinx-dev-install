#!/bin/bash

mkdir src

git clone https://github.com/FEniCS/basix.git src/basix
pushd src/basix
git checkout 0fc130f7d790f793ffa57bf8d056232ff6f12be8
cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -B build-dir \
    -DCMAKE_INSTALL_PREFIX="$CONDA_PREFIX" \
    cpp
cmake --build build-dir
cmake --install build-dir
python -m pip install --no-deps -vv ./python
popd

git clone https://github.com/FEniCS/ffcx.git src/ffcx
pushd src/ffcx
git checkout 237b6135912ba3a7f87c7d2c7face87245cd8a76
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
git checkout aa4242a3319de0fffa34e64c45afb059cbdabea4
cmake \
    -DDOLFINX_UFCX_PYTHON=OFF \
    -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX \
    -B build \
    cpp
cmake --build build
cmake --install build
python -m pip install --no-deps -vv ./python
popd
