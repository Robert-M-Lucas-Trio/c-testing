cmake_minimum_required(VERSION 3.13)

function(add_modules module_paths)
    # Add all libraries and get their dependencies
    set(INTERDEPENDENCIES "")
    foreach(module_path IN LISTS module_paths)
        set(DEPENDENCIES "")

        add_subdirectory("srcMC464/${module_path}")
        get_filename_component(module_name ${module_path} NAME)
        target_link_libraries(my_project PRIVATE ${module_name})

        # Add config file to module
        target_include_directories(${module_name} PRIVATE config)
        target_compile_options(${module_name} PRIVATE
            -include ${CONFIG_FILE}
        )
        
        foreach (dependency IN LISTS DEPENDENCIES)    
            list(APPEND INTERDEPENDENCIES "${module_path}:${dependency}")
        endforeach()
    endforeach()

    # Link libraries to eachother
    foreach(item IN LISTS INTERDEPENDENCIES)
        string(REPLACE ":" ";" item "${item}")
        list(GET item 0 link_to)
        list(GET item 1 link_from)
        target_link_libraries(${link_to} PRIVATE ${link_from})
    endforeach()
endfunction()
