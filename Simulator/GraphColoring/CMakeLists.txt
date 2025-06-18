cmake_minimum_required (VERSION 3.5...4.0)
project (GraphColoring)

if( CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR )
    message( FATAL_ERROR "Please select another Build Directory ! (and give it a clever name, like bin_Visual2012_64bits/)" )
endif()
if( CMAKE_SOURCE_DIR MATCHES " " )
	message( "Your Source Directory contains spaces. If you experience problems when compiling, this can be the cause." )
endif()
if( CMAKE_BINARY_DIR MATCHES " " )
	message( "Your Build Directory contains spaces. If you experience problems when compiling, this can be the cause." )
endif()

find_package(HoudiniGeoIO REQUIRED PATHS ${CMAKE_CURRENT_LIST_DIR}/../3rdParty/HoudiniGeoIO/cmake)
# On Visual 2005 and above, this module can set the debug working directory
# cmake_policy(SET CMP0026 OLD)  # Removed as CMake 3.5+ requires NEW behavior

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

## Use C++11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

set(BUILD_EBD OFF)
set(BUILD_PBD OFF)
set(BUILD_APAP_Cloth OFF)
set(BUILD_VBD OFF)
set(BUILD_VBD_Cloth OFF)
set(BUILD_Collision_Detector OFF)
set(BUILD_GUI OFF)
include(../cmake/GAIA-config.cmake)

include_directories(
	${GAIA_INCLUDE_DIRS}
	${HoudiniGeoIO_INCLUDE_DIR}
)

file(GLOB SRC
	"*.h"
	"*.cpp"
	"*.c"
	)

add_executable(GraphColoring 
	${SRC}
	${GAIA_COLORING_SRCS}
	${HoudiniGeoIO_SRCS}
)


target_compile_options(GraphColoring PUBLIC $<$<COMPILE_LANGUAGE:CUDA>:
                       --extended-lambda
					   --default-stream per-thread
                       >)

target_link_libraries(GraphColoring ${GAIA_LIBRARY})