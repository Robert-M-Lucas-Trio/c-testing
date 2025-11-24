add_library(example_module
    src/ExampleModule.c
    src/InternalToExampleModule.c
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

target_include_directories(example_module
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/public
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/private
)
