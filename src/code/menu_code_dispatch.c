#include "types.h"

extern u16 func_8002C304(u16 owner);
extern s16 func_800282C8(void* entry, u16 code);
extern s16 func_8002836C(u16 owner, u16 code);
extern u8* D_8006B9DC;

s16 func_80023F94(u16 owner, u16 code) {
    if ((u16)(code - 0x21) < 6) {
        return func_8002836C(owner, code);
    }
    return func_800282C8(D_8006B9DC + func_8002C304(owner) * 12, code);
}
