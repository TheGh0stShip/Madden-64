#include "types.h"

s32 func_800E289C(void *collection, u8 *identifier);

void overlay5_string_identifier_advance(
    void *collection,
    u8 *identifier
) {
    while (func_800E289C(collection, identifier) != 0) {
        (*identifier)++;
        if (*identifier == ':') {
            *identifier = 'A';
        }
    }
}
