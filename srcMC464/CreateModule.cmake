cmake_minimum_required(VERSION 3.13)

macro(create_module module_name source_files dependencies)
    set(DEPENDENCIES ${dependencies} PARENT_SCOPE)

    set(PREFIXED_SOURCES "")
    foreach(src ${source_files})
        list(APPEND PREFIXED_SOURCES "src/${src}")
    endforeach()

    string(REPLACE "/" "___" escaped_module_name "${module_name}")

    add_library(${escaped_module_name} STATIC ${PREFIXED_SOURCES})

    get_filename_component(config_file_dir ${CONFIG_FILE} DIRECTORY)
    get_filename_component(config_file_name ${CONFIG_FILE} NAME)

    target_include_directories(${escaped_module_name}
        PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/public
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/public/${module_name}
            ${CMAKE_CURRENT_SOURCE_DIR}/private
            ${config_file_dir}
    )

    target_compile_options(${escaped_module_name} PRIVATE
        -include ${config_file_name}
    )
endmacro()