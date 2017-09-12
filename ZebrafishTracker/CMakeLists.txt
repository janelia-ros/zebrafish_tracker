cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMakeModules )

project( ZebrafishTracker )

set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

find_package( FlyCapture REQUIRED )
MESSAGE( STATUS "FLYCAPTURE_INCLUDE_DIRS: " ${FLYCAPTURE_INCLUDE_DIRS} )
MESSAGE( STATUS "FLYCAPTURE_LIBRARIES: " ${FLYCAPTURE_LIBRARIES} )
include_directories( ${FLYCAPTURE_INCLUDE_DIRS} )
add_executable(ZebrafishTracker ${PROJECT_SOURCE_DIR}/src/ZebrafishTracker.cpp)
target_link_libraries( ZebrafishTracker ${FLYCAPTURE_LIBRARIES} )

# find_package( OpenCV REQUIRED )
# include_directories( ${OpenCV_INCLUDE_DIRS} )
# add_executable( analyze.out analyze.cpp )
# target_link_libraries( analyze.out ${OpenCV_LIBS} )
