cmake_minimum_required(VERSION 3.28)
project(useGeometry)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(TARGET eigenGeometry)
set(SOURCES eigenGeometry.cpp)

add_executable(${TARGET} ${SOURCES})
target_include_directories(${TARGET} PUBLIC Eigen3::Eigen)
