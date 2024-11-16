cmake_minimum_required(VERSION 3.28)
project(stereo)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OpenCV REQUIRED)
find_package(Pangolin REQUIRED)

add_executable(stereoVision stereoVision.cpp)
target_include_directories(stereoVision PUBLIC ${OpenCV_INCLUDE_DIRS} Eigen3::Eigen)
target_link_libraries(stereoVision PRIVATE ${OpenCV_LIBS} ${Pangolin_LIBRARIES})

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
