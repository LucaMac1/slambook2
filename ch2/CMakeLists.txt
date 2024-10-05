# Declare the required cmake minimum version
cmake_minimum_required(VERSION 3.13)

# Declare a cmake project
project(HelloSLAM)

# Set the build mode
set(CMAKE_BUILD_TYPE "Debug")

# Add an executable
# Syntax: add_executable(executable_name source_file)
add_executable(helloSLAM helloSLAM.cpp)

# Add the hello library
add_library(hello libHelloSLAM.cpp)
# Shared library
add_library(hello_shared SHARED libHelloSLAM.cpp)

# Add an executable that uses functions from the hello library
add_executable(useHello useHello.cpp)
# Link the library to the executable
target_link_libraries(useHello hello_shared)
