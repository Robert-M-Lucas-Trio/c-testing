set(EXAMPLE_SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/ExampleModule.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/InternalToExampleModule.c
)

target_sources(my_project PRIVATE ${EXAMPLE_SOURCE_FILES})