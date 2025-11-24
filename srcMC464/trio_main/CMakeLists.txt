add_library(trio_main STATIC
    src/Main.c
)

target_include_directories(trio_main
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/public
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/private
)

set(DEPENDENCIES "example_module" PARENT_SCOPE)