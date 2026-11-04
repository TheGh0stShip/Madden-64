#include "types.h"

typedef struct LinkedStateE2490 {
    u8 pad00[0x14];
    s32 flags;
} LinkedStateE2490;

typedef struct StateObjectE2490 {
    u8 pad00[0x24];
    LinkedStateE2490* state;
} StateObjectE2490;

typedef struct TaskE2490 {
    u8 pad00[8];
    StateObjectE2490* owner;
    s32 elapsed;
    s32 result;
} TaskE2490;

extern u16 D_8008799C;
extern s32 D_800861B8[];
extern s32 D_800717F0;
extern TaskE2490* D_80087910;
extern s16* D_8008951C;
extern s16 D_800717FC[];
extern u16 D_8008712C;

extern s32 func_80093F0C(void);
extern void func_80034D30(s32, s32, s32);
extern s32 func_80032E00(s32, s32);
extern void func_800E08C0(void);
extern TaskE2490* func_8002FEA4(void (*)(void), s32, s32);

void func_800E2490(StateObjectE2490* object) {
    u16 index;
    TaskE2490* task;

    if (func_80093F0C() != 0) {
        func_80034D30(0x1101, 2, 0);
    }
    index = D_8008799C;
    D_800861B8[0] = func_80032E00(0, 0xA000);
    D_800717F0 = 0xFE2C0001;
    object->state->flags |= 0x10000;
    task = func_8002FEA4(func_800E08C0, 5, 1);
    D_80087910 = task;
    task->owner = object;
    task->elapsed = 0;
    D_8008951C = &D_800717FC[index];
    task->result = 0;
    D_8008712C = D_8008799C;
    if (D_8008799C < 11) {
        D_8008799C++;
    } else {
        D_8008799C = 0;
    }
    object->state->flags &= ~0x10;
}
