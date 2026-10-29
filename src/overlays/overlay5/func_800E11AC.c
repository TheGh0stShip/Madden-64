#include "types.h"

typedef struct Overlay5StatusSource {
    u8 pad0[0x13];
    s8 index;
} Overlay5StatusSource;

extern void func_80030C74(u32* flags);
extern void func_80030B9C(s32 index, u32* flags);
extern s16 func_800E0944(u32 flags);

s32 func_800E11AC(Overlay5StatusSource* source) {
    struct {
        u32 flags;
    } result = { 0 };
    s32 index = source->index;

    if (index == -1) {
        func_80030C74(&result.flags);
    } else {
        func_80030B9C(index, &result.flags);
    }
    if (result.flags & 2) {
        goto return_sixteen;
    }
    if (func_800E0944(result.flags) != 0x10) {
        return 0x11;
    }
return_sixteen:
    return 0x10;
}
