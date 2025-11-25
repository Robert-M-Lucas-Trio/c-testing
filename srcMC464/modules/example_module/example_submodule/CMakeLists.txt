include(../../CreateModule.cmake)

set(SOURCE_FILES "ExampleSubmodule.c")
set(DEPENDENCIES "")

create_module(example_module/example_submodule "${SOURCE_FILES}" "${DEPENDENCIES}")