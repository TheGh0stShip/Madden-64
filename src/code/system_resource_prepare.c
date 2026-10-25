#include "types.h"

typedef struct SystemEntry {
    s16 value;
    u8 pad[0xD6];
} SystemEntry;

extern s16 D_8008616C;
extern SystemEntry D_80088B78[];
extern s32 func_800356C4(s32 selector, s32 argument);
extern void func_80016A14(s32 index);

void func_80015C80(s32 unused0, s32 unused1, s32 unused2,
                   s32 selector, s32 argument) {
    s16 index;

    D_8008616C = func_800356C4(selector, argument);
    for (index = 0; index < 2; index++) {
        D_80088B78[index].value = 0;
    }
    func_80016A14(0);
}
