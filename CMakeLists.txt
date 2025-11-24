cmake_minimum_required(VERSION 3.10)
project(MyProject C)                  

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(my_project 
    ${EXAMPLE_SOURCE_FILES}
    main.c
) 

add_subdirectory(srcMC464/example_module)
add_subdirectory(srcMC464/trio_main)


target_link_libraries(my_project PRIVATE example_module trio_main)

