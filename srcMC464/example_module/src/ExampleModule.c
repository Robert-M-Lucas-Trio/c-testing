#include "example_module/ExampleModule.h"

#include <stdio.h>

#include "InternalToExampleModule.h"

void function_to_do_something(void) {
    printf("%d", get_data().x);
}

