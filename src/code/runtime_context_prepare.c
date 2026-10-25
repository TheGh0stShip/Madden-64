#include "types.h"

extern u16 D_800724D8;
extern s16 D_800892FC;
extern void func_80000438(void);
extern s32 func_800356C4(void* address, u16 value);
extern void* func_8003489C(void* context);
extern void func_800348D0(void* context);

void* func_80033AA8(void* context, void* secondary) {
    register void* context_saved __asm__("$16");
    register void* secondary_saved __asm__("$17");
    void* result;

    secondary_saved = secondary;
    context_saved = context;
    D_800892FC = func_800356C4((void*)func_80000438, D_800724D8);
    result = func_8003489C(context_saved);
    func_800348D0(secondary_saved);
    return result;
}
