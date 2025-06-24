call setenv.bat
cmake -B build -S ./Simulator/PBDDynamics "-DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%/scripts/buildsystems/vcpkg.cmake"
cmake --build build --config Release --target PBDDynamics  -j 8