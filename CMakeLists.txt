cmake_minimum_required(VERSION 3.13)
project(MyProject C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_executable(target main.c)

# -- Config

# Add config.h
target_include_directories(target PRIVATE config)
get_filename_component(CONFIG_FILE "config/config.h" ABSOLUTE)
target_compile_options(target PRIVATE
    -include ${CONFIG_FILE}
)

# CMake config
include(srcMC464/BaseConfig.cmake)
include(config.cmake)

# -- Add modules
set(MODULE_PATHS 
    trio_main
)
add_subdirectory(srcMC464)

