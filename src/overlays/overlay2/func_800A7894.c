#include "types.h"

typedef struct {
    u8 pad00[0x34];
    char *names[1];
} NameTable;

typedef struct {
    u8 pad00[0x60];
    NameTable *table;
} Context;

Context *func_800DD60C(void);
void func_8002E65C(char *dst, char *src);

void func_800A7894(s32 index, s32 mode, char *dst) {
    NameTable *table = func_800DD60C()->table;

    if (mode == 0) {
        func_8002E65C(dst, *(char **)((u8 *)table + (index << 2) + 0x34));
    }
}
