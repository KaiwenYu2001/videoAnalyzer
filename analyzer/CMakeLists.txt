cmake_minimum_required(VERSION 3.9)
project(coroutine_test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_BUILD_TYPE "Debug")


#设定头文件路径
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/thirdParty/Ubuntu/libevent-2.1.12-stable/include/)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/thirdParty/Ubuntu/libevent-2.1.12-stable/build/include/)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/thirdParty/Ubuntu/jsoncpp/include)

#设定链接库的路径（一般使用第三方非系统目录下的库）
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/thirdParty/Ubuntu/libevent-2.1.12-stable/build/lib)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/thirdParty/Ubuntu/jsoncpp/lib)


 
#生成可执行文件
add_executable(main main.cpp)

target_link_libraries(main event)
target_link_libraries(main jsoncpp)
