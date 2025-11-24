cmake_minimum_required(VERSION 3.10)
project(MyProject C)                  

add_executable(my_project 
    ${EXAMPLE_SOURCE_FILES}
    src/main.c
) 

add_subdirectory(src/example_module)
target_link_libraries(my_project PRIVATE example_module) 