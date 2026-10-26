#include "types.h"

extern s32 D_800734E8;
extern void *D_800734F0[];
extern u8 D_8007A530[];
extern u16 D_8007A534;
extern u8 D_80000400[];

extern u16 func_800356C4(void *source, s32 size);
extern void func_80036268(u16 handle, s32 selection, void *resource);
extern s32 func_80035598(u16 handle, s32 selection);
extern void func_8004F158(void *resource, s32 value);
extern void func_80046DA8(void *resource, s32 value);

void audio_output_select(s32 index, s32 selection)
{
    s32 saved_index = index;
    s32 saved_selection = selection;
    if (D_800734E8 == 0) {
        D_8007A534 = func_800356C4(D_80000400, 0x48);
        D_800734E8 = 1;
    }
    if (D_8007A530[saved_index] != saved_selection) {
        void *resource = D_800734F0[saved_index];
        D_8007A530[saved_index] = saved_selection;
        func_80036268(D_8007A534, saved_selection, *(void **)resource);
    }
    {
        s32 value = func_80035598(D_8007A534, saved_selection);
        {
            register void ***base __asm__("$3") = D_800734F0;
            void ***slot = base + saved_index;
            func_8004F158(**slot, value);
            func_80046DA8(**slot, value);
        }
    }
}
