cmake_minimum_required(VERSION 3.28)
project(bundle_adjustment)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set(CMAKE_BUILD_TYPE "Release")
# set(CMAKE_CXX_FLAGS "-O3 -std=c++11")

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

find_package(G2O REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Ceres REQUIRED)
find_package(Sophus REQUIRED)
find_package(CSparse REQUIRED)

set(G2O_LIBS g2o_csparse_extension g2o_stuff g2o_core cxsparse)

add_library(bal_common common.cpp)

# unstable
add_executable(bundle_adjustment_g2o bundle_adjustment_g2o.cpp)
target_include_directories(bundle_adjustment_g2o PUBLIC ${PROJECT_SOURCE_DIR} ${EIGEN3_INCLUDE_DIR} ${CSPARSE_INCLUDE_DIR})
target_link_libraries(bundle_adjustment_g2o PRIVATE ${G2O_LIBS} bal_common)

add_executable(bundle_adjustment_ceres bundle_adjustment_ceres.cpp)
target_include_directories(bundle_adjustment_ceres PUBLIC ${PROJECT_SOURCE_DIR} ${EIGEN3_INCLUDE_DIR} ${CSPARSE_INCLUDE_DIR})
target_link_libraries(bundle_adjustment_ceres PRIVATE ${CERES_LIBRARIES} bal_common)
