cmake_minimum_required(VERSION 3.28)
project(examples)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Sophus REQUIRED)
find_package(Pangolin REQUIRED)

add_executable(trajectoryError trajectoryError.cpp)
target_include_directories(trajectoryError PUBLIC ${Pangolin_INCLUDE_DIRS})
target_link_libraries(trajectoryError PRIVATE ${Pangolin_LIBRARIES} Sophus::Sophus)

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/estimated.txt")
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/estimated.txt
        ${CMAKE_CURRENT_BINARY_DIR}/estimated.txt
        COPYONLY
    )
else()
    message(WARNING "estimated.txt does not exist. Skipping configuration.")
endif()

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/groundtruth.txt")
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/groundtruth.txt
        ${CMAKE_CURRENT_BINARY_DIR}/groundtruth.txt
        COPYONLY
    )
else()
    message(WARNING "groundtruth.txt does not exist. Skipping configuration.")
endif()
