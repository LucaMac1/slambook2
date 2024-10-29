cmake_minimum_required(VERSION 3.28)
project(SlamProject2)

# Use ExternalProject to manage third-party libraries
include(ExternalProject)

# Option to build third-party libraries separately
option(BUILD_THIRDPARTY "Build third-party libraries" OFF)

if (BUILD_THIRDPARTY)
    # Add third-party libraries as external projects
    ExternalProject_Add(Sophus
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/Sophus
    )

    ExternalProject_Add(Pangolin
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/Pangolin
    )

    ExternalProject_Add(Ceres
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/ceres-solver
    )

    ExternalProject_Add(DBoW3
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/DBoW3
    )

    ExternalProject_Add(g2o
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/g2o
    )

    ExternalProject_Add(googletest
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/googletest
    )
endif()
