#include "types.h"

extern void *D_80064BA8;
extern void *D_800782F0;
extern void *D_800782F4;
extern void **D_800782F8;
extern u32 D_80087940;
extern void func_8000D684(void *object);
extern void func_80033258(void *pointer);
extern void func_80032F3C(s32 value, void *pointer);

void object_scene_reset(void)
{
    u16 index;

    while (D_80064BA8 != 0) {
        func_8000D684(D_80064BA8);
    }
    if (D_800782F0 != 0) {
        func_80033258(D_800782F0);
        D_800782F0 = 0;
    }
    if (D_800782F4 != 0) {
        func_80033258(D_800782F4);
        D_800782F4 = 0;
    }
    if (D_800782F8 != 0) {
        index = 0;
        do {
            if (D_800782F8[index] != 0) {
                func_80033258(D_800782F8[index]);
                D_800782F8[index] = 0;
            }
            index++;
        } while (index < 17);
        func_80032F3C(0, D_800782F8);
        D_800782F8 = 0;
    }
    D_80087940 = 0;
}
