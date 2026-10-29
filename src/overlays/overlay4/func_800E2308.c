#include "types.h"

typedef struct Task Task;
struct Task {
    u8 pad00[0x10];
    s32 counter;
    u8 pad14[0x24 - 0x14];
    s32 handle;
};

extern u16 D_80088470;
extern u16 D_8008794A;
extern s32 D_800861B8[];
extern s32 func_800301E0(Task *task, s32 arg1);
extern void func_800E08C0(void);
extern void func_8003018C(Task *task, void (*entry)(void));
extern void func_800344E8(s32 handle, s32 arg1, s32 arg2, s32 arg3);
extern void func_800E0CFC(void);

void func_800E2308(Task *task) {
    u16 command;

    command = D_80088470;
    D_80088470 = 0;
    switch (command) {
    case 0:
        break;
    case 1:
        task->counter = (u16)func_800301E0(task, 2) + 1;
        D_8008794A ^= 1;
        func_8003018C(task, func_800E08C0);
        break;
    case 2:
        func_800344E8(((Task *)func_800301E0(task, 0))->handle, D_800861B8[D_8008794A], 0xFE00, 0);
        break;
    case 3:
        func_800E0CFC();
        break;
    }
}
