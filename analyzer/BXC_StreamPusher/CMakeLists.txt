cmake_minimum_required(VERSION 3.1.3)

project(BXC_StreamPusher LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 11)

if("${CMAKE_BUILD_TYPE}" STREQUAL "")
  set(CMAKE_BUILD_TYPE "Debug")
endif()

message(STATUS "编译类型: ${CMAKE_BUILD_TYPE}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")

set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g2 -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

set(INCLUDE_DIR /usr/local/include)
set(LIB_DIR /usr/local/lib)

#set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/linux/include)
#set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/linux/lib)

include_directories("/usr/include/eigen3")
include_directories(${INCLUDE_DIR})
link_directories(${LIB_DIR})

# include and link dirs of cuda and tensorrt, you need adapt them if yours are different
# ============= cuda ============
find_package(CUDA REQUIRED)
include_directories(/usr/local/cuda/include)
link_directories(/usr/local/cuda/lib64)

# ============= tensorrt ============
if (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
  message("Embed_platform on")
  include_directories(/usr/include/aarch64-linux-gnu)
  link_directories(/usr/lib/aarch64-linux-gnu)
else()
  message("Embed_platform off")
  include_directories(/usr/include/x86_64-linux-gnu)
  link_directories(/usr/lib/x86_64-linux-gnu)

  include_directories(/usr/local/TensorRT-8.6.1.6/include)
  link_directories(/usr/local/TensorRT-8.6.1.6/lib)
endif()

# ============ opencv ============
find_package(OpenCV)
include_directories(${OpenCV_INCLUDE_DIRS})

# ============ pushStream ============
set(ffmpeg_libs_DIR /usr/lib/x86_64-linux-gnu)
set(ffmpeg_headers_DIR /usr/include/x86_64-linux-gnu)

add_library( avcodec SHARED IMPORTED)
add_library( avfilter SHARED IMPORTED )
add_library( swresample SHARED IMPORTED )
add_library( swscale SHARED IMPORTED )
add_library( avformat SHARED IMPORTED )
add_library( avutil SHARED IMPORTED )
 
set_target_properties( avcodec PROPERTIES IMPORTED_LOCATION ${ffmpeg_libs_DIR}/libavcodec.so )
set_target_properties( avfilter PROPERTIES IMPORTED_LOCATION ${ffmpeg_libs_DIR}/libavfilter.so.7 )
set_target_properties( swresample PROPERTIES IMPORTED_LOCATION ${ffmpeg_libs_DIR}/libswresample.so )
set_target_properties( swscale PROPERTIES IMPORTED_LOCATION ${ffmpeg_libs_DIR}/libswscale.so )
set_target_properties( avformat PROPERTIES IMPORTED_LOCATION ${ffmpeg_libs_DIR}/libavformat.so )
set_target_properties( avutil PROPERTIES IMPORTED_LOCATION ${ffmpeg_libs_DIR}/libavutil.so )


# =========== bytetrack lib ===========
include_directories(${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/bytetrack/include)
file(GLOB_RECURSE SRCS01 ${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/bytetrack/src/*.cpp)
add_library(bytetrack SHARED ${SRCS01})
target_link_libraries(bytetrack cudart nvinfer ${OpenCV_LIBS})

# ============= yolov8 lib =============
include_directories(${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/yolo/include)
include_directories(${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/yolo/plugin)
file(GLOB_RECURSE SRCS02 ${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/yolo/src/*.cpp ${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/yolo/src/*.cu ${PROJECT_SOURCE_DIR}/yolo-bytetrack-tensorrt/yolo/plugin/*.cu)
cuda_add_library(yolo_infer SHARED ${SRCS02})
target_link_libraries(yolo_infer nvinfer cudart ${OpenCV_LIBS})


include_directories( ${ffmpeg_headers_DIR} )
link_directories(${ffmpeg_libs_DIR} )


add_executable(BXC_StreamPusher
        StreamPusher/StreamPusher.cpp
        StreamPusher/main.cpp
        )

# ======== main execute file ========
target_link_libraries(BXC_StreamPusher avformat avcodec avutil swscale swresample pthread)
target_link_libraries(BXC_StreamPusher bytetrack yolo_infer)
target_link_libraries(BXC_StreamPusher ${OpenCV_LIBS} avcodec avformat avutil swresample swscale swscale avfilter )
target_link_libraries(BXC_StreamPusher avformat avcodec avutil swscale swresample pthread)
