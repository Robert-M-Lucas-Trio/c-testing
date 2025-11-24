include(../CreateModule.cmake)

set(SOURCE_FILES
    Main.c
)

create_module("trio_main" ${SOURCE_FILES} "example_module")