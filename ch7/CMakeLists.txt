cmake_minimum_required(VERSION 3.28)
project(Chapter7)

set(CMAKE_BUILD_TYPE "Release")
add_definitions("-DENABLE_SSE")
set(CMAKE_CXX_FLAGS "-std=c++17 -O2 ${SSE_FLAGS} -msse4")
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

find_package(OpenCV REQUIRED)
find_package(G2O REQUIRED)
find_package(Sophus REQUIRED)

# include_directories(
#         ${OpenCV_INCLUDE_DIRS}
#         ${G2O_INCLUDE_DIRS}
#         ${Sophus_INCLUDE_DIRS}
#         "/usr/include/eigen3/"
# )

add_executable(orb_cv orb_cv.cpp)
target_include_directories(orb_cv PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries(orb_cv PRIVATE ${OpenCV_LIBS})

# add_executable(orb_self orb_self.cpp)
# target_link_libraries(orb_self ${OpenCV_LIBS})

# add_executable( pose_estimation_2d2d pose_estimation_2d2d.cpp extra.cpp ) # use this if in OpenCV2
# # add_executable(pose_estimation_2d2d pose_estimation_2d2d.cpp)
# target_link_libraries(pose_estimation_2d2d ${OpenCV_LIBS})

# # # add_executable( triangulation triangulation.cpp extra.cpp) # use this if in opencv2
# add_executable(triangulation triangulation.cpp)
# target_link_libraries(triangulation ${OpenCV_LIBS})

# add_executable(pose_estimation_3d2d pose_estimation_3d2d.cpp)
# target_link_libraries(pose_estimation_3d2d
#         g2o_core g2o_stuff
#         ${OpenCV_LIBS})

# add_executable(pose_estimation_3d3d pose_estimation_3d3d.cpp)
# target_link_libraries(pose_estimation_3d3d
#         g2o_core g2o_stuff
#         ${OpenCV_LIBS})


# Define the source directory containing .png files
set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

# Define the target directory where the files will be copied
set(TARGET_DIR "${CMAKE_CURRENT_BINARY_DIR}")

# Create the target directory if it does not exist
file(MAKE_DIRECTORY "${TARGET_DIR}")

# Get all .pgm files in the source directory
file(GLOB PNG_FILES "${SOURCE_DIR}/*.png")

# Iterate over each .png file and configure it
foreach(PNG_FILE ${PNG_FILES})
    # Extract the filename from the full path
    get_filename_component(FILENAME ${PNG_FILE} NAME)

    # Copy the file to the target directory
    configure_file(
        ${PNG_FILE}
        ${TARGET_DIR}/${FILENAME}
        COPYONLY
    )
endforeach()
