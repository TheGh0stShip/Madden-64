#include "types.h"

typedef struct LinkedStateE2160 {
    u8 pad00[0x14];
    s32 flags;
} LinkedStateE2160;

typedef struct StateObjectE2160 {
    u8 pad00[0x24];
    LinkedStateE2160* state;
} StateObjectE2160;

typedef struct TaskE2160 {
    u8 pad00[0xC];
    s32 step;
} TaskE2160;

extern volatile s32 D_80088500;
extern u16 D_800892FC;
extern u16* D_8008951C;
extern u16 D_8008794A;
extern s32 D_800861B8[];
extern s8 D_800857B0[];
extern s32 D_800717F4;

extern s32 func_800301E0(TaskE2160*, s32);
extern void func_80036464(s32, volatile s32*);
extern void func_800363F4(u16, u16, s32);
extern void func_800A1A84(s32);
extern void func_80034858(s32);
extern void func_800E0A68(void);
extern void func_8003018C(TaskE2160*, void (*)(void));
extern void func_800344E8(LinkedStateE2160*, s32, s32, s32);

void func_800E2160(TaskE2160* task) {
    s32 step;
    s32 index;
    StateObjectE2160* object;
    s32 mode;

    step = func_800301E0(task, 1);
    index = func_800301E0(task, 2);
    if (!(step & 1)) {
        D_80088500 = step;
        mode = 2;
        func_80036464(mode, &D_80088500);
        func_800363F4(D_800892FC, D_8008951C[(u16)index],
                     D_800861B8[D_8008794A]);
        D_800857B0[D_8008794A] = D_8008951C[(u16)index];
        task->step = step + 1;
        return;
    }

    if (step == D_80088500) {
        object = (StateObjectE2160*)func_800301E0(task, 0);
        if (!(object->state->flags & 0x100000)) {
            if (step == 1) {
                func_800A1A84(0x1101);
            }
            func_80034858(D_800861B8[D_8008794A]);
            D_800717F4 = 1;
            func_8003018C(task, func_800E0A68);
            if ((u16)index == 0) {
                func_800344E8(object->state, D_800861B8[D_8008794A], 0xFE00, 0);
            }
            task->step = step + 1;
        }
    }
}
