cmake_minimum_required(VERSION 3.13)
project(MyProject C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_executable(target main.c)

# Config
include(config.cmake)
include(srcMC464/BaseConfig.cmake)

# Add modules
set(MODULE_PATHS "trio_main")
add_subdirectory(srcMC464)

