cmake_minimum_required(VERSION 3.7...3.21)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS true)
project(nvelox-lua VERSION 0.0
               DESCRIPTION "Lua wrapper for NVelox"
               LANGUAGES C)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/*.c)

add_library(nvelox-lua SHARED ${SRC_FILES})

find_library(NVELOX nvelox)
if(NVELOX)
    target_link_libraries(nvelox-lua PUBLIC ${NVELOX})
endif()
