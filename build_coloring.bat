call setenv.bat
cmake -B build_coloring -S ./Simulator/GraphColoring -DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%/scripts/buildsystems/vcpkg.cmake
cmake --build build_coloring --config Release --target GraphColoring -j 8