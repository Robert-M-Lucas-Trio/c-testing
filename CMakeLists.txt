cmake_minimum_required(VERSION 3.13)
project(MyProject C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(TARGET_BOARD_H "config.h")

add_executable(my_project 
    main.c
)

# Add config.h
target_include_directories(my_project PRIVATE config)
get_filename_component(CONFIG_FILE "config/config.h" ABSOLUTE)
target_compile_options(my_project PRIVATE
    -include ${CONFIG_FILE}
)

# Add modules
set(MODULE_PATHS
    "trio_main"
)
add_subdirectory(srcMC464)

