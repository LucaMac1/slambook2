cmake_minimum_required(VERSION 3.28)
project(dense_monocular)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set(CMAKE_BUILD_TYPE "Release")
# set(CMAKE_CXX_FLAGS "-std=c++11 -march=native -O3")

############### dependencies ######################
# Eigen
# include_directories("/usr/include/eigen3")
# OpenCV
# find_package(OpenCV 3.1 REQUIRED)

find_package(OpenCV REQUIRED)
find_package(Sophus REQUIRED)

set(THIRD_PARTY_LIBS
        ${OpenCV_LIBS}
        ${Sophus_LIBRARIES})

add_executable(dense_mapping dense_mapping.cpp)
target_include_directories(dense_mapping PUBLIC ${OpenCV_INCLUDE_DIRS} ${Sophus_INCLUDE_DIRS} Eigen3::Eigen)
target_link_libraries(dense_mapping PRIVATE ${THIRD_PARTY_LIBS})
