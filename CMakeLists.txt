cmake_minimum_required(VERSION 3.7...3.21)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS true)
set(CMAKE_INSTALL_PREFIX /usr)
project(NVelox VERSION 0.0
               DESCRIPTION "Neovim library"
               LANGUAGES C)

# Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/nvelox/*.c)
file(GLOB_RECURSE HEADER_FILES CONFIGURE_DEPENDS include/nvelox/*.h)
add_library(nvelox SHARED ${SRC_FILES})
set_target_properties(nvelox PROPERTIES PUBLIC_HEADER ${HEADER_FILES})
target_link_libraries(nvelox dl)

include(ExternalProject)

if(DEFINED ENV{NVELOX_NEOVIM_CMAKE_FLAGS})
    ExternalProject_Add(
        nvelox-neovim
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
        CMAKE_ARGS $ENV{NVELOX_NEOVIM_CMAKE_FLAGS}
        BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR> -t generated-sources
        INSTALL_COMMAND ""
        PREFIX nvelox-neovim
    )
else()
    ExternalProject_Add(
        nvim-deps
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim/third-party
        INSTALL_COMMAND ""
        PREFIX nvim-deps
    )
    ExternalProject_Add(
        nvelox-neovim
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
        CMAKE_ARGS -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_PREFIX_PATH=${CMAKE_CURRENT_BINARY_DIR}/nvim-deps/src/nvim-deps-build/usr
        BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR> -t generated-sources
        INSTALL_COMMAND ""
        PREFIX nvelox-neovim
    )
    add_dependencies(nvelox-neovim nvim-deps)
endif()

add_definitions(-DINCLUDE_GENERATED_DECLARATIONS)

ExternalProject_Get_property(nvelox-neovim BINARY_DIR)
include_directories(SYSTEM ${BINARY_DIR}/include)
include_directories(SYSTEM ${BINARY_DIR}/config)
include_directories(SYSTEM ${BINARY_DIR}/src/nvim/auto)

ExternalProject_Get_property(nvelox-neovim SOURCE_DIR)
include_directories(SYSTEM ${SOURCE_DIR}/src)

include(GNUInstallDirs)
install(TARGETS nvelox
        PUBLIC_HEADER
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox)

add_dependencies(nvelox nvelox-neovim)
