cmake_minimum_required(VERSION 3.10)
project(MyProject C)                  


set(EXAMPLE_MODULE_DIR "src/example_module")

set(EXAMPLE_SOURCE_FILES
    ${EXAMPLE_MODULE_DIR}/src/ExampleModule.c
    ${EXAMPLE_MODULE_DIR}/src/InternalToExampleModule.c
)

add_executable(my_project 
    ${EXAMPLE_SOURCE_FILES}
    src/main.c
) 