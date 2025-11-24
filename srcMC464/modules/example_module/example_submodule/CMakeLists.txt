include(../../CreateModule.cmake)

set(SOURCE_FILES "ExampleModule.c")
set(DEPENDENCIES "")

create_module(example_module/example_submodule "${SOURCE_FILES}" "${DEPENDENCIES}")