cmake_minimum_required(VERSION 3.7...3.21)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS true)

project(NVelox VERSION 0.0
               DESCRIPTION "Neovim library"
               LANGUAGES C)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/nvelox/*.c)
add_library(nvelox SHARED ${SRC_FILES})
