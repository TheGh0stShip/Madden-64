#include "types.h"

extern void func_800167FC(s16 value, char *buffer);
extern s16 func_8004DF94(const char *text);

void percent_suffix_append(char *buffer, s16 value)
{
    s16 length;

    func_800167FC(value, buffer);
    length = func_8004DF94(buffer);
    buffer[length] = '%';
    buffer[length + 1] = '\0';
}
