cmake_minimum_required(VERSION 3.13)
project(MyProject C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(TARGET_BOARD_H "config.h")

add_executable(my_project 
    main.c
)

# Add config.h
target_include_directories(my_project PRIVATE config)
set(CONFIG_FILE config.h)
target_compile_options(my_project PRIVATE
    -include ${CONFIG_FILE}
)

set(MODULE_PATHS
    "trio_main"
    "example_module"
)

include(srcMC464/IncludeModules.cmake)
add_modules(${MODULE_PATHS})

