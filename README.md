# c-testing

# Modules (MD test)
- [Example Module](src/example_module/docs/example_module.md)
	- [Example Submodule](srcMC464/modules/example_module/example_submodule/docs/example_submodule.md)
- [Trio Main](srcMC464/modules/trio_main/docs/trio_main.md)

# Explaination
- All the files outside srcMC464 would be the files for the Linux port / simulator / flex-7 / individual boards
- Every folder in srcMC464/modules is a module
- The CMakeLists.txt outside of srcMC464 chooses the modules it wants available to it
- The CMakeLists.txt inside srcMC464 fetches those modules and resolved dependencies
- The CMakeLists.txt in each module defines the files to be built, and which other modules it depends on

# Results
- In each module, only the modules it depends on are available to it - this includes outside of srcMC464 where only trio_main is available, despite trio_main, example_module, and example_module/example_submodule being built
- Inside a module, the headers in private and the headers in public are available, whereas from other modules on public headers are available

# Questions
- Is this insane (does it tie us to CMake too much?)
- Is the usability ok

# TODO
- Add an example of board-specific module behaviour

