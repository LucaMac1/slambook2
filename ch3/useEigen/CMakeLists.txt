# cmake_minimum_required(VERSION 2.8)
# project(useEigen)

set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_FLAGS "-O3")

# 添加Eigen头文件
add_executable(eigenMatrix eigenMatrix.cpp)
target_include_directories(eigenMatrix PRIVATE "/usr/include/eigen3")
