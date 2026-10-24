#include "types.h"

extern u8 D_80085040[];
extern s8 D_800884A3[];

s32 func_800D9084(u8* object) {
    register u8* state __asm__("$5") = object;

    if ((*(u16*)(state + 0x28) & 1) == 0) {
        register u32 type __asm__("$6") = state[0x65];

        if (type != 0) {
            s32 group = state[0x1E] ^ 1;
            register u8* groups __asm__("$4") = D_80085040;
            u8* group_entry = groups + group * 88;
            register s32 index __asm__("$3") = D_800884A3[type];

            *(s32*)(state + 0x9C) =
                *(s32*)(group_entry + index * 4);
        } else {
            register s32 zero __asm__("$0");

            *(s32*)(state + 0x9C) = zero;
        }
        *(s32*)(state + 0x90) = 1;
        *(s32*)(state + 0x98) = -1;
        *(s32*)(state + 0xA4) = 0;
        *(s32*)(state + 0xA0) = 0;
        *(s32*)(state + 0x8C) = 0;
        *(s32*)(state + 0x94) = state[0x67];
    }
    return 0;
}
