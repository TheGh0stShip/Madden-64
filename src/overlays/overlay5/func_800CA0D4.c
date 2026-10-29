#include "types.h"

typedef struct StateCA0D4 {
    u8 pad0[0x24];
    s32 field24;
    s32 field28;
    s32 field2C;
    s32 field30;
    u8 pad34[0xC];
    s32 field40;
    s32 field44;
} StateCA0D4;

extern void* D_8008512C;
extern void* D_80085134;
extern void* D_8008B25C;
extern void func_800D5D28(void*);
extern void func_800D628C(void*);
extern void func_800D57CC(void);
extern void func_80032F3C(s32, void*);
extern StateCA0D4* func_800DD634(void);
extern void func_8001F848(s32, s32, s32);
extern void func_8001F81C(s32, s32);

void func_800CA0D4(void* arg) {
    StateCA0D4* state;

    func_800D5D28(arg);
    func_800D628C(arg);
    func_800D57CC();
    func_80032F3C(0, D_8008512C);
    func_80032F3C(0, D_80085134);
    func_80032F3C(0, D_8008B25C);
    state = func_800DD634();
    state->field24 = 0;
    state->field28 = 0;
    state->field2C = 0;
    state->field30 = 0;
    state->field40 = 0;
    state->field44 = 0;
    func_8001F848(0, 0, 1);
    func_8001F848(1, 1, 0);
    func_8001F81C(0, 1);
    func_8001F81C(1, 0);
}
