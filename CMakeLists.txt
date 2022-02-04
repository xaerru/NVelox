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
message("$ENV{NVELOX_NEOVIM_CMAKE_FLAGS}")
ExternalProject_Add(
    nvelox-neovim
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
    CMAKE_ARGS $ENV{NVELOX_NEOVIM_CMAKE_FLAGS}
    INSTALL_COMMAND ""
    PREFIX nvelox-neovim
)

ExternalProject_Get_property(nvelox-neovim BINARY_DIR)
include_directories(${BINARY_DIR}/include)
include_directories(${BINARY_DIR}/config)

ExternalProject_Get_property(nvelox-neovim SOURCE_DIR)
include_directories(${SOURCE_DIR}/src)

include(GNUInstallDirs)
install(TARGETS nvelox
        PUBLIC_HEADER
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox)

add_dependencies(nvelox nvelox-neovim)
