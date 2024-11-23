cmake_minimum_required(VERSION 3.28)
project(pose_graph)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set(CMAKE_BUILD_TYPE "Release")
# set(CMAKE_CXX_FLAGS "-std=c++11 -O2")

#unstable

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

include_directories("/usr/include/eigen3")

find_package(Sophus REQUIRED)
include_directories(${Sophus_INCLUDE_DIRS})

find_package(G2O REQUIRED)
include_directories(${G2O_INCLUDE_DIRS})

add_executable(pose_graph_g2o_SE3 pose_graph_g2o_SE3.cpp)
target_link_libraries(pose_graph_g2o_SE3 PRIVATE
        g2o_core g2o_stuff g2o_types_slam3d ${CHOLMOD_LIBRARIES}
        )

add_executable(pose_graph_g2o_lie pose_graph_g2o_lie_algebra.cpp)
target_link_libraries(pose_graph_g2o_lie PRIVATE
        g2o_core g2o_stuff
        ${CHOLMOD_LIBRARIES}
        ${Sophus_LIBRARIES}
        )
