# build with debug option
cmake .. -DCMAKE_BUILD_TYPE=debug 



# CMakeLists.txt template

```
cmake_minimum_required(VERSION 2.8)

project(your_project_name)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(CMAKE_CXX_FLAGS_DEBUG " -Wall -Werror -g -O0 ")
set(CMAKE_C_FLAGS_DEBUG " -Wall -Werror -g -O0 ")
set(CMAKE_CXX_FLAGS_RELEASE " -Wall -Werror -O3 ")
set(CMAKE_C_FLAGS_RELEASE " -Wall -Werror -O3 ")
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif ()

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
# define dnn lib path
set(DNN_PATH "~/dnn/")
set(APPSDK_PATH "~/ppuser/")

set(DNN_LIB_PATH ${DNN_PATH}/lib)
set(BPU_libs dnn cnn_intf )

include_directories(${DNN_PATH}/include
                    ${APPSDK_PATH}/include)
#link_directories should be in front of add_executable 
link_directories(${DNN_LIB_PATH}
                ${APPSDK_PATH}/lib)

add_executable(user_app main.cc)
target_link_libraries(user_app
                      ${BPU_libs}
                      pthread
                      rt
                      dl)
```


# cross platform build
export CC=${LINARO_GCC_ROOT}/bin/aarch64-linux-gnu-gcc
export CXX=${LINARO_GCC_ROOT}/bin/aarch64-linux-gnu-g++
cmake .. -D CMAKE_BUILD_TYPE=Debug 
