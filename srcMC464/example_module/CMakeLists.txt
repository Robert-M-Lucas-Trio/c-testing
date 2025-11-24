include(../CreateModule.cmake)

set(SOURCE_FILES
    ExampleModule.c
    InternalToExampleModule.c
)

create_module("trio_main" ${SOURCE_FILES} "example_module")