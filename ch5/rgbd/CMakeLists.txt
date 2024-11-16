cmake_minimum_required(VERSION 3.28)
project(rgbd)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OpenCV REQUIRED)
find_package(Sophus REQUIRED)
find_package(Pangolin REQUIRED)

add_executable(joinMap joinMap.cpp)
target_include_directories(joinMap PUBLIC ${OpenCV_INCLUDE_DIRS} ${Sophus_INCLUDE_DIRS})
target_link_libraries(joinMap ${OpenCV_LIBS} ${Pangolin_LIBRARIES})

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/pose.txt")
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/pose.txt
        ${CMAKE_CURRENT_BINARY_DIR}/pose.txt
        COPYONLY
    )
else()
    message(WARNING "pose.txt does not exist. Skipping configuration.")
endif()

# Define the source directory containing .png files
set(SOURCE_COLOUR_DIR "${CMAKE_CURRENT_SOURCE_DIR}/color")

# Define the target directory where the files will be copied
set(TARGET_COLOUR_DIR "${CMAKE_CURRENT_BINARY_DIR}/color")

# Create the target directory if it does not exist
file(MAKE_DIRECTORY "${TARGET_COLOUR_DIR}")

# Get all .png files in the source directory
file(GLOB PNG_FILES "${SOURCE_COLOUR_DIR}/*.png")

# Iterate over each .png file and configure it
foreach(PNG_FILE ${PNG_FILES})
    # Extract the filename from the full path
    get_filename_component(FILENAME ${PNG_FILE} NAME)

    # Copy the file to the target directory
    configure_file(
        ${PNG_FILE}
        ${TARGET_COLOUR_DIR}/${FILENAME}
        COPYONLY
    )
endforeach()


# Define the source directory containing .png files
set(SOURCE_DEPTH_DIR "${CMAKE_CURRENT_SOURCE_DIR}/depth")

# Define the target directory where the files will be copied
set(TARGET_DEPTH_DIR "${CMAKE_CURRENT_BINARY_DIR}/depth")

# Create the target directory if it does not exist
file(MAKE_DIRECTORY "${TARGET_DEPTH_DIR}")

# Get all .pgm files in the source directory
file(GLOB PGM_FILES "${SOURCE_DEPTH_DIR}/*.pgm")

# Iterate over each .png file and configure it
foreach(PGM_FILE ${PGM_FILES})
    # Extract the filename from the full path
    get_filename_component(FILENAME ${PGM_FILE} NAME)

    # Copy the file to the target directory
    configure_file(
        ${PGM_FILE}
        ${TARGET_DEPTH_DIR}/${FILENAME}
        COPYONLY
    )
endforeach()
