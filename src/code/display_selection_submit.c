#include "types.h"

extern u16 D_80087954;
extern void func_8000BE80(s32 type);
extern void func_80044B90(u16 owner, u8 type, u16 value, u16 selection);

void func_8001F25C(s32 type, u16 selection, u16 value) {
    register s32 saved_type asm("$16") = type;
    register u16 saved_selection asm("$18") = selection;
    register u16 saved_value asm("$17") = value;

    func_8000BE80(saved_type);
    func_80044B90(D_80087954, saved_type, saved_value, saved_selection);
}
