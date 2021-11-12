cmake_minimum_required(VERSION 3.7...3.21)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS true)
project(NVelox VERSION 0.0
               DESCRIPTION "Neovim library"
               LANGUAGES C)

include(ExternalProject)
include(GNUInstallDirs)

ExternalProject_Add(
    NVIM_DEPS
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim/third-party
    INSTALL_COMMAND ""
)

ExternalProject_Add(
    nvim
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
    CMAKE_ARGS -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_PREFIX_PATH=${CMAKE_CURRENT_BINARY_DIR}/NVIM_DEPS-prefix/src/NVIM_DEPS-build/usr/
    INSTALL_COMMAND ""
)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/nvelox/*.c)
file(GLOB_RECURSE HEADER_FILES CONFIGURE_DEPENDS include/nvelox/*.h)

add_library(nvelox SHARED ${SRC_FILES})
set_target_properties(nvelox PROPERTIES PUBLIC_HEADER ${HEADER_FILES})

install(TARGETS nvelox
        PUBLIC_HEADER
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox)

add_subdirectory(external/luaconfig)

add_dependencies(nvim NVIM_DEPS)
add_dependencies(nvelox nvim)
add_dependencies(nvelox-lua nvelox)
