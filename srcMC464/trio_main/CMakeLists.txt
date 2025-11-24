add_library(trio_main OBJECT
    src/Main.c
)

target_include_directories(trio_main
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/public
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/private
)
