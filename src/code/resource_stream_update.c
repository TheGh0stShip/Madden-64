#include "types.h"

s8 func_80016C18(s16);

void resource_stream_update(s16 value, char *buffer) {
    s16 remaining;
    char *output;

    remaining = value;
    output = buffer;
    if (value < 0) {
        *output = '-';
        output += 1;
        remaining = -value;
    }
    if (remaining >= 10000) {
        *output = func_80016C18((s16) (remaining / 10000));
        output += 1;
        remaining %= 10000;
        goto emit_thousands;
    }
    if (remaining >= 1000) {
emit_thousands:
        *output = func_80016C18((s16) (remaining / 1000));
        output += 1;
        remaining %= 1000;
        goto emit_hundreds;
    }
    if (remaining >= 100) {
emit_hundreds:
        *output = func_80016C18((s16) (remaining / 100));
        output += 1;
        remaining %= 100;
        goto emit_tens;
    }
    if (remaining >= 10) {
emit_tens:
        *output = func_80016C18((s16) (remaining / 10));
        output += 1;
        remaining %= 10;
    }
    output[0] = func_80016C18(remaining);
    output[1] = 0;
}
