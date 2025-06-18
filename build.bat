
cmake -B build -S ./Simulator/PBDDynamics "-DCMAKE_TOOLCHAIN_FILE=E:/vcpkg/scripts/buildsystems/vcpkg.cmake"
cmake --build build --config Release --target PBDDynamics  -j 34