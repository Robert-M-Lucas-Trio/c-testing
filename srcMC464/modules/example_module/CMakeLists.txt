include(../CreateModule.cmake)

set(SOURCE_FILES 
    ExampleModule.c
    InternalToExampleModule.c
)
set(DEPENDENCIES "")

create_module(example_module "${SOURCE_FILES}" "${DEPENDENCIES}")