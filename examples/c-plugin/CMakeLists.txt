cmake_minimum_required(VERSION 3.7...3.21)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS true)
set(CMAKE_INSTALL_PREFIX $ENV{HOME}/.local/share/nvelox/plugins/c)
project(nvelox-c VERSION 0.1
               DESCRIPTION "Example nvelox C plugin"
               LANGUAGES C)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS src/*.c)

add_definitions(-DINCLUDE_GENERATED_DECLARATIONS)

find_package(NVelox REQUIRED)

add_library(c-plugin SHARED ${SRC_FILES})

target_link_libraries(c-plugin nvelox)
target_include_directories(c-plugin PUBLIC ${NVelox_INCLUDE_DIRECTORIES})

set_target_properties(c-plugin PROPERTIES LIBRARY_OUTPUT_NAME c-plugin
                                          PREFIX "")

install(TARGETS c-plugin)
