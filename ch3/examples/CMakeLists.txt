set(CMAKE_CXX_STANDARD 17)

# include_directories("/usr/include/eigen3")

# if (Eigen3_FOUND)
#     message(STATUS "Eigen3 found: ${EIGEN3_INCLUDE_DIR}")
# else()
#     message(FATAL_ERROR "Eigen3 not found!")
# endif()

add_executable(coordinateTransform coordinateTransform.cpp)
target_include_directories(coordinateTransform PUBLIC Eigen3::Eigen)

find_package(Pangolin REQUIRED)
include_directories(${Pangolin_INCLUDE_DIRS})
add_executable(plotTrajectory plotTrajectory.cpp)
target_link_libraries(plotTrajectory ${Pangolin_LIBRARIES})

configure_file(
    ${CMAKE_SOURCE_DIR}/examples/trajectory.txt
    ${CMAKE_BINARY_DIR}/examples/trajectory.txt
    COPYONLY
)
