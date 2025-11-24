cmake_minimum_required(VERSION 3.13)

function(create_module module_name source_files dependencies)
    set(PREFIXED_SOURCES "")
    foreach(src ${source_files})
        list(APPEND PREFIXED_SOURCES "src/${src}")
    endforeach()

    add_library(${module_name} STATIC ${PREFIXED_SOURCES})

    target_include_directories(trio_main
        PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/public
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/public/${module_name}
            ${CMAKE_CURRENT_SOURCE_DIR}/private
    )

    set(DEPENDENCIES ${dependencies} PARENT_SCOPE)
endfunction()