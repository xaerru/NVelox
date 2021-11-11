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
    nvim
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
    CONFIGURE_COMMAND ""
    BUILD_COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim && make CMAKE_BUILD_TYPE=Release -j 4
    INSTALL_COMMAND sudo make install
)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/nvelox/*.c)
file(GLOB_RECURSE HEADER_FILES CONFIGURE_DEPENDS include/nvelox/*.h)

add_library(nvelox SHARED ${SRC_FILES})
set_target_properties(nvelox PROPERTIES PUBLIC_HEADER ${HEADER_FILES})

install(TARGETS nvelox
        PUBLIC_HEADER
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox)

add_subdirectory(external/luaconfig)
