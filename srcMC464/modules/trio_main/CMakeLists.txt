include(../CreateModule.cmake)

set(SOURCE_FILES Main.c)
set(DEPENDENCIES 
    example_module
    example_module/example_submodule
)

create_module(trio_main "${SOURCE_FILES}" "${DEPENDENCIES}")
