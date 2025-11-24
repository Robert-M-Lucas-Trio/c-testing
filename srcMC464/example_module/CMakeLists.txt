add_library(example_module STATIC
    src/ExampleModule.c
    src/InternalToExampleModule.c
)

target_include_directories(example_module
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/public
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/private
)
