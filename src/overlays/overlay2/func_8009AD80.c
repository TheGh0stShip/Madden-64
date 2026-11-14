#include "types.h"

extern u8 D_800C4EDE;
extern char D_8007A298[];
extern char D_80001AF4[];

void func_800167FC(u8 value, char *buffer);
void func_8002E688(char *destination, char *source);
void func_8001EC20(s32 arg0, s32 arg1);

void func_8009AD80(s32 arg0, s32 arg1)
{
    char *buffer;
    u8 raw;
    u8 value;

    raw = D_800C4EDE;
    if (raw >= 50) {
        value = 49;
    } else {
        value = raw;
    }

    buffer = D_8007A298;
    func_800167FC(value, buffer);
    func_8002E688(buffer, D_80001AF4);
    if (arg0 != 0) {
        func_8001EC20(arg0, arg1);
    }
}
