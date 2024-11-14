cmake_minimum_required(VERSION 3.28)
project(examples)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(coordinateTransform coordinateTransform.cpp)
target_include_directories(coordinateTransform PUBLIC Eigen3::Eigen)

find_package(Pangolin REQUIRED)

add_executable(plotTrajectory plotTrajectory.cpp)
target_include_directories(plotTrajectory PUBLIC ${Pangolin_INCLUDE_DIRS})
target_link_libraries(plotTrajectory PRIVATE ${Pangolin_LIBRARIES})

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/trajectory.txt")
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/trajectory.txt
        ${CMAKE_CURRENT_BINARY_DIR}/trajectory.txt
        COPYONLY
    )
else()
    message(WARNING "trajectory.txt does not exist. Skipping configuration.")
endif()
