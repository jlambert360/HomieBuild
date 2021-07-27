#!/bin/bash -e
# build-linux.sh

CMAKE_FLAGS='-DLINUX_LOCAL_DEV=true'

DATA_SYS_PATH="./Data/Sys/"
BINARY_PATH="./build/Binaries/"

# Move into the build directory, run CMake, and compile the project
mv -i /home/runner/work/HomieBuild/HomieBuild/Ishiiruka/* /home/runner/work/HomieBuild/HomieBuild/

COMMITHASH="75123e34eac5b0f3204f32a116c389f95da0766a"
FPPVERSION="2.28"

# --- Patch tarball to display correct hash to other netplay clients
echo "Patching git head"
sed -i "s|\${GIT_EXECUTABLE} rev-parse HEAD|echo ${COMMITHASH}|g" CMakeLists.txt  # --set scm_rev_str everywhere to actual commit hash when downloaded
sed -i "s|\${GIT_EXECUTABLE} describe --always --long --dirty|echo FM v$FPPVERSION|g" CMakeLists.txt # ensures compatibility w/ netplay
sed -i "s|\${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD|echo HEAD|g" CMakeLists.txt
# ---

# Move into the build directory, run CMake, and compile the project
mkdir -p build
pushd build
cmake ${CMAKE_FLAGS} ../
#Copy wx folder to Source/Core/
cp /home/runner/work/Ishiiruka/Ishiiruka/Externals/wxWidgets3/include/wx /home/runner/work/Ishiiruka/Ishiiruka/build/Source/Core/ -r
cp /home/runner/work/Ishiiruka/Ishiiruka/Externals/wxWidgets3/wx/* /home/runner/work/Ishiiruka/Ishiiruka/build/Source/Core/wx/
make -j$(nproc)
make install DESTDIR=./AppDir;
popd

# Copy the Sys folder in
cp -r -n ${DATA_SYS_PATH} ${BINARY_PATH}

touch ./build/Binaries/portable.txt
