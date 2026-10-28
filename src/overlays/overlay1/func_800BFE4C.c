#include "types.h"

typedef struct {
    u8 pad00[8];
    s32 mask;
} Group;

typedef struct {
    u8 pad00[0x21];
    u8 slot;
    u8 pad22[6];
    u16 flags;
} Actor;

extern s8 D_8008B2A8[];
extern Group *D_80072720[];
extern Actor *D_8008A058;

s32 func_800BD694(void);
void func_800BD734(s32);
void func_800BD79C(s32);

s32 func_800BFE4C(Actor *arg0) {
    Group *group = D_80072720[D_8008B2A8[arg0->slot & 0xBF]];
    s32 bits = func_800BD694();

    if (arg0->flags & 8) {
        if (arg0 != D_8008A058 && (bits & group->mask)) {
            func_800BD79C(arg0->slot & 0xBF);
        }
    } else if (bits & group->mask) {
        func_800BD734(arg0->slot & 0xBF);
    }
    return 0;
}
