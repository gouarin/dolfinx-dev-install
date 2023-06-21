# Install dolfinx from source in a conda environment

1. First, you have to install mamba (see https://github.com/conda-forge/miniforge#mambaforge)

2. Clone this repo
   ```
   git clone https://github.com/gouarin/dolfinx-dev-install
   ```

3. Create the environment with all the dependencies
   ```
   mamba env create --file environment.yml
   ```

4. Activate the environment
   ```
   mamba activate dolfinx-dev
   ```

5. Build dolfinx

    - on Linux
    ```
    SHLIB_EXT=".so" ./install.sh
    ```
    - on MacOS
    ```
    SHLIB_EXT=".dylib" ./install.sh
    ```
