cmake_minimum_required(VERSION 3.13)

if (NOT DEFINED MODULE_PATHS)
    message(FATAL_ERROR "MODULE_PATHS not set")
endif()
if (NOT DEFINED CONFIG_FILE)
    message(FATAL_ERROR "CONFIG_FILE not set")
endif()

# Add all libraries and get their dependencies
set(INTERDEPENDENCIES "")
foreach(module_path IN LISTS MODULE_PATHS)
    set(DEPENDENCIES "")

    # Link
    add_subdirectory("${module_path}")
    target_link_libraries(my_project PRIVATE ${module_name})

    foreach (dependency IN LISTS DEPENDENCIES)
        list(APPEND INTERDEPENDENCIES "${module_path}:${dependency}")
    endforeach()
endforeach()

# Link libraries to eachother
foreach(item IN LISTS INTERDEPENDENCIES)
    string(REPLACE ":" ";" item "${item}")
    list(GET item 0 link_to)
    list(GET item 1 link_from)

    string(REPLACE "/" "___" escaped_link_from "${link_from}")
    message("Linking ${link_from}/public + ${escaped_link_from} -> ${link_to}")
    target_include_directories(${link_to} PRIVATE "${link_from_path}/public")
    target_link_libraries(${link_to} PRIVATE ${escaped_link_from})
endforeach()
