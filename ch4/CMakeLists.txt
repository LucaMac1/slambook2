cmake_minimum_required(VERSION 3.28)
project(useSophus)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Sophus REQUIRED)

add_executable(useSophus useSophus.cpp)
target_include_directories(useSophus PUBLIC Eigen3::Eigen)
target_link_libraries(useSophus PRIVATE Sophus::Sophus)
