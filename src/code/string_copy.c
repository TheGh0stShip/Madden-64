#include "types.h"

char* func_8002E65C(char* destination, const char* source) {
    char* current = destination;

    *destination = *source;
    while (*source != '\0') {
        source++;
        current++;
        *current = *source;
    }
    return destination;
}
