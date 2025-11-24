cmake_minimum_required(VERSION 3.13)

if (NOT DEFINED MODULE_PATHS)
    message(FATAL_ERROR "MODULE_PATHS not set")
endif()
if (NOT DEFINED CONFIG_FILE)
    message(FATAL_ERROR "CONFIG_FILE not set")
endif()

message(STATUS "Explicit modules: ${MODULE_PATHS}")

# Mark modules to be exported
set(ALL_MODULE_PATHS "")
foreach(module_path IN LISTS MODULE_PATHS)
    list(APPEND ALL_MODULE_PATHS "${module_path}!")
endforeach()

# Add all libraries and get their dependencies
set(INTERDEPENDENCIES "")
list(LENGTH ALL_MODULE_PATHS len)
set(index 0)
while(len GREATER index)
    set(DEPENDENCIES "")

    # Check if module should be exported (otherwise it is a dependency)
    list(GET ALL_MODULE_PATHS ${index} module_path)
    string(REGEX MATCH "!$" export_module "${module_path}")
    if (export_module)
        string(LENGTH "${module_path}" str_len)
        math(EXPR new_len "${str_len} - 1")
        string(SUBSTRING "${module_path}" 0 ${new_len} module_path)
    endif()

    # Create module
    add_subdirectory("modules/${module_path}")

    # Export
    if (export_module)
        string(REPLACE "/" "___" escaped_module_name "${module_path}")
        message(STATUS "Exporting ${escaped_module_name}")
        target_link_libraries(my_project PUBLIC ${escaped_module_name})
    endif()
    
    # Handle dependencies
    foreach (dependency IN LISTS DEPENDENCIES)
        # Set to be linked once all modules are defined
        list(APPEND INTERDEPENDENCIES "${module_path}:${dependency}")
        
        # Queue module creation if not already in queue
        set(already_in_list "")
        foreach (module_path IN LISTS ALL_MODULE_PATHS)
            string(REGEX MATCH "!$" export_module "${module_path}")
            if (export_module)
                string(LENGTH "${my_string}" str_len)
                math(EXPR new_len "${str_len} - 1")
                string(SUBSTRING "${module_path}" 0 ${new_len} module_path)
            endif()
            if (module_path STREQUAL dependency)
                set(already_in_list "TRUE")
            endif()
        endforeach()
        if (NOT already_in_list)
            message(STATUS "Module '${dependency}' added by '${module_path}'")
            list(APPEND ALL_MODULE_PATHS ${dependency}) 
        endif()
    endforeach()

    list(LENGTH ALL_MODULE_PATHS len)
    math(EXPR index "${index} + 1")
endwhile()

# Link libraries to eachother
foreach(item IN LISTS INTERDEPENDENCIES)
    string(REPLACE ":" ";" item "${item}")
    list(GET item 0 link_to)
    list(GET item 1 link_from)

    string(REPLACE "/" "___" escaped_link_from "${link_from}")

    message(STATUS "Linking ${escaped_link_from} -> ${link_to}")
    target_link_libraries(${link_to} PRIVATE ${escaped_link_from})
endforeach()
