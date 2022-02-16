cmake_minimum_required(VERSION 3.7...3.21)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS true)
project(
  NVelox
  VERSION 0.0
  DESCRIPTION "Neovim library"
  LANGUAGES C)

# Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
  message(
    FATAL_ERROR
      "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles."
  )
endif()

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/nvelox/*.c)
file(GLOB_RECURSE HEADER_FILES CONFIGURE_DEPENDS include/nvelox/*.h)
add_library(nvelox SHARED ${SRC_FILES})
target_link_libraries(nvelox dl)

option(NVELOX_USE_BUNDLED "Use bundled dependencies" ON)
if(NVELOX_USE_BUNDLED)
  file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/nvim-deps)
  file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/nvelox-neovim)
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1 ${CMAKE_COMMAND}
            ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim/third-party
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/nvim-deps)
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1 ${CMAKE_COMMAND} --build
            ${CMAKE_CURRENT_BINARY_DIR}/nvim-deps)

  execute_process(
    COMMAND
      ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1 ${CMAKE_COMMAND}
      ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
      -DCMAKE_PREFIX_PATH=${CMAKE_CURRENT_BINARY_DIR}/nvim-deps/usr
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/nvelox-neovim)
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1 ${CMAKE_COMMAND} --build
            ${CMAKE_CURRENT_BINARY_DIR}/nvelox-neovim -t generated-sources)
else()
  file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/nvelox-neovim)
  execute_process(
    COMMAND
      ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1 ${CMAKE_COMMAND}
      ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim
      $ENV{NVELOX_NEOVIM_CMAKE_FLAGS}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/nvelox-neovim)

  execute_process(
    COMMAND ${CMAKE_COMMAND} -E env CLICOLOR_FORCE=1 ${CMAKE_COMMAND} --build
            ${CMAKE_CURRENT_BINARY_DIR}/nvelox-neovim -t generated-sources)
endif()

add_definitions(-DINCLUDE_GENERATED_DECLARATIONS)

set(NVELOX_NEOVIM_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/nvelox-neovim)
set(NVELOX_NEOVIM_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/nvelox-neovim)

target_include_directories(
  nvelox
  PUBLIC $<BUILD_INTERFACE:${NVELOX_NEOVIM_BINARY_DIR}/include>
         $<BUILD_INTERFACE:${NVELOX_NEOVIM_BINARY_DIR}/config>
         $<BUILD_INTERFACE:${NVELOX_NEOVIM_BINARY_DIR}/src/nvim/auto>
         $<BUILD_INTERFACE:${NVELOX_NEOVIM_SOURCE_DIR}/src>
         $<INSTALL_INTERFACE:include/nvelox/nvim-include>
         $<INSTALL_INTERFACE:include/nvelox/nvim-config>
         $<INSTALL_INTERFACE:include/nvelox/nvim-auto>
         $<INSTALL_INTERFACE:include/nvelox>)

include(GNUInstallDirs)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/nvelox/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox)
install(
  DIRECTORY ${NVELOX_NEOVIM_SOURCE_DIR}/src/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox
  FILES_MATCHING
  PATTERN "*.h")
install(
  DIRECTORY ${NVELOX_NEOVIM_BINARY_DIR}/include/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox/nvim-include
  FILES_MATCHING
  PATTERN "*.h")
install(
  DIRECTORY ${NVELOX_NEOVIM_BINARY_DIR}/config/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox/nvim-config
  FILES_MATCHING
  PATTERN "*.h")
install(
  DIRECTORY ${NVELOX_NEOVIM_BINARY_DIR}/src/nvim/auto/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/nvelox/nvim-auto
  FILES_MATCHING
  PATTERN "*.h")

install(TARGETS nvelox EXPORT NVeloxConfig)

export(TARGETS nvelox FILE "${CMAKE_CURRENT_BINARY_DIR}/NVeloxConfig.cmake")

install(EXPORT NVeloxConfig
        DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/NVelox/cmake")
