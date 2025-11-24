#include "../public/ExampleModule.h"

#include <stdio.h>

#include "../private/InternalToExampleModule.h"


void function_to_do_something(void) {
    printf("%d", get_data());
}