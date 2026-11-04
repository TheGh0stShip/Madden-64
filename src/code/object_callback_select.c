#include "types.h"

extern s32 func_8005BE8C(u8 *owner);
extern void func_8005BFE0(void);
extern void func_8005BC20(void);

void func_8005B68C(u8* owner) {
    u8* state = *(u8**)(owner + 0x1A8);

    if (*(u32*)(state + 0x10) != 0) {
        if (*(u32*)(owner + 0x50) != 0 && func_8005BE8C(owner) != 0) {
            *(void (**)(void))(state + 0xC) = func_8005BFE0;
        } else {
            *(void (**)(void))(state + 0xC) = func_8005BC20;
        }
    }
    *(u32*)(owner + 0x9C) = 0;
}
