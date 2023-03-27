CMAKE_MINIMUM_REQUIRED(VERSION 3.10)
# SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
option(EXAMPLE "shall we complie example" on)
PROJECT(Cputools LANGUAGES CXX C)

message("-- system processor: ${CMAKE_SYSTEM_PROCESSOR}")

set(CMAKE_CXX_STANDARD 11)

SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb ")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

MESSAGE(STATUS ${CMAKE_SYSTEM_NAME})

include_directories(
    include
)

set(EXEC_NAME StepMote)

file(GLOB main_srcs 
    *.cpp
)

add_executable(${EXEC_NAME}
    ${main_srcs}
)

TARGET_LINK_LIBRARIES(${EXEC_NAME}
    pthread
)

install(TARGETS ${EXEC_NAME}
        RUNTIME DESTINATION /usr/sbin)
