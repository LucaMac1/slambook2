cmake_minimum_required(VERSION 3.28)
project(imageBasics)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OpenCV REQUIRED)

add_executable(imageBasics imageBasics.cpp)
target_include_directories(imageBasics PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries(imageBasics PRIVATE ${OpenCV_LIBS})

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/ubuntu.png")
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/ubuntu.png
        ${CMAKE_CURRENT_BINARY_DIR}/ubuntu.png
        COPYONLY
    )
else()
    message(WARNING "ubuntu.png does not exist. Skipping configuration.")
endif()

add_executable(undistortImage undistortImage.cpp)
target_include_directories(undistortImage PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries(undistortImage PRIVATE ${OpenCV_LIBS})

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/distorted.png")
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/distorted.png
        ${CMAKE_CURRENT_BINARY_DIR}/distorted.png
        COPYONLY
    )
else()
    message(WARNING "distorted.png does not exist. Skipping configuration.")
endif()
