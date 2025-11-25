 # c-testing

# Modules (MD test)
- [Example Module](src/example_module/docs/example_module.md)
	- [Example Submodule](srcMC464/modules/example_module/example_submodule/docs/example_submodule.md)
- [Trio Main](srcMC464/modules/trio_main/docs/trio_main.md)

# Explaination
- All the files outside srcMC464 would be the files for the Linux port / simulator / flex-7 / individual boards
    - srcMC464 would be brought in as a git subrepository for all of these
- Every folder in srcMC464/modules is a module
    - Submodules are also possible e.g. example_module/example_submodule
    - See the CMakeLists.txt of trio_main for how these are included
- The CMakeLists.txt outside of srcMC464 chooses the modules it wants available to it
- The CMakeLists.txt inside srcMC464 builds those modules
    - It also builds their dependencies but doesn't expose them outside of srcMC464
    - It shouldn't need to be changed
- The CMakeLists.txt in each module defines the files to be built, and which other modules it depends on
    - This is where C files could be conditionally included / performance options set / warnings toggled / etc.
    - Each module is a static library
- The config/config.h file is the globally included header

# Results
- In each module, only the modules it depends on are available to it
    - Outside of srcMC464 where only trio_main is available, despite trio_main, example_module, and example_module/example_submodule being built
    - In example_module, example_module/example_submodule is not available despite it being built
- Inside a module, the headers in private and public are available, whereas from other modules only public headers are available

# ?
- Is this insane (does it tie us to CMake too much?)
- Is the usability ok
