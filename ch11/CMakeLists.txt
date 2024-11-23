cmake_minimum_required(VERSION 3.28)
project(loop_closure)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set( CMAKE_BUILD_TYPE "Release" )
# set( CMAKE_CXX_FLAGS "-std=c++11 -O3" )

# opencv
# find_package( OpenCV 3.1 REQUIRED )
find_package(OpenCV REQUIRED)

set( DBoW3_INCLUDE_DIRS "/usr/local/include" )
set( DBoW3_LIBS "/usr/local/lib/libDBoW3.so" )

add_executable( feature_training feature_training.cpp )
target_include_directories(feature_training PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries( feature_training PRIVATE ${OpenCV_LIBS} ${DBoW3_LIBS} )

add_executable( loop_closure loop_closure.cpp )
target_include_directories(loop_closure PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries( loop_closure PRIVATE ${OpenCV_LIBS} ${DBoW3_LIBS} )

add_executable( gen_vocab gen_vocab_large.cpp )
target_include_directories(gen_vocab PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries( gen_vocab PRIVATE ${OpenCV_LIBS} ${DBoW3_LIBS} )


# Define the source directory containing .png files
set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/data")

# Define the target directory where the files will be copied
set(TARGET_DIR "${CMAKE_CURRENT_BINARY_DIR}/data")

# Create the target directory if it does not exist
file(MAKE_DIRECTORY "${TARGET_DIR}")

# Get all .png files in the source directory
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

# Define the source directory containing .gz files
set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

# Define the target directory where the files will be copied
set(TARGET_DIR "${CMAKE_CURRENT_BINARY_DIR}")

# Create the target directory if it does not exist
file(MAKE_DIRECTORY "${TARGET_DIR}")

# Get all .gz files in the source directory
file(GLOB GZ_FILES "${SOURCE_DIR}/*.gz")

# Iterate over each .gz file and configure it
foreach(GZ_FILE ${GZ_FILES})
    # Extract the filename from the full path
    get_filename_component(FILENAME ${GZ_FILE} NAME)

    # Copy the file to the target directory
    configure_file(
        ${GZ_FILE}
        ${TARGET_DIR}/${FILENAME}
        COPYONLY
    )
endforeach()
