project(visualizeGeometry)
set(TARGET visualizeGeometry)

# Set policy to avoid compatibility warning
if(COMMAND cmake_policy)
  cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

# Find Pangolin and Eigen packages
find_package(Pangolin REQUIRED)
find_package(Eigen3 3.3 REQUIRED NO_MODULE)

add_executable(${TARGET} visualizeGeometry.cpp)
target_include_directories(${TARGET} PUBLIC Eigen3::Eigen ${Pangolin_INCLUDE_DIRS})
target_link_libraries(${TARGET} PRIVATE ${Pangolin_LIBRARIES})
