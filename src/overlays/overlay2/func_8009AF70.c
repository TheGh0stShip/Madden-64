#include "types.h"

typedef struct {
    u8 pad00[2];
    u16 id;
} Item;

typedef struct {
    u8 pad00[5];
    u8 kind;
    u8 pad06[2];
} StatFormat;

extern Item *D_800C5094;
extern StatFormat D_800BFFE0[];

void func_800167FC(s16, char *);
void func_8002E65C(char *, char *);
char *func_8003AA28(u16);
void func_8003E850(s32, char *);
s32 func_800D20A0(char *, s32, u8);

void func_8009AF70(s32 index, s32 stat, char *dst) {
    u32 value;
    u8 kind;

    if (stat == 0) {
        func_8002E65C(dst, func_8003AA28(D_800C5094[index].id));
        return;
    }
    value = func_800D20A0(func_8003AA28(D_800C5094[index].id), 0, D_800BFFE0[stat - 1].kind) & 0xFFFF;
    kind = D_800BFFE0[stat - 1].kind;
    if (kind != 1) {
        if (kind != 0) {
            value = value * 100 / 253;
        }
        func_800167FC(value, dst);
    } else {
        func_8003E850(value, dst);
    }
}
