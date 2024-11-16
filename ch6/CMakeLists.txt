cmake_minimum_required(VERSION 3.28)
project(Chapter6)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

find_package(Eigen3 3.3 REQUIRED NO_MODULE)
find_package(OpenCV REQUIRED)
find_package(Ceres REQUIRED)
find_package(G2O REQUIRED)

add_executable(gaussNewton gaussNewton.cpp)
target_include_directories(gaussNewton PUBLIC ${OpenCV_INCLUDE_DIRS} ${CERES_INCLUDE_DIRS} ${G2O_INCLUDE_DIRS} Eigen3::Eigen)
target_link_libraries(gaussNewton PRIVATE ${OpenCV_LIBS})

add_executable(ceresCurveFitting ceresCurveFitting.cpp)
target_include_directories(ceresCurveFitting PUBLIC ${OpenCV_INCLUDE_DIRS} ${CERES_INCLUDE_DIRS} ${G2O_INCLUDE_DIRS} Eigen3::Eigen)
target_link_libraries(ceresCurveFitting PRIVATE ${OpenCV_LIBS} ${CERES_LIBRARIES})

# add_executable(g2oCurveFitting g2oCurveFitting.cpp)
# target_include_directories(g2oCurveFitting PUBLIC ${OpenCV_INCLUDE_DIRS} ${CERES_INCLUDE_DIRS} ${G2O_INCLUDE_DIRS})
# target_link_libraries(g2oCurveFitting PRIVATE ${OpenCV_LIBS} ${G2O_CORE_LIBRARY} ${G2O_STUFF_LIBRARY})
