cmake_minimum_required(VERSION 3.13)

macro(create_module module_name source_files dependencies)
    set(DEPENDENCIES ${dependencies} PARENT_SCOPE)

    set(PREFIXED_SOURCES "")
    foreach(src ${source_files})
        list(APPEND PREFIXED_SOURCES "src/${src}")
    endforeach()

    string(REPLACE "/" "___" escaped_module_name "${module_name}")

    add_library(${escaped_module_name} STATIC 
        ${PREFIXED_SOURCES}
    )

    get_filename_component(config_file_dir ${CONFIG_FILE} DIRECTORY)
    get_filename_component(config_file_name ${CONFIG_FILE} NAME)

    target_include_directories(${escaped_module_name}
        PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/public/${module_name}
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/public
            ${CMAKE_CURRENT_SOURCE_DIR}/private
            ${config_file_dir}
    )

    target_compile_options(${escaped_module_name} PRIVATE
        -include ${config_file_name}
    )


    set(PUBLIC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/public")
    set(MOD_DIR "${CMAKE_CURRENT_BINARY_DIR}/public/${module_name}")

    # Copy all files from public to public/module_name at build time
    add_custom_target("copy_public_${escaped_module_name}" ALL
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_CURRENT_BINARY_DIR}/public
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/public
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/public/${module_name}
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/public ${CMAKE_CURRENT_BINARY_DIR}/public/${module_name}
        COMMENT "Copying public headers to mod directory"
    )

    add_dependencies(${escaped_module_name} "copy_public_${escaped_module_name}")
endmacro()