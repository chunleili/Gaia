cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# set output of exe/lib/dll to bin folder
SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_CURRENT_LIST_DIR}/../../bin")
SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../../bin")
SET( CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_CURRENT_LIST_DIR}/../../bin")
SET( CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../../bin")
SET( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${CMAKE_CURRENT_LIST_DIR}/../../bin")
SET( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../../bin")

# Set the debug postfix for libraries
set(CMAKE_DEBUG_POSTFIX "_d")

project(PBDDynamics LANGUAGES CXX CUDA)

## Use C++11
set (CMAKE_CXX_STANDARD 11)
set (CMAKE_CUDA_STANDARD 11)   

set(BUILD_PBD ON)
include(../cmake/GAIA-config.cmake)

include_directories(
	${GAIA_INCLUDE_DIRS}
	
)

file(GLOB SRC
    "*.h"
    "*.cpp"
	"*.c"
	)

add_executable(PBDDynamics 
	${SRC}
	${GAIA_SRCS}
)


target_compile_options(PBDDynamics PUBLIC $<$<COMPILE_LANGUAGE:CUDA>:
                       --extended-lambda
					   --default-stream per-thread
                       >)

target_link_libraries(PBDDynamics ${GAIA_LIBRARY})