cmake_minimum_required(VERSION 3.13)
project(SlamProject2)

# Define global settings or options here if needed
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Optionally set other global options
# set(CMAKE_BUILD_TYPE Release)

# Add subdirectories for third-party libraries
add_subdirectory(3rdparty/Sophus)
add_subdirectory(3rdparty/Pangolin) 
add_subdirectory(3rdparty/ceres-solver)
add_subdirectory(3rdparty/DBoW3) 
add_subdirectory(3rdparty/g2o) 
add_subdirectory(3rdparty/googletest)